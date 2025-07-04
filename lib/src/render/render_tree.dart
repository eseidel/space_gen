import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/quirks.dart';
// Any code that depends on SchemaRenderer probably should be moved out
// of this file and into the schema_renderer.dart file.
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/string.dart';
import 'package:space_gen/src/types.dart';

String avoidReservedWord(String value) {
  if (isReservedWord(value)) {
    return '${value}_';
  }
  return value;
}

Never _unimplemented(String message, JsonPointer pointer) {
  throw UnimplementedError('$message at $pointer');
}

String _sharedPrefix(List<String> values) {
  final prefix = '${values.first.split('_').first}_';
  for (final value in values) {
    if (!value.startsWith(prefix)) {
      return '';
    }
  }
  return prefix;
}

/// Convert an enum value to a variable name.
String variableSafeName(Quirks quirks, String jsonName) {
  var escapedName = jsonName.replaceAll(' ', '_');
  escapedName = escapedName
      // These are kinda hacky for the GitHub spec which has +1 and -1 as names.
      .replaceAll('+', 'plus_')
      .replaceAll(RegExp('^-'), 'minus_')
      // Replace any remaining skewers with underscores.
      .replaceAll('-', '_')
      // ' is most commonly used as an apostrophe so just stripping it.
      .replaceAll("'", '')
      // Since jsonName is a raw string, it could have non-legal characters.
      // We need to escape them.
      // TODO(eseidel): Tweak this to make nicer names.
      .replaceAll(RegExp('[^a-zA-Z0-9_]'), '_');

  // This should probably only apply to enums?
  if (!quirks.screamingCapsEnums) {
    // Dart style uses camelCase.
    escapedName = toLowerCamelCase(escapedName);
  }
  // first char must be a letter.
  if (escapedName.isEmpty) {
    return 'a';
  }
  final isDigit = RegExp('[0-9]').hasMatch(escapedName[0]);
  if (isDigit) {
    escapedName = 'n$escapedName';
  }
  // camelFromScreamingCaps removes '_', so do the avoid last.
  return avoidReservedWord(escapedName);
}

Iterable<String> _commentedLines(String value) {
  final lines = value.split('\n');
  return lines.map((line) => '/// $line');
}

String? indentWithTrailingNewline(
  List<String> lines, {
  required int indent,
  bool extraTrailingNewline = false,
}) {
  if (lines.isEmpty) {
    return null;
  }
  final indentString = ' ' * indent;
  final maybeNewline = extraTrailingNewline ? '\n' : '';
  final joined = lines.join('\n$indentString').trimLeft();
  return '$joined$maybeNewline\n$indentString';
}

/// Doc comments are meant to be inserted right before the type declaration
/// *not* on a separate line.  They will add their own new-line at the end if
/// necessary and will match the passed in indent for any lines after the first
/// including after the trailing new-line.
String? createDocComment({required CommonProperties common, int indent = 0}) {
  final title = common.title;
  final body = common.description;
  final example = common.example;
  final examples = common.examples;
  return createDocCommentFromParts(
    title: title,
    body: body,
    example: example,
    examples: examples,
    indent: indent,
  );
}

String? createDocCommentFromParts({
  String? title,
  String? body,
  dynamic example,
  List<dynamic>? examples,
  int indent = 0,
}) {
  if (title == null && body == null && example == null && examples == null) {
    return null;
  }
  final lines = <String>[
    if (title != null) ..._commentedLines(title),
    if (body != null) ..._commentedLines(body),
    if (example != null) ..._commentedLines('example: $example'),
    if (examples != null)
      ...examples.expand((e) => _commentedLines('example: $e')),
  ];
  if (lines.isEmpty) {
    return null;
  }
  // Remove leading whitespace from just the first line.
  // This makes it easier to use from within a mustache template.
  return indentWithTrailingNewline(lines, indent: indent);
}

/// A class that can be converted to a template context.
// This only exists because RenderSchema handles both the conversion to
// templates as well as being the "type object", once we split out type
// objects we can simplify the RenderTree and this method moves into some
// sort of class that knows how to convert type objects into template contexts.
// ignore: one_member_abstracts
abstract class ToTemplateContext {
  Map<String, dynamic> toTemplateContext(SchemaRenderer context);
}

abstract class CanBeParameter implements ToTemplateContext {
  bool get isRequired;
  String dartParameterName(Quirks quirks);
  Iterable<String> get validationCalls;
}

// Could make this comparable to have a nicer sort for our test results.
@immutable
class Import extends Equatable {
  const Import(this.path, {this.asName});

  final String path;
  final String? asName;

  Map<String, dynamic> toTemplateContext() => {'path': path, 'asName': asName};

  @override
  List<Object?> get props => [path, asName];
}

bool isTopLevelComponent(JsonPointer pointer) {
  if (pointer.parts.length != 3) {
    return false;
  }
  final first = pointer.parts[0];
  final second = pointer.parts[1];
  return first == 'components' && second == 'schemas';
}

class SpecResolver {
  const SpecResolver(this.quirks);

  final Quirks quirks;

  RenderSchema? maybeRenderSchema(ResolvedSchema? schema) {
    if (schema == null) {
      return null;
    }
    return toRenderSchema(schema);
  }

  RenderSchema toRenderSchema(ResolvedSchema schema) {
    switch (schema) {
      case ResolvedEnum():
        return RenderEnum(
          common: schema.common,
          values: schema.values,
          names: RenderEnum.variableNamesFor(quirks, schema.values),
        );
      case ResolvedObject():
        return RenderObject(
          common: schema.common,
          properties: schema.properties.map(
            (name, value) => MapEntry(name, toRenderSchema(value)),
          ),
          additionalProperties: maybeRenderSchema(schema.additionalProperties),
          requiredProperties: schema.requiredProperties,
        );
      case ResolvedPod():
        return RenderPod(
          common: schema.common,
          type: schema.type,
          defaultValue: schema.defaultValue,
        );
      case ResolvedString():
        return RenderString(
          common: schema.common,
          defaultValue: schema.defaultValue,
          maxLength: schema.maxLength,
          minLength: schema.minLength,
          pattern: schema.pattern,
        );
      case ResolvedNumber():
        return RenderNumber(
          common: schema.common,
          defaultValue: schema.defaultValue,
          maximum: schema.maximum,
          minimum: schema.minimum,
          exclusiveMaximum: schema.exclusiveMaximum,
          exclusiveMinimum: schema.exclusiveMinimum,
          multipleOf: schema.multipleOf,
        );
      case ResolvedInteger():
        return RenderInteger(
          common: schema.common,
          defaultValue: schema.defaultValue,
          maximum: schema.maximum,
          minimum: schema.minimum,
          exclusiveMaximum: schema.exclusiveMaximum,
          exclusiveMinimum: schema.exclusiveMinimum,
          multipleOf: schema.multipleOf,
        );
      case ResolvedArray():
        var defaultValue = schema.defaultValue;
        // I don't think this is quite right.  OpenAPI does not show this fake
        // default in cases where the schema is being used as a parameter.
        if (defaultValue == null && quirks.allListsDefaultToEmpty) {
          defaultValue = List<dynamic>.empty();
        }
        return RenderArray(
          common: schema.common,
          items: toRenderSchema(schema.items),
          defaultValue: defaultValue,
          maxItems: schema.maxItems,
          minItems: schema.minItems,
          uniqueItems: schema.uniqueItems,
        );
      case ResolvedVoid():
        return RenderVoid(common: schema.common);
      case ResolvedUnknown():
        return RenderUnknown(common: schema.common);
      case ResolvedBinary():
        return RenderBinary(common: schema.common);
      case ResolvedOneOf():
        return RenderOneOf(
          common: schema.common,
          schemas: schema.schemas.map(toRenderSchema).toList(),
        );
      case ResolvedAllOf():
        // Generate a synthetic object type for allOf.
        final properties = <String, RenderSchema>{};
        for (final schema in schema.schemas) {
          final renderSchema = toRenderSchema(schema);
          if (renderSchema is RenderObject) {
            properties.addAll(renderSchema.properties);
          }
        }
        return RenderObject(common: schema.common, properties: properties);
      case ResolvedAnyOf():
        // Resolver already makes anyOf with 1 schema to just be that schema.
        // For multiple schemas, we just generate a oneOf, which is wrong.
        // anyOf means that at least one of the schemas must be valid.
        // Which presumably translates into a single schema with all properties
        // nullable?  Unclear.
        return RenderOneOf(
          common: schema.common,
          schemas: schema.schemas.map(toRenderSchema).toList(),
        );
      case ResolvedMap():
        return RenderMap(
          common: schema.common,
          valueSchema: toRenderSchema(schema.valueSchema),
        );
      case ResolvedEmptyObject():
        return RenderEmptyObject(common: schema.common);
      default:
        _unimplemented('Unknown schema: $schema', schema.pointer);
    }
  }

  RenderParameter toRenderParameter(ResolvedParameter parameter) {
    return RenderParameter(
      description: parameter.description,
      name: parameter.name,
      sendIn: parameter.sendIn,
      isRequired: parameter.isRequired,
      isDeprecated: parameter.isDeprecated,
      type: toRenderSchema(parameter.schema),
    );
  }

  RenderResponse toRenderResponse(ResolvedResponse response) {
    return RenderResponse(
      statusCode: response.statusCode,
      description: response.description,
      content: toRenderSchema(response.content),
    );
  }

  RenderRequestBody? toRenderRequestBody(ResolvedRequestBody? requestBody) {
    if (requestBody == null) {
      return null;
    }
    switch (requestBody.mimeType) {
      case MimeType.applicationJson:
        return RenderRequestBodyJson(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      case MimeType.applicationOctetStream:
        return RenderRequestBodyOctetStream(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
      case MimeType.textPlain:
        return RenderRequestBodyTextPlain(
          schema: toRenderSchema(requestBody.schema),
          description: requestBody.description,
          isRequired: requestBody.isRequired,
        );
    }
  }

  RenderSchema _determineReturnType(ResolvedOperation operation) {
    final responses = operation.responses;
    // Figure out how many different successful responses there are.
    final successful = responses.where(
      (e) => e.statusCode >= 200 && e.statusCode < 300,
    );
    if (successful.isEmpty) {
      return RenderVoid(
        common: CommonProperties.empty(
          snakeName: '${operation.snakeName}_response',
          pointer: operation.pointer,
        ),
      );
    }
    if (successful.length == 1) {
      return toRenderSchema(successful.first.content);
    }
    final renderSchemas = successful
        .expand((e) => [toRenderSchema(e.content)])
        .toList();
    // We don't implement hashCode/equals but rather equalsIgnoringName
    final distinctSchemas = <RenderSchema>{};
    for (final schema in renderSchemas) {
      if (!distinctSchemas.any((e) => e.equalsIgnoringName(schema))) {
        distinctSchemas.add(schema);
      }
    }
    // If there are multiple and they are different, generate a OneOf type.
    if (distinctSchemas.length > 1) {
      return RenderOneOf(
        // TODO(eseidel): Should this pass along description?
        common: CommonProperties.empty(
          snakeName: '${operation.snakeName}_response',
          pointer: operation.pointer,
        ),
        schemas: distinctSchemas.toList(),
      );
    }
    return distinctSchemas.first;
  }

  RenderOperation toRenderOperation(ResolvedOperation operation) {
    final returnType = _determineReturnType(operation);
    return RenderOperation(
      pointer: operation.pointer,
      snakeName: operation.snakeName,
      method: operation.method,
      path: operation.path,
      summary: operation.summary,
      description: operation.description,
      tags: operation.tags,
      parameters: operation.parameters.map(toRenderParameter).toList(),
      responses: operation.responses.map(toRenderResponse).toList(),
      requestBody: toRenderRequestBody(operation.requestBody),
      returnType: returnType,
    );
  }

  RenderPath toRenderPath(ResolvedPath pathItem) {
    return RenderPath(
      path: pathItem.path,
      operations: pathItem.operations.map(toRenderOperation).toList(),
    );
  }

  RenderTag toRenderTag(ResolvedTag tag) {
    return RenderTag(name: tag.name, description: tag.description);
  }

  RenderSpec toRenderSpec(ResolvedSpec spec) {
    return RenderSpec(
      serverUrl: spec.serverUrl,
      paths: spec.paths.map(toRenderPath).toList(),
      tagDefinitions: spec.tags.map(toRenderTag).toList(),
    );
  }
}

class RenderTag {
  const RenderTag({required this.name, required this.description});

  final String name;
  final String? description;
}

// Convert a resolved spec to a spec that can be rendered.
// This is the root of the render spec tree.
class RenderSpec {
  const RenderSpec({
    required this.serverUrl,
    required this.paths,
    required this.tagDefinitions,
  });

  /// The server url of the spec.
  final Uri serverUrl;

  /// The paths of the spec.
  final List<RenderPath> paths;

  final List<RenderTag> tagDefinitions;

  /// The endpoints of the spec.
  List<Endpoint> get endpoints => paths
      .expand(
        (p) => p.operations.map(
          (o) => Endpoint(operation: o, serverUrl: serverUrl),
        ),
      )
      .toList();

  /// Set of all endpoint tags in the spec.
  Set<String> get tags => endpoints.map((e) => e.tag).toSet();

  List<Api> get apis => tags.sorted().map((tag) {
    final description =
        tagDefinitions.firstWhereOrNull((e) => e.name == tag)?.description ??
        'Endpoints with tag $tag';
    return Api(
      description: description,
      snakeName: toSnakeCase(tag),
      endpoints: endpoints.where((e) => e.tag == tag).toList(),
    );
  }).toList();
}

/// A convenience class created for each operation within a path item
/// for compatibility with our existing rendering code.
// TODO(eseidel): Could remove this in favor of RenderOperation?
class Endpoint implements ToTemplateContext {
  const Endpoint({required this.operation, required this.serverUrl});

  /// The server url of the endpoint.
  final Uri serverUrl;

  /// The operation of the endpoint.
  final RenderOperation operation;

  /// The summary of the endpoint.
  String? get summary => operation.summary;

  /// The description of the endpoint.
  String? get description => operation.description;

  /// The method of the endpoint.
  Method get method => operation.method;

  String get path => operation.path;

  String get tag => operation.tags.firstOrNull ?? 'Default';

  String get snakeName => operation.snakeName;

  List<RenderParameter> get parameters => operation.parameters;

  RenderRequestBody? get requestBody => operation.requestBody;

  String get methodName => lowercaseCamelFromSnake(snakeName);

  Uri get uri => Uri.parse('$serverUrl$path');

  List<String> validationStatements(Quirks quirks) {
    final statements = <String>[];
    for (final parameter in parameters) {
      final dartName = parameter.dartParameterName(quirks);
      final isNullable = !parameter.isRequired;
      final nameCall = isNullable ? '$dartName?.' : '$dartName.';
      for (final call in parameter.validationCalls) {
        statements.add('$nameCall$call;');
      }
    }
    return statements;
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    // Parameters as passed to the Dart function call, including the request
    // body if it exists.
    final dartParameters = <CanBeParameter>[...parameters, ?requestBody];

    final responseSchema = operation.returnType;
    final returnType = responseSchema.typeName;
    final responseFromJson = responseSchema.fromJsonExpression(
      'jsonDecode(response.body)',
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );

    final namedParameters = dartParameters.where((p) => p.isRequired == false);
    final positionalParameters = dartParameters.where(
      (p) => p.isRequired == true,
    );

    // Only explicit parameters (not request body) need to be split by sendIn.
    final bySendIn = parameters.groupListsBy((p) => p.sendIn);
    final pathParameters = bySendIn[SendIn.path] ?? [];
    final queryParameters = bySendIn[SendIn.query] ?? [];
    final hasQueryParameters = queryParameters.isNotEmpty;
    final cookieParameters = bySendIn[SendIn.cookie] ?? [];
    if (cookieParameters.isNotEmpty) {
      _unimplemented(
        'Cookie parameters are not yet supported.',
        operation.pointer,
      );
    }
    final headerParameters = bySendIn[SendIn.header] ?? [];
    final hasHeaderParameters = headerParameters.isNotEmpty;

    final validationStatementsString = indentWithTrailingNewline(
      validationStatements(context.quirks),
      indent: 8,
      extraTrailingNewline: true,
    );

    Iterable<Map<String, dynamic>> toTemplateContexts(
      Iterable<CanBeParameter> parameters,
    ) => parameters.map((p) => p.toTemplateContext(context));

    // Endpoints could get summary and description from
    // *both* Path and Operation objects.  Unclear how we should display both.
    // Currently only displaying summary/description from the Operation.
    return {
      'endpoint_doc_comment': createDocCommentFromParts(
        title: summary,
        body: description,
        indent: 4,
      ),
      'methodName': methodName,
      'httpMethod': method.name,
      'path': path,
      'url': uri,
      // Parameters grouped for dart parameter generation.
      'positionalParameters': toTemplateContexts(positionalParameters),
      'hasNamedParameters': namedParameters.isNotEmpty,
      'namedParameters': toTemplateContexts(namedParameters),
      // Parameters grouped for call to server.
      'pathParameters': toTemplateContexts(pathParameters),
      'hasQueryParameters': hasQueryParameters,
      'queryParameters': toTemplateContexts(queryParameters),
      'hasHeaderParameters': hasHeaderParameters,
      'headerParameters': toTemplateContexts(headerParameters),
      'requestBody': requestBody?.toTemplateContext(context),
      'returnType': returnType,
      'responseFromJson': responseFromJson,
      'validationStatements': validationStatementsString,
    };
  }
}

/// The spec calls these tags, but the Dart openapi generator groups endpoints
/// by tag into an API class so we do too.
class Api {
  const Api({
    required this.snakeName,
    required this.endpoints,
    required this.description,
  });

  final String snakeName;
  final String description;
  final List<Endpoint> endpoints;

  String get className => '${toUpperCamelCase(snakeName)}Api';
  String get fileName => '${snakeName.toLowerCase()}_api';
}

class RenderPath {
  const RenderPath({required this.path, required this.operations});

  /// The path of the resolved path.
  final String path;

  /// The operations of the resolved path.
  final List<RenderOperation> operations;
}

class RenderOperation {
  const RenderOperation({
    required this.pointer,
    required this.method,
    required this.path,
    required this.snakeName,
    required this.parameters,
    required this.requestBody,
    required this.responses,
    required this.returnType,
    required this.tags,
    required this.summary,
    required this.description,
  });

  /// The method of the resolved operation.
  final Method method;

  final JsonPointer pointer;

  /// The path of the resolved operation.
  final String path;

  /// The snake name of the resolved operation.
  final String snakeName;

  /// The parameters of the resolved operation.
  final List<RenderParameter> parameters;

  /// The request body of the resolved operation.
  final RenderRequestBody? requestBody;

  /// The responses of the resolved operation.
  final List<RenderResponse> responses;

  /// The return type of the resolved operation.
  final RenderSchema returnType;

  /// The tags of the resolved operation.
  final List<String> tags;

  /// The summary of the resolved operation.
  final String? summary;

  /// The description of the resolved operation.
  final String? description;
}

abstract class RenderRequestBody implements CanBeParameter {
  const RenderRequestBody({
    required this.schema,
    required this.description,
    required this.isRequired,
  });

  /// The schema of the request body.
  final RenderSchema schema;

  /// The description of the request body.
  final String? description;

  /// Whether the request body is required.
  @override
  final bool isRequired;

  @override
  Iterable<String> get validationCalls => schema.validationCalls;

  @override
  String dartParameterName(Quirks quirks) =>
      // TODO(eseidel): Is there a name we can use instead of the typename?
      // Removing any template parameters from the type.
      schema.typeName.lowerFirst().split('<').first;
}

class RenderRequestBodyJson extends RenderRequestBody {
  const RenderRequestBodyJson({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final typeName = schema.typeName;
    final paramName = dartParameterName(context.quirks);
    // TODO(eseidel): Share code with Parameter.toTemplateContext.
    final isNullable = !isRequired;
    return {
      'request_body_doc_comment': createDocCommentFromParts(
        body: description,
        indent: 4,
      ),
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': isRequired,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': typeName,
      'nullableType': schema.nullableTypeName(context),
      'encodedBody': schema.toJsonExpression(
        paramName,
        context,
        dartIsNullable: isNullable,
      ),
    };
  }
}

class RenderRequestBodyOctetStream extends RenderRequestBody {
  const RenderRequestBodyOctetStream({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final paramName = dartParameterName(context.quirks);
    return {
      'request_body_doc_comment': createDocCommentFromParts(
        body: description,
        indent: 4,
      ),
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': isRequired,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': schema.typeName,
      'nullableType': schema.nullableTypeName(context),
      'encodedBody': paramName,
    };
  }
}

class RenderRequestBodyTextPlain extends RenderRequestBody {
  const RenderRequestBodyTextPlain({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final paramName = dartParameterName(context.quirks);
    return {
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': isRequired,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': schema.typeName,
      'nullableType': schema.nullableTypeName(context),
      'encodedBody': paramName,
    };
  }
}

class RenderResponse {
  const RenderResponse({
    required this.statusCode,
    required this.description,
    required this.content,
  });

  /// The status code of the resolved response.
  final int statusCode;

  /// The description of the resolved response.
  final String description;

  /// The resolved content of the resolved response.
  /// We only support json, so we only need a single content.
  final RenderSchema content;
}

abstract class RenderSchema extends Equatable implements ToTemplateContext {
  const RenderSchema({required this.common});

  final CommonProperties common;

  /// The snake name of the resolved schema.
  String get snakeName => common.snakeName;

  /// The pointer of the resolved schema.
  JsonPointer get pointer => common.pointer;

  /// The title of the resolved schema.
  String? get title => common.title;

  /// The description of the resolved schema.
  String? get description => common.description;

  /// Whether this schema is deprecated.
  bool get isDeprecated => common.isDeprecated;

  /// Whether this schema creates a new type and thus needs to be rendered.
  bool get createsNewType;

  /// The default value of this schema.
  dynamic get defaultValue;

  /// Whether the defaultValue can be const constructed.
  bool get defaultCanConstConstruct;

  bool hasNonConstDefaultValue(SchemaRenderer context) =>
      hasDefaultValue(context) && !defaultCanConstConstruct;

  Iterable<Import> get additionalImports => const [];

  // TODO(eseidel): This should be abstract and all classes should override.
  // This should include validations for the entire subtree of schemas
  // stopping at any branches that are new types since those can validate
  // themselves during construction.
  Iterable<String> get validationCalls => const [];

  /// Whether this schema only contains json types.
  bool get onlyJsonTypes;

  @override
  List<Object?> get props => [snakeName, pointer];

  // Unclear if this is an OpenApi generator quirk or desired behavior,
  // but openapi creates a new file for each top level component, even
  // if it's a simple type.  Matching this behavior for now.
  bool get hasExplicitName => isTopLevelComponent(pointer);

  String orDefaultExpression({
    required SchemaRenderer context,
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (jsonIsNullable && !dartIsNullable) {
      final defaultValue = defaultValueString(context);
      if (defaultValue == null) {
        throw StateError('No default value for nullable property: $this');
      }
      return ' ?? $defaultValue';
    }
    return '';
  }

  /// This is the resolved Dart type name for the schema.
  /// e.g. 'String', 'Uri', or the class name of a new type.
  String get typeName;

  /// This is the resolved Dart type name for the schema, with a ? if it is
  /// nullable.
  /// e.g. 'String?', 'Uri?', or the ClassName? of a new type.
  String nullableTypeName(SchemaRenderer context) {
    return typeName.endsWith('?') ? typeName : '$typeName?';
  }

  String equalsExpression(String name, SchemaRenderer context) =>
      'this.$name == other.$name';

  String jsonStorageType({required bool isNullable});

  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  });

  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  });

  /// The default value of this schema as a string.
  String? defaultValueString(SchemaRenderer context) {
    if (defaultValue == null) {
      return null;
    }
    if (defaultValue is String) {
      return quoteString(defaultValue as String);
    }
    return defaultValue.toString();
  }

  bool hasDefaultValue(SchemaRenderer context) => defaultValue != null;

  static bool maybeEqualsIgnoringName(RenderSchema? a, RenderSchema? b) {
    if (a == null && b == null) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }
    return a.equalsIgnoringName(b);
  }

  // This is a heuristic to help understand if two schemas are the same so we
  // can safely generate a single return value for a response.  We don't
  // currently support union response types.
  bool equalsIgnoringName(RenderSchema other) {
    if (runtimeType != other.runtimeType) {
      return false;
    }
    if (createsNewType != other.createsNewType) {
      return false;
    }
    // Ignoring pointer, snakeName, title, description and defaultValue.
    return true;
  }

  @override
  String toString() => '$runtimeType(snakeName: $snakeName, pointer: $pointer)';
}

// Plain old data types (string, number, boolean)
class RenderPod extends RenderSchema {
  const RenderPod({
    required super.common,
    required this.type,
    this.defaultValue,
  });

  /// The type of the resolved schema.
  final PodType type;

  @override
  final dynamic defaultValue;

  @override
  bool get onlyJsonTypes {
    return switch (type) {
      // Bool is already a json type.
      PodType.boolean => true,
      // These require serialization to a string.
      PodType.dateTime || PodType.uri || PodType.uriTemplate => false,
    };
  }

  @override
  bool get defaultCanConstConstruct {
    return switch (type) {
      PodType.dateTime || PodType.uri || PodType.uriTemplate => false,
      PodType.boolean => true,
    };
  }

  @override
  List<Object?> get props => [super.props, type, defaultValue];

  @override
  String get typeName {
    return switch (type) {
      PodType.boolean => 'bool',
      PodType.dateTime => 'DateTime',
      PodType.uri => 'Uri',
      PodType.uriTemplate => 'UriTemplate',
    };
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    return switch (type) {
      PodType.dateTime ||
      PodType.uri ||
      PodType.uriTemplate => isNullable ? 'String?' : 'String',
      PodType.boolean => isNullable ? 'bool?' : 'bool',
    };
  }

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    if (defaultValue == null) {
      return null;
    }
    return switch (type) {
      PodType.dateTime =>
        'DateTime.parse(${quoteString(defaultValue as String)})',
      PodType.uri => 'Uri.parse(${quoteString(defaultValue as String)})',
      PodType.uriTemplate =>
        'UriTemplate(${quoteString(defaultValue as String)})',
      PodType.boolean => defaultValue.toString(),
    };
  }

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    if (type == PodType.uriTemplate) const Import('package:uri/uri.dart'),
  ];

  @override
  bool get createsNewType => false;

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    return switch (type) {
      PodType.dateTime => '$nameCall.toIso8601String()',
      PodType.uri => '$nameCall.toString()',
      PodType.uriTemplate => '$nameCall.toString()',
      PodType.boolean => dartName,
    };
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final castedValue = '$jsonValue as $jsonType';
    switch (type) {
      case PodType.dateTime:
        if (jsonIsNullable) {
          return 'maybeParseDateTime($castedValue)$orDefault';
        }
        return 'DateTime.parse($castedValue)';
      case PodType.uri:
        if (jsonIsNullable) {
          return 'maybeParseUri($castedValue)$orDefault';
        }
        return 'Uri.parse($castedValue)';
      case PodType.uriTemplate:
        if (jsonIsNullable) {
          return 'maybeParseUriTemplate($castedValue)$orDefault';
        }
        return 'UriTemplate($castedValue)';
      case PodType.boolean:
        // 'as' has higher precedence than '??' so no parens are needed.
        return '$castedValue$orDefault';
    }
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderPod.toTemplateContext');

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderPod) &&
      type == other.type &&
      super.equalsIgnoringName(other);
}

abstract class RenderNewType extends RenderSchema {
  const RenderNewType({required super.common});

  /// Whether this new type creates a new type and thus needs to be rendered.
  @override
  bool get createsNewType => true;

  @override
  bool get onlyJsonTypes => false;

  /// The class name of the new type.
  String get className => camelFromSnake(snakeName);

  @override
  String get typeName => className;

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    return '$nameCall.toJson()';
  }
}

class RenderString extends RenderSchema {
  const RenderString({
    required super.common,
    required this.defaultValue,
    required this.maxLength,
    required this.minLength,
    required this.pattern,
  });

  @override
  final String? defaultValue;

  /// The maximum length of the string.
  final int? maxLength;

  /// The minimum length of the string.
  final int? minLength;

  /// The pattern to match the string against.
  final String? pattern;

  @override
  bool get defaultCanConstConstruct => true;

  @override
  List<Object?> get props => [super.props, defaultValue, maxLength, minLength];

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : 'String';

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    final value = defaultValue;
    return value == null ? null : quoteString(value);
  }

  @override
  bool get createsNewType => hasExplicitName;

  @override
  bool get onlyJsonTypes => !createsNewType;

  @override
  Iterable<String> get validationCalls {
    return [
      if (maxLength != null) 'validateMaximumLength($maxLength)',
      if (minLength != null) 'validateMinimumLength($minLength)',
      if (pattern != null) 'validatePattern(${quoteString(pattern!)})',
    ];
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'doc_comment': createDocComment(common: common),
    'typeName': typeName,
    'nullableTypeName': nullableTypeName(context),
  };

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'String?' : 'String';

  String newTypeFromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    final className = camelFromSnake(snakeName);
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final castedValue = '$jsonValue as $jsonType';
    return '$className.$jsonMethod($castedValue)$orDefault';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return newTypeFromJsonExpression(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final castedValue = '$jsonValue as $jsonType';
    return '$castedValue$orDefault';
  }

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return dartIsNullable ? '$dartName?.toJson()' : '$dartName.toJson()';
    }
    return dartName;
  }

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderString) &&
      defaultValue == other.defaultValue &&
      maxLength == other.maxLength &&
      minLength == other.minLength &&
      super.equalsIgnoringName(other);
}

abstract class RenderNumeric<T extends num> extends RenderSchema {
  const RenderNumeric({
    required super.common,
    required this.defaultValue,
    required this.maximum,
    required this.minimum,
    required this.exclusiveMaximum,
    required this.exclusiveMinimum,
    required this.multipleOf,
  });

  @override
  final T? defaultValue;

  /// The maximum value of the number.
  final T? maximum;

  /// The minimum value of the number.
  final T? minimum;

  /// The exclusive maximum value of the number.
  final T? exclusiveMaximum;

  /// The exclusive minimum value of the number.
  final T? exclusiveMinimum;

  /// The multiple of value of the number.
  final T? multipleOf;

  @override
  List<Object?> get props => [
    super.props,
    defaultValue,
    maximum,
    minimum,
    exclusiveMaximum,
    exclusiveMinimum,
    multipleOf,
    hasExplicitName,
  ];

  @override
  bool get createsNewType => hasExplicitName;

  @override
  bool get onlyJsonTypes => !createsNewType;

  // Careful, this might not be true depending on validations.
  @override
  bool get defaultCanConstConstruct => true;

  @override
  String? defaultValueString(SchemaRenderer context) {
    if (createsNewType) {
      final typeName = camelFromSnake(snakeName);
      return '$typeName($defaultValue)';
    }
    return defaultValue?.toString();
  }

  @override
  Iterable<String> get validationCalls {
    return [
      if (maximum != null) 'validateMaximum($maximum)',
      if (minimum != null) 'validateMinimum($minimum)',
      if (exclusiveMaximum != null)
        'validateExclusiveMaximum($exclusiveMaximum)',
      if (exclusiveMinimum != null)
        'validateExclusiveMinimum($exclusiveMinimum)',
      if (multipleOf != null) 'validateMultipleOf($multipleOf)',
    ];
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    if (!createsNewType) {
      throw StateError(
        '$runtimeType.toTemplateContext called for non-new type: $this',
      );
    }
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'dartType': '$T',
      'jsonType': jsonStorageType(isNullable: false),
      'nullableTypeName': nullableTypeName(context),
      'jsonToDartCall': jsonToDartCall(jsonIsNullable: false),
    };
  }

  String jsonToDartCall({required bool jsonIsNullable});

  String newTypeFromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    final className = camelFromSnake(snakeName);
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final castedValue = '$jsonValue as $jsonType';
    return '$className.$jsonMethod($castedValue)$orDefault';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return newTypeFromJsonExpression(
        jsonValue,
        context,
        jsonIsNullable: jsonIsNullable,
        dartIsNullable: dartIsNullable,
      );
    }
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final toDartCall = jsonToDartCall(jsonIsNullable: jsonIsNullable);
    return '($jsonValue as $jsonType)$toDartCall$orDefault';
  }

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    if (createsNewType) {
      return dartIsNullable ? '$dartName?.toJson()' : '$dartName.toJson()';
    }
    return dartName;
  }

  @override
  bool equalsIgnoringName(RenderSchema other) =>
      (other is RenderNumeric<T>) &&
      defaultValue == other.defaultValue &&
      maximum == other.maximum &&
      minimum == other.minimum &&
      exclusiveMaximum == other.exclusiveMaximum &&
      exclusiveMinimum == other.exclusiveMinimum &&
      multipleOf == other.multipleOf &&
      super.equalsIgnoringName(other);
}

class RenderNumber extends RenderNumeric<double> {
  const RenderNumber({
    required super.common,
    required super.defaultValue,
    required super.maximum,
    required super.minimum,
    required super.exclusiveMaximum,
    required super.exclusiveMinimum,
    required super.multipleOf,
  });

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : 'double';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'num?' : 'num';

  @override
  String jsonToDartCall({required bool jsonIsNullable}) =>
      jsonIsNullable ? '?.toDouble()' : '.toDouble()';
}

class RenderInteger extends RenderNumeric<int> {
  const RenderInteger({
    required super.common,
    required super.defaultValue,
    required super.maximum,
    required super.minimum,
    required super.exclusiveMaximum,
    required super.exclusiveMinimum,
    required super.multipleOf,
  });

  @override
  String get typeName => createsNewType ? camelFromSnake(snakeName) : 'int';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'int?' : 'int';

  // jsonType and dartType are both int, so we don't need to do anything.
  @override
  String jsonToDartCall({required bool jsonIsNullable}) => '';
}

class RenderObject extends RenderNewType {
  const RenderObject({
    required super.common,
    required this.properties,
    this.additionalProperties,
    this.requiredProperties = const [],
  });

  /// The properties of the resolved schema.
  final Map<String, RenderSchema> properties;

  /// The additional properties of the resolved schema.
  final RenderSchema? additionalProperties;

  /// The required properties of the resolved schema.
  final List<String> requiredProperties;

  @override
  List<Object?> get props => [
    super.props,
    properties,
    additionalProperties,
    requiredProperties,
  ];

  @override
  dynamic get defaultValue => null;

  // We could do something smarter here, to determine if the object has a
  // const constructor, but it's not worth the complexity for now.
  @override
  bool get defaultCanConstConstruct => false;

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'Map<String, dynamic>?' : 'Map<String, dynamic>';
  }

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    if (properties.values.any((p) => p.isDeprecated))
      const Import('package:meta/meta.dart'),
  ];

  // isNullable means it's optional for the server, use nullable storage.
  bool propertyDartIsNullable({
    required String jsonName,
    required SchemaRenderer context,
    required bool propertyHasDefaultValue,
  }) {
    final inRequiredList = requiredProperties.contains(jsonName);
    if (context.quirks.nonNullableDefaultValues) {
      return !inRequiredList && !propertyHasDefaultValue;
    }
    return !inRequiredList;
  }

  @visibleForTesting
  String argumentLine(
    String jsonName,
    RenderSchema property,
    SchemaRenderer context, {
    required bool isRequired,
  }) {
    final line = StringBuffer();
    if (property.isDeprecated) {
      line.write('@deprecated ');
    }
    if (isRequired) {
      line.write('required ');
    }
    final dartName = variableSafeName(context.quirks, jsonName);
    if (property.hasNonConstDefaultValue(context)) {
      final nullableTypeName = property.nullableTypeName(context);
      line.write('$nullableTypeName $dartName');
    } else {
      line.write('this.$dartName');
      if (property.hasDefaultValue(context)) {
        line.write(' = ${property.defaultValueString(context)}');
      }
    }
    return line.toString();
  }

  @visibleForTesting
  String? assignmentsLine(
    String jsonName,
    RenderSchema property,
    SchemaRenderer context, {
    required bool isRequired,
  }) {
    final dartName = variableSafeName(context.quirks, jsonName);
    if (property.hasNonConstDefaultValue(context)) {
      return 'this.$dartName = $dartName '
          '?? ${property.defaultValueString(context)}';
    }
    return null;
  }

  String propertyStorageTypeDeclaration({
    required RenderSchema property,
    required SchemaRenderer context,
    required bool dartIsNullable,
    required int indent,
  }) {
    final newlineWithIndent = '\n${' ' * indent}';
    final buffer = StringBuffer();
    if (property.isDeprecated) {
      // OpenAPI has no deprecation string.
      buffer.write('@deprecated$newlineWithIndent');
    }
    if (!context.quirks.mutableModels) {
      buffer.write('final ');
    }
    if (dartIsNullable) {
      buffer.write('${property.nullableTypeName(context)} ');
    } else {
      buffer.write('${property.typeName} ');
    }
    return buffer.toString();
  }

  /// `this` is the schema of the object containing the property.
  /// [property] is the schema of the property itself.
  Map<String, dynamic> propertyTemplateContext({
    required String jsonName,
    required RenderSchema property,
    required SchemaRenderer context,
  }) {
    final dartName = variableSafeName(context.quirks, jsonName);
    final hasDefaultValue = property.hasDefaultValue(context);
    final jsonIsNullable =
        !requiredProperties.contains(jsonName) || property.common.nullable;
    final dartIsNullable =
        propertyDartIsNullable(
          jsonName: jsonName,
          context: context,
          propertyHasDefaultValue: hasDefaultValue,
        ) ||
        property.common.nullable;

    // Means that the constructor parameter is required which is only true if
    // both the json property is required and it does not have a default.
    final isRequired =
        requiredProperties.contains(jsonName) && !hasDefaultValue;
    return {
      'dartName': dartName,
      'jsonName': quoteString(jsonName),
      'argumentLine': argumentLine(
        jsonName,
        property,
        context,
        isRequired: isRequired,
      ),
      'assignmentsLine': assignmentsLine(
        jsonName,
        property,
        context,
        isRequired: isRequired,
      ),
      'storageTypeDeclaration': propertyStorageTypeDeclaration(
        property: property,
        context: context,
        dartIsNullable: dartIsNullable,
        indent: 4,
      ),
      'equals': property.equalsExpression(dartName, context),
      'toJson': property.toJsonExpression(
        dartName,
        context,
        dartIsNullable: dartIsNullable,
      ),
      'fromJson': property.fromJsonExpression(
        "json['$jsonName']",
        context,
        dartIsNullable: dartIsNullable,
        jsonIsNullable: jsonIsNullable,
      ),
    };
  }

  String? buildAssignmentsLine(List<Map<String, dynamic>> renderProperties) {
    final assignmentsLine = renderProperties
        .map((p) => p['assignmentsLine'])
        .whereType<String>()
        .join(', ');
    return assignmentsLine.isEmpty ? null : ': $assignmentsLine';
  }

  /// Template context for an object schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final renderProperties = properties.entries.map((entry) {
      final jsonName = entry.key;
      final schema = entry.value;
      return propertyTemplateContext(
        jsonName: jsonName,
        property: schema,
        context: context,
      );
    }).toList();

    final assignmentsLine = buildAssignmentsLine(renderProperties);

    final valueSchema = additionalProperties;
    final hasAdditionalProperties = valueSchema != null;
    // Force named properties to be rendered if hasAdditionalProperties is true.
    final hasProperties =
        renderProperties.isNotEmpty || hasAdditionalProperties;
    const isNullable = false;
    final propertiesCount =
        renderProperties.length + (hasAdditionalProperties ? 1 : 0);
    if (propertiesCount == 0) {
      throw StateError('Object schema has no properties: $this');
    }
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'hasProperties': hasProperties,
      // Special case behavior hashCode with only one property.
      'hasOneProperty': propertiesCount == 1,
      'properties': renderProperties,
      'hasAdditionalProperties': hasAdditionalProperties,
      'assignmentsLine': assignmentsLine,
      'additionalPropertiesName': 'entries', // Matching OpenAPI.
      'valueSchema': valueSchema?.typeName,
      'valueToJson': valueSchema?.toJsonExpression(
        'value',
        context,
        dartIsNullable: isNullable,
      ),
      'valueFromJson': valueSchema?.fromJsonExpression(
        'value',
        context,
        jsonIsNullable: isNullable,
        dartIsNullable: isNullable,
      ),
      'fromJsonJsonType': context.fromJsonJsonType,
      'castFromJsonArg': context.quirks.dynamicJson,
      'mutableModels': context.quirks.mutableModels,
      'isDeprecated': isDeprecated,
    };
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)$orDefault';
  }

  // This would probably be easier if we did a copyWith and then compared with
  // normal equals provided by Equatable.
  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderObject) {
      return false;
    }
    if (!const SetEquality<String>().equals(
      properties.keys.toSet(),
      other.properties.keys.toSet(),
    )) {
      return false;
    }
    for (final entry in properties.entries) {
      final otherEntry = other.properties[entry.key];
      if (otherEntry == null) {
        return false;
      }
      if (!entry.value.equalsIgnoringName(otherEntry)) {
        return false;
      }
    }
    if (!RenderSchema.maybeEqualsIgnoringName(
      additionalProperties,
      other.additionalProperties,
    )) {
      return false;
    }
    if (!const ListEquality<String>().equals(
      requiredProperties,
      other.requiredProperties,
    )) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }
}

class RenderArray extends RenderSchema {
  const RenderArray({
    required super.common,
    required this.items,
    this.defaultValue,
    this.maxItems,
    this.minItems,
    this.uniqueItems = false,
  });

  /// The items of the resolved schema.
  final RenderSchema items;

  @override
  final dynamic defaultValue;

  /// The maximum number of items in the array.
  final int? maxItems;

  /// The minimum number of items in the array.
  final int? minItems;

  /// Whether the items in the array must be unique.
  final bool uniqueItems;

  @override
  Iterable<String> get validationCalls {
    return [
      if (maxItems != null) 'validateMaximumItems($maxItems)',
      if (minItems != null) 'validateMinimumItems($minItems)',
      if (uniqueItems) 'validateUniqueItems()',
    ];
  }

  @override
  bool get defaultCanConstConstruct {
    final dValue = defaultValue as List?;
    if (dValue is List && dValue.isEmpty) {
      return true;
    }
    // In the null case we're falling through to here, but this will also never
    // be called in that case.
    return items.defaultCanConstConstruct;
  }

  @override
  List<Object?> get props => [
    super.props,
    items,
    defaultValue,
    maxItems,
    minItems,
    uniqueItems,
  ];

  @override
  bool get onlyJsonTypes => items.onlyJsonTypes;

  /// The type name of this schema.
  @override
  String get typeName => 'List<${items.typeName}>';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'listsEqual(this.$name, other.$name)';

  @override
  bool get createsNewType => false;

  @override
  String? defaultValueString(SchemaRenderer context) {
    final listDefault = defaultValue as List;
    if (listDefault.isEmpty) {
      // Type annotation is not needed for empty lists.
      return 'const []';
    }
    final maybeConst = items.defaultCanConstConstruct ? 'const ' : '';
    final itemType = items.typeName;
    String toString(dynamic value) =>
        value is String ? quoteString(value) : value.toString();
    final values = listDefault.map(toString).join(', ');
    return '$maybeConst<$itemType>[$values]';
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'List<dynamic>?' : 'List<dynamic>';
  }

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    // Pod types don't need toJson.
    if (items.onlyJsonTypes) {
      return dartName;
    }
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    final itemsToJson = items.toJsonExpression(
      'e',
      context,
      dartIsNullable: false,
    );
    return '$nameCall.map((e) => $itemsToJson).toList()';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final itemTypeName = items.typeName;
    // List has special handling for nullability since we want to cast
    // through List<dynamic> first before casting to the item type.
    final castAsList = jsonIsNullable
        ? '($jsonValue as List?)?'
        : '($jsonValue as List)';
    final itemsFromJson = items.fromJsonExpression(
      'e',
      context,
      dartIsNullable: false,
      // Unless itemSchema itself has a nullable type this is always false.
      jsonIsNullable: false,
    );
    // If it doesn't create a new type we can just cast the list.
    if (!items.createsNewType) {
      return '$castAsList.cast<$itemTypeName>()$orDefault';
    }
    return '$castAsList.map<$itemTypeName>('
        '(e) => $itemsFromJson).toList()$orDefault';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderArray.toTemplateContext');

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderArray) {
      return false;
    }
    if (!items.equalsIgnoringName(other.items)) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }
}

class RenderMap extends RenderSchema {
  const RenderMap({
    required super.common,
    required this.valueSchema,
    this.defaultValue,
  });

  final RenderSchema valueSchema;

  @override
  final dynamic defaultValue;

  @override
  List<Object?> get props => [super.props, valueSchema, defaultValue];

  @override
  bool get onlyJsonTypes => valueSchema.onlyJsonTypes;

  @override
  bool get defaultCanConstConstruct {
    final dValue = defaultValue as Map?;
    if (dValue is Map && dValue.isEmpty) {
      return true;
    }
    // In the null case we're falling through to here, but this will also never
    // be called in that case.
    return valueSchema.defaultCanConstConstruct;
  }

  @override
  String get typeName => 'Map<String, ${valueSchema.typeName}>';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'mapsEqual(this.$name, other.$name)';

  @override
  bool get createsNewType => false;

  @override
  String jsonStorageType({required bool isNullable}) => 'Map<String, dynamic>';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    // Nothing to do if the value schema is only json types.
    if (valueSchema.onlyJsonTypes) {
      return dartName;
    }
    final valueToJson = valueSchema.toJsonExpression(
      'value',
      context,
      dartIsNullable: false,
    );
    final callMap = dartIsNullable ? '?.map' : '.map';
    return '$dartName$callMap((key, value) => MapEntry(key, $valueToJson))';
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    // We could probably do a smaller cast if the value schema is only json
    // types.
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final valueFromJson = valueSchema.fromJsonExpression(
      'value',
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );
    // TODO(eseidel): Support orDefault?
    // Should this have a leading ? to skip the key on null?
    final callMap = jsonIsNullable ? '?.map' : '.map';
    return '($jsonValue as $jsonType)$callMap((key, value) => '
        'MapEntry(key, $valueFromJson))';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderMap.toTemplateContext');

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderMap) {
      return false;
    }
    return valueSchema.equalsIgnoringName(other.valueSchema) &&
        super.equalsIgnoringName(other);
  }
}

class RenderEnum extends RenderNewType {
  const RenderEnum({
    required super.common,
    required this.values,
    required this.names,
    this.defaultValue,
  }) : assert(
         names.length == values.length,
         'names and values must have the same length',
       );

  @visibleForTesting
  static List<String> variableNamesFor(Quirks quirks, List<String> values) {
    final sharedPrefix = _sharedPrefix(values);
    String toShortVariableName(String value) {
      var dartName = variableSafeName(quirks, value);
      // OpenAPI also removes shared prefixes from enum values.
      dartName = dartName.replaceAll(sharedPrefix, '');
      // Avoid reserved words again in case removing the prefix caused
      // a reserved word collision.
      dartName = avoidReservedWord(dartName);
      return dartName;
    }

    return values.map(toShortVariableName).toList();
  }

  @override
  final dynamic defaultValue;

  @override
  bool get defaultCanConstConstruct => true;

  /// The values of the resolved schema.
  final List<String> values;

  /// The names of the resolved schema.
  final List<String> names;

  @override
  List<Object?> get props => [super.props, values, names, defaultValue];

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'String?' : 'String';
  }

  /// Template context for an enum schema.
  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    Map<String, dynamic> enumValueToTemplateContext(String value) {
      return {
        'enumValueName': variableNameFor(value),
        'enumValue': quoteString(value),
      };
    }

    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
      'enumValues': values.map(enumValueToTemplateContext).toList(),
    };
  }

  /// The default value of this schema as a string.
  @override
  String? defaultValueString(SchemaRenderer context) {
    // If the type of this schema is an object we need to convert the default
    // value to that object type.
    if (defaultValue is String) {
      return '$className.${variableNameFor(defaultValue as String)}';
    }
    return defaultValue?.toString();
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final orDefault = orDefaultExpression(
      context: context,
      jsonIsNullable: jsonIsNullable,
      dartIsNullable: dartIsNullable,
    );
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)$orDefault';
  }

  String variableNameFor(String value) => names[values.indexOf(value)];

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderEnum) {
      return false;
    }
    if (!const ListEquality<String>().equals(values, other.values)) {
      return false;
    }
    if (!const ListEquality<String>().equals(names, other.names)) {
      return false;
    }
    return super.equalsIgnoringName(other);
  }
}

class RenderOneOf extends RenderNewType {
  const RenderOneOf({required super.common, required this.schemas});

  /// The schemas of the resolved schema.
  final List<RenderSchema> schemas;

  /// We could do something smarter here, to determine if the oneOf has a
  /// const constructor, but it's not worth the complexity for now.
  @override
  bool get defaultCanConstConstruct => false;

  @override
  List<Object?> get props => [super.props, schemas];

  @override
  bool equalsIgnoringName(RenderSchema other) {
    if (other is! RenderOneOf) {
      return false;
    }
    if (schemas.length != other.schemas.length) {
      return false;
    }
    for (var i = 0; i < schemas.length; i++) {
      if (!schemas[i].equalsIgnoringName(other.schemas[i])) {
        return false;
      }
    }
    return super.equalsIgnoringName(other);
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    if (schemas.any((s) => s is RenderPod)) {
      return 'dynamic';
    }
    return 'Map<String, dynamic>';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    return {
      'doc_comment': createDocComment(common: common),
      'typeName': typeName,
      'nullableTypeName': nullableTypeName(context),
    };
  }

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) {
    final jsonType = jsonStorageType(isNullable: jsonIsNullable);
    final jsonMethod = jsonIsNullable ? 'maybeFromJson' : 'fromJson';
    return '$className.$jsonMethod($jsonValue as $jsonType)';
  }

  @override
  dynamic get defaultValue => null;
}

class RenderParameter implements CanBeParameter {
  const RenderParameter({
    required this.description,
    required this.name,
    required this.type,
    required this.isRequired,
    required this.isDeprecated,
    required this.sendIn,
  });

  /// The name of the parameter.
  final String name;

  @override
  String dartParameterName(Quirks quirks) => variableSafeName(quirks, name);

  /// The description of the parameter.
  final String? description;

  /// The type of the parameter.
  final RenderSchema type;

  /// The send in of the parameter.
  final SendIn sendIn;

  /// Whether the parameter is required.
  @override
  final bool isRequired;

  /// Whether the parameter is deprecated.
  final bool isDeprecated;

  @override
  Iterable<String> get validationCalls => type.validationCalls;

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final isNullable = !isRequired;
    final specName = name;
    final dartName = lowercaseCamelFromSnake(name);
    final jsonName = name;
    return {
      'parameter_description': createDocCommentFromParts(
        body: description,
        indent: 4,
      ),
      'name': name,
      'dartName': dartName,
      'bracketedName': '{$specName}',
      'required': isRequired,
      'hasDefaultValue': type.defaultValue != null,
      'defaultValue': type.defaultValueString(context),
      'isNullable': isNullable,
      'type': type.typeName,
      'nullableType': type.nullableTypeName(context),
      'sendIn': sendIn.name,
      'toJson': type.toJsonExpression(
        dartName,
        context,
        dartIsNullable: isNullable,
      ),
      'fromJson': type.fromJsonExpression(
        "json['$jsonName']",
        context,
        jsonIsNullable: isNullable,
        dartIsNullable: isNullable,
      ),
    };
  }
}

class RenderUnknown extends RenderSchema {
  const RenderUnknown({required super.common});

  @override
  dynamic get defaultValue => null;

  @override
  String get typeName => 'dynamic';

  @override
  bool get createsNewType => false;

  @override
  bool get defaultCanConstConstruct => false;

  // We never deserialize or serialize unknown types.
  @override
  bool get onlyJsonTypes => true;

  @override
  String jsonStorageType({required bool isNullable}) => 'dynamic';

  // We might need to jsonDecode(jsonEncode(dartName)) to get everything into
  // json types.
  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => dartName;

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => jsonValue;

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('RenderUnknown.toTemplateContext');
}

class RenderVoid extends RenderNoJson {
  const RenderVoid({required super.common});

  @override
  dynamic get defaultValue =>
      throw UnimplementedError('RenderVoid.defaultValue');

  @override
  String get typeName => 'void';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'throw UnimplementedError("RenderVoid.equalsExpression")';

  @override
  bool get createsNewType => false;

  @override
  bool get defaultCanConstConstruct => false;

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => ''; // Unclear if this is correct. The one usage is for returning
  // a void type, maybe we need a "return expression" value instead?
}

abstract class RenderNoJson extends RenderSchema {
  const RenderNoJson({required super.common});

  @override
  bool get onlyJsonTypes => false;

  @override
  String jsonStorageType({required bool isNullable}) =>
      'throw UnimplementedError("$runtimeType.jsonStorageType")';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("$runtimeType.toJson")';

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => 'throw UnimplementedError("$runtimeType.fromJson")';

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) =>
      throw UnimplementedError('$runtimeType.toTemplateContext');
}

class RenderBinary extends RenderNoJson {
  const RenderBinary({required super.common});

  @override
  dynamic get defaultValue => null;

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    const Import('dart:typed_data'),
  ];

  @override
  String get typeName => 'Uint8List';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'listsEqual(this.$name, other.$name)';

  @override
  bool get createsNewType => false;

  @override
  bool get defaultCanConstConstruct => false;
}

class RenderEmptyObject extends RenderNewType {
  const RenderEmptyObject({required super.common});

  @override
  dynamic get defaultValue => null;

  @override
  bool get defaultCanConstConstruct => true;

  @override
  String jsonStorageType({required bool isNullable}) => 'Map<String, dynamic>';

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) => 'const <String, dynamic>{}';

  @override
  String fromJsonExpression(
    String jsonValue,
    SchemaRenderer context, {
    required bool jsonIsNullable,
    required bool dartIsNullable,
  }) => 'const $className()';

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'doc_comment': createDocComment(common: common),
    'typeName': typeName,
    'nullableTypeName': nullableTypeName(context),
  };
}
