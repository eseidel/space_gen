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

String wrapAsDocComment(String value, {required int indent}) {
  final lines = value.split('\n');
  final commentedLines = lines.map((line) => ' ' * indent + '/// $line');
  return commentedLines.join('\n');
}

/// Doc comments are meant to be inserted right before the type declaration
/// *not* on a separate line.  They will add their own new-line at the end if
/// necessary and will match the passed in indent for any lines after the first
/// including after the trailing new-line.
String? createDocComment({String? title, String? body, int indent = 0}) {
  if (title == null && body == null) {
    return null;
  }
  final parts = <String>[];
  if (title != null) {
    parts.add(wrapAsDocComment(title, indent: indent));
  }
  if (body != null) {
    parts.add(wrapAsDocComment(body, indent: indent));
  }
  if (parts.isEmpty) {
    return null;
  }
  // Remove leading whitespace from just the first line.
  // This makes it easier to use from within a mustache template.
  return '${parts.join('\n').trimLeft()}\n${' ' * indent}';
}

// Could make this comparable to have a nicer sort for our test results.
@immutable
class Import extends Equatable {
  const Import(this.path, {this.asName});

  final String path;
  final String? asName;

  Map<String, dynamic> toTemplateContext() {
    return {'path': path, 'asName': asName};
  }

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
          snakeName: schema.snakeName,
          values: schema.values,
          names: RenderEnum.variableNamesFor(quirks, schema.values),
          pointer: schema.pointer,
          description: schema.description,
          defaultValue: schema.defaultValue,
        );
      case ResolvedObject():
        return RenderObject(
          snakeName: schema.snakeName,
          description: schema.description,
          properties: schema.properties.map(
            (name, value) => MapEntry(name, toRenderSchema(value)),
          ),
          pointer: schema.pointer,
          additionalProperties: maybeRenderSchema(schema.additionalProperties),
          requiredProperties: schema.requiredProperties,
        );
      case ResolvedPod():
        // Unclear if this is an OpenApi generator quirk or desired behavior,
        // but openapi creates a new file for each top level component, even
        // if it's a simple type.  Matching this behavior for now.
        final hasExplicitName = isTopLevelComponent(schema.pointer);
        if (hasExplicitName && schema.type == PodType.string) {
          return RenderStringNewType(
            snakeName: schema.snakeName,
            description: schema.description,
            pointer: schema.pointer,
            defaultValue: schema.defaultValue as String?,
          );
        }
        return RenderPod(
          snakeName: schema.snakeName,
          type: schema.type,
          description: schema.description,
          pointer: schema.pointer,
          defaultValue: schema.defaultValue,
        );
      case ResolvedNumber():
        return RenderNumber(
          snakeName: schema.snakeName,
          description: schema.description,
          pointer: schema.pointer,
          defaultValue: schema.defaultValue,
          maximum: schema.maximum,
          minimum: schema.minimum,
          exclusiveMaximum: schema.exclusiveMaximum,
          exclusiveMinimum: schema.exclusiveMinimum,
          multipleOf: schema.multipleOf,
        );
      case ResolvedInteger():
        return RenderInteger(
          snakeName: schema.snakeName,
          description: schema.description,
          pointer: schema.pointer,
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
          snakeName: schema.snakeName,
          items: toRenderSchema(schema.items),
          description: schema.description,
          pointer: schema.pointer,
          defaultValue: defaultValue,
        );
      case ResolvedVoid():
        return RenderVoid(
          snakeName: schema.snakeName,
          pointer: schema.pointer,
          description: schema.description,
        );
      case ResolvedUnknown():
        return RenderUnknown(
          snakeName: schema.snakeName,
          pointer: schema.pointer,
          description: schema.description,
        );
      case ResolvedBinary():
        return RenderBinary(
          snakeName: schema.snakeName,
          pointer: schema.pointer,
          description: schema.description,
        );
      case ResolvedOneOf():
        return RenderOneOf(
          snakeName: schema.snakeName,
          schemas: schema.schemas.map(toRenderSchema).toList(),
          pointer: schema.pointer,
          description: schema.description,
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
        return RenderObject(
          snakeName: schema.snakeName,
          description: schema.description,
          properties: properties,
          pointer: schema.pointer,
        );
      case ResolvedAnyOf():
        // Resolver already makes anyOf with 1 schema to just be that schema.
        // For multiple schemas, we just generate a oneOf, which is wrong.
        // anyOf means that at least one of the schemas must be valid.
        // Which presumably translates into a single schema with all properties
        // nullable?  Unclear.
        return RenderOneOf(
          snakeName: schema.snakeName,
          schemas: schema.schemas.map(toRenderSchema).toList(),
          pointer: schema.pointer,
          description: schema.description,
        );
      case ResolvedMap():
        return RenderMap(
          snakeName: schema.snakeName,
          description: schema.description,
          valueSchema: toRenderSchema(schema.valueSchema),
          pointer: schema.pointer,
        );
      case ResolvedEmptyObject():
        return RenderEmptyObject(
          snakeName: schema.snakeName,
          pointer: schema.pointer,
          description: schema.description,
        );
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
        description: operation.description,
        snakeName: '${operation.snakeName}_response',
        pointer: operation.pointer,
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
        snakeName: '${operation.snakeName}_response',
        schemas: distinctSchemas.toList(),
        pointer: operation.pointer,
        description: operation.description,
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

  RenderSpec toRenderSpec(ResolvedSpec spec) {
    return RenderSpec(
      serverUrl: spec.serverUrl,
      paths: spec.paths.map(toRenderPath).toList(),
    );
  }
}

// Convert a resolved spec to a spec that can be rendered.
// This is the root of the render spec tree.
class RenderSpec {
  const RenderSpec({required this.serverUrl, required this.paths});

  /// The server url of the spec.
  final Uri serverUrl;

  /// The paths of the spec.
  final List<RenderPath> paths;

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

  List<Api> get apis => tags
      .sorted()
      .map(
        (tag) => Api(
          description: 'Endpoints with tag $tag',
          snakeName: toSnakeCase(tag),
          endpoints: endpoints.where((e) => e.tag == tag).toList(),
        ),
      )
      .toList();
}

/// A convenience class created for each operation within a path item
/// for compatibility with our existing rendering code.
class Endpoint {
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

  String get methodName => lowercaseCamelFromSnake(snakeName);

  Uri get uri => Uri.parse('$serverUrl$path');

  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final serverParameters = parameters.map((param) {
      return param.toTemplateContext(context);
    }).toList();

    final requestBody = operation.requestBody?.toTemplateContext(context);
    // Parameters as passed to the Dart function call, including the request
    // body if it exists.
    final dartParameters = [...serverParameters, ?requestBody];

    final responseSchema = operation.returnType;
    final returnType = responseSchema.typeName(context);
    final responseFromJson = responseSchema.fromJsonExpression(
      'jsonDecode(response.body)',
      context,
      jsonIsNullable: false,
      dartIsNullable: false,
    );

    final namedParameters = dartParameters.where((p) => p['required'] == false);
    final positionalParameters = dartParameters.where(
      (p) => p['required'] == true,
    );

    // TODO(eseidel): This grouping should happen before converting to
    // template context while we still have strong types.
    final bySendIn = serverParameters.groupListsBy((p) => p['sendIn']);

    final pathParameters = bySendIn['path'] ?? [];
    final queryParameters = bySendIn['query'] ?? [];
    final hasQueryParameters = queryParameters.isNotEmpty;
    final cookieParameters = bySendIn['cookie'] ?? [];
    if (cookieParameters.isNotEmpty) {
      _unimplemented(
        'Cookie parameters are not yet supported.',
        operation.pointer,
      );
    }
    final headerParameters = bySendIn['header'] ?? [];
    final hasHeaderParameters = headerParameters.isNotEmpty;

    // Endpoints could get summary and description from
    // *both* Path and Operation objects.  Unclear how we should display both.
    return {
      'endpoint_doc_comment': createDocComment(
        title: summary,
        body: description,
        indent: 4,
      ),
      'methodName': methodName,
      'httpMethod': method.name,
      'path': path,
      'url': uri,
      // Parameters grouped for dart parameter generation.
      'positionalParameters': positionalParameters,
      'hasNamedParameters': namedParameters.isNotEmpty,
      'namedParameters': namedParameters,
      // Parameters grouped for call to server.
      'pathParameters': pathParameters,
      'hasQueryParameters': hasQueryParameters,
      'queryParameters': queryParameters,
      'hasHeaderParameters': hasHeaderParameters,
      'headerParameters': headerParameters,
      'requestBody': requestBody,
      'returnType': returnType,
      'responseFromJson': responseFromJson,
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

abstract class RenderRequestBody {
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
  final bool isRequired;

  String requestBodyClassName(SchemaRenderer context) {
    // TODO(eseidel): Why don't we have a name for request bodies?
    final typeName = schema.typeName(context);
    return (typeName[0].toLowerCase() + typeName.substring(1)).split('<').first;
  }

  Map<String, dynamic> toTemplateContext(SchemaRenderer context);
}

class RenderRequestBodyJson extends RenderRequestBody {
  const RenderRequestBodyJson({
    required super.schema,
    required super.description,
    required super.isRequired,
  });

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final typeName = schema.typeName(context);
    final paramName = requestBodyClassName(context);
    // TODO(eseidel): Share code with Parameter.toTemplateContext.
    final isNullable = !isRequired;
    return {
      'request_body_doc_comment': createDocComment(
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
    final paramName = requestBodyClassName(context);
    return {
      'request_body_doc_comment': createDocComment(
        body: description,
        indent: 4,
      ),
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': isRequired,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': schema.typeName(context),
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
    final paramName = requestBodyClassName(context);
    return {
      'name': paramName,
      'dartName': paramName,
      'bracketedName': '{$paramName}',
      'required': isRequired,
      'hasDefaultValue': schema.defaultValue != null,
      'defaultValue': schema.defaultValueString(context),
      'type': schema.typeName(context),
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

abstract class RenderSchema extends Equatable {
  const RenderSchema({
    required this.snakeName,
    required this.pointer,
    required this.description,
  });

  /// The snake name of the resolved schema.
  final String snakeName;

  /// The pointer of the resolved schema.
  final JsonPointer pointer;

  /// Schema objects do not have a summary to my knowledge.

  /// The description of the resolved schema.
  final String? description;

  /// Whether this schema creates a new type and thus needs to be rendered.
  bool get createsNewType;

  /// The default value of this schema.
  dynamic get defaultValue;

  /// Whether the defaultValue can be const constructed.
  bool get defaultCanConstConstruct;

  bool hasNonConstDefaultValue(SchemaRenderer context) =>
      hasDefaultValue(context) && !defaultCanConstConstruct;

  Iterable<Import> get additionalImports => const [];

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

  /// Is this the json storage type or the dart class type?
  String typeName(SchemaRenderer context);

  String nullableTypeName(SchemaRenderer context) {
    final typeName = this.typeName(context);
    return typeName.endsWith('?') ? typeName : '$typeName?';
  }

  String equalsExpression(String name, SchemaRenderer context);

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

  Map<String, dynamic> toTemplateContext(SchemaRenderer context);

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
    // Intentionally ignoring pointer, snakeName and defaultValue.
    return true;
  }

  @override
  String toString() => '$runtimeType(snakeName: $snakeName, pointer: $pointer)';
}

// Plain old data types (string, number, boolean)
class RenderPod extends RenderSchema {
  const RenderPod({
    required super.snakeName,
    required super.description,
    required this.type,
    required super.pointer,
    this.defaultValue,
  });

  /// The type of the resolved schema.
  final PodType type;

  @override
  final dynamic defaultValue;

  @override
  bool get onlyJsonTypes {
    return switch (type) {
      // These are already json types.
      PodType.string || PodType.boolean => true,
      // These require serialization to a string.
      PodType.dateTime || PodType.uri => false,
    };
  }

  @override
  bool get defaultCanConstConstruct {
    return switch (type) {
      PodType.dateTime || PodType.uri => false,
      PodType.string || PodType.boolean => true,
    };
  }

  @override
  List<Object?> get props => [super.props, type, defaultValue];

  @override
  String typeName(SchemaRenderer context) {
    return switch (type) {
      PodType.string => 'String',
      PodType.boolean => 'bool',
      PodType.dateTime => 'DateTime',
      PodType.uri => 'Uri',
    };
  }

  @override
  String jsonStorageType({required bool isNullable}) {
    return switch (type) {
      PodType.string ||
      PodType.dateTime ||
      PodType.uri => isNullable ? 'String?' : 'String',
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
      PodType.string => quoteString(defaultValue as String),
      PodType.boolean => defaultValue.toString(),
    };
  }

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'this.$name == other.$name';

  @override
  bool get createsNewType => false;

  @override
  String toJsonExpression(
    String dartName,
    SchemaRenderer context, {
    required bool dartIsNullable,
  }) {
    final nameCall = dartIsNullable ? '$dartName?' : dartName;
    if (type == PodType.dateTime) {
      return '$nameCall.toIso8601String()';
    }
    if (type == PodType.uri) {
      return '$nameCall.toString()';
    }
    return dartName;
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
    // TODO(eseidel): Check valueType to possibly avoid unnecessary cast.
    final castedValue = '$jsonValue as $jsonType';
    switch (type) {
      case PodType.dateTime:
        if (jsonIsNullable) {
          return 'maybeParseDateTime($castedValue)$orDefault';
        } else {
          return 'DateTime.parse($castedValue)';
        }
      case PodType.uri:
        if (jsonIsNullable) {
          return 'maybeParseUri($castedValue)$orDefault';
        } else {
          return 'Uri.parse($castedValue)';
        }
      case PodType.string:
        return '($castedValue)$orDefault';
      case PodType.boolean:
        return '($castedValue)$orDefault';
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
  const RenderNewType({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });

  /// Whether this new type creates a new type and thus needs to be rendered.
  @override
  bool get createsNewType => true;

  @override
  bool get onlyJsonTypes => false;

  /// The class name of the new type.
  String get className => camelFromSnake(snakeName);

  @override
  String typeName(SchemaRenderer context) => className;

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'this.$name == other.$name';

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

class RenderStringNewType extends RenderNewType {
  const RenderStringNewType({
    required super.snakeName,
    required super.description,
    required super.pointer,
    required this.defaultValue,
  });

  @override
  final String? defaultValue;

  @override
  bool get defaultCanConstConstruct => true;

  @override
  List<Object?> get props => [super.props, defaultValue];

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) => {
    'doc_comment': createDocComment(body: description, indent: 4),
    'typeName': typeName(context),
    'nullableTypeName': nullableTypeName(context),
  };

  @override
  String jsonStorageType({required bool isNullable}) {
    return isNullable ? 'String?' : 'String';
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
    // TODO(eseidel): Check valueType to possibly avoid unnecessary cast.
    final castedValue = '$jsonValue as $jsonType';
    return '$className.$jsonMethod($castedValue)$orDefault';
  }
}

abstract class RenderNumeric<T extends num> extends RenderSchema {
  const RenderNumeric({
    required super.snakeName,
    required super.description,
    required super.pointer,
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
  bool get createsNewType =>
      hasExplicitName ||
      maximum != null ||
      minimum != null ||
      exclusiveMaximum != null ||
      exclusiveMinimum != null ||
      multipleOf != null;

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
  String equalsExpression(String name, SchemaRenderer context) =>
      'this.$name == other.$name';

  @visibleForTesting
  String buildValidations(SchemaRenderer context) {
    final validations = <String>[];
    void add(String condition) =>
        validations.add('assert($condition, "Invalid value: \$value")');

    if (maximum != null) add('value <= $maximum');
    if (minimum != null) add('value >= $minimum');
    if (exclusiveMaximum != null) add('value < $exclusiveMaximum');
    if (exclusiveMinimum != null) add('value > $exclusiveMinimum');
    if (multipleOf != null) add('value % $multipleOf == 0');
    return validations.join(',\n');
  }

  String buildInitializers(SchemaRenderer context) {
    final validations = buildValidations(context);
    return validations.isEmpty ? '' : ': $validations';
  }

  @override
  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    if (!createsNewType) {
      throw StateError(
        '$runtimeType.toTemplateContext called for non-new type: $this',
      );
    }
    return {
      'doc_comment': createDocComment(body: description, indent: 4),
      'typeName': typeName(context),
      'dartType': '$T',
      'jsonType': jsonStorageType(isNullable: false),
      'nullableTypeName': nullableTypeName(context),
      'initializers': buildInitializers(context),
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
}

class RenderNumber extends RenderNumeric<double> {
  const RenderNumber({
    required super.snakeName,
    required super.description,
    required super.pointer,
    required super.defaultValue,
    required super.maximum,
    required super.minimum,
    required super.exclusiveMaximum,
    required super.exclusiveMinimum,
    required super.multipleOf,
  });

  @override
  String typeName(SchemaRenderer context) =>
      createsNewType ? camelFromSnake(snakeName) : 'double';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'num?' : 'num';

  @override
  String jsonToDartCall({required bool jsonIsNullable}) =>
      jsonIsNullable ? '?.toDouble()' : '.toDouble()';
}

class RenderInteger extends RenderNumeric<int> {
  const RenderInteger({
    required super.snakeName,
    required super.description,
    required super.pointer,
    required super.defaultValue,
    required super.maximum,
    required super.minimum,
    required super.exclusiveMaximum,
    required super.exclusiveMinimum,
    required super.multipleOf,
  });

  @override
  String typeName(SchemaRenderer context) =>
      createsNewType ? camelFromSnake(snakeName) : 'int';

  @override
  String jsonStorageType({required bool isNullable}) =>
      isNullable ? 'int?' : 'int';

  // jsonType and dartType are both int, so we don't need to do anything.
  @override
  String jsonToDartCall({required bool jsonIsNullable}) => '';
}

class RenderObject extends RenderNewType {
  const RenderObject({
    required super.snakeName,
    required super.description,
    required this.properties,
    required super.pointer,
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

  /// `this` is the schema of the object containing the property.
  /// [property] is the schema of the property itself.
  Map<String, dynamic> propertyTemplateContext({
    required String jsonName,
    required RenderSchema property,
    required SchemaRenderer context,
  }) {
    final dartName = variableSafeName(context.quirks, jsonName);
    final hasDefaultValue = property.hasDefaultValue(context);
    final jsonIsNullable = !requiredProperties.contains(jsonName);
    final dartIsNullable = propertyDartIsNullable(
      jsonName: jsonName,
      context: context,
      propertyHasDefaultValue: hasDefaultValue,
    );

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
      'dartIsNullable': dartIsNullable,
      'type': property.typeName(context),
      'nullableType': property.nullableTypeName(context),
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
      'doc_comment': createDocComment(body: description, indent: 4),
      'typeName': typeName(context),
      'nullableTypeName': nullableTypeName(context),
      'hasProperties': hasProperties,
      // Special case behavior hashCode with only one property.
      'hasOneProperty': propertiesCount == 1,
      'properties': renderProperties,
      'hasAdditionalProperties': hasAdditionalProperties,
      'assignmentsLine': assignmentsLine,
      'additionalPropertiesName': 'entries', // Matching OpenAPI.
      'valueSchema': valueSchema?.typeName(context),
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
    required super.snakeName,
    required this.items,
    required super.pointer,
    required super.description,
    this.defaultValue,
  });

  /// The items of the resolved schema.
  final RenderSchema items;

  @override
  final dynamic defaultValue;

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
  List<Object?> get props => [super.props, items, defaultValue];

  @override
  bool get onlyJsonTypes => items.onlyJsonTypes;

  /// The type name of this schema.
  @override
  String typeName(SchemaRenderer context) => 'List<${items.typeName(context)}>';

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
    final itemType = items.typeName(context);
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
    final itemTypeName = items.typeName(context);
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
    return items.equalsIgnoringName(other.items) &&
        super.equalsIgnoringName(other);
  }
}

class RenderMap extends RenderSchema {
  const RenderMap({
    required super.snakeName,
    required this.valueSchema,
    required super.pointer,
    required super.description,
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
  String typeName(SchemaRenderer context) =>
      'Map<String, ${valueSchema.typeName(context)}>';

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
    return '$dartName?.map((key, value) => MapEntry(key, $valueToJson))';
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
    return '($jsonValue as $jsonType)?.map((key, value) => '
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
    required super.snakeName,
    required this.values,
    required this.names,
    required super.pointer,
    required super.description,
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
      'doc_comment': createDocComment(body: description, indent: 4),
      'typeName': typeName(context),
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
  const RenderOneOf({
    required super.snakeName,
    required this.schemas,
    required super.pointer,
    required super.description,
  });

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
      'doc_comment': createDocComment(body: description, indent: 4),
      'typeName': typeName(context),
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

class RenderParameter {
  const RenderParameter({
    required this.description,
    required this.name,
    required this.type,
    required this.isRequired,
    required this.sendIn,
  });

  /// The name of the parameter.
  final String name;

  /// The description of the parameter.
  final String? description;

  /// The type of the parameter.
  final RenderSchema type;

  /// The send in of the parameter.
  final SendIn sendIn;

  /// Whether the parameter is required.
  final bool isRequired;

  Map<String, dynamic> toTemplateContext(SchemaRenderer context) {
    final isNullable = !isRequired;
    final specName = name;
    final dartName = lowercaseCamelFromSnake(name);
    final jsonName = name;
    return {
      'parameter_description': createDocComment(body: description, indent: 4),
      'name': name,
      'dartName': dartName,
      'bracketedName': '{$specName}',
      'required': isRequired,
      'hasDefaultValue': type.defaultValue != null,
      'defaultValue': type.defaultValueString(context),
      'isNullable': isNullable,
      'type': type.typeName(context),
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
  const RenderUnknown({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });

  @override
  dynamic get defaultValue => null;

  @override
  String typeName(SchemaRenderer context) => 'dynamic';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'identical(this.$name, other.$name)';

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
  const RenderVoid({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });

  @override
  dynamic get defaultValue =>
      throw UnimplementedError('RenderVoid.defaultValue');

  @override
  String typeName(SchemaRenderer context) => 'void';

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
  const RenderNoJson({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });

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
  const RenderBinary({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });

  @override
  dynamic get defaultValue => null;

  @override
  Iterable<Import> get additionalImports => [
    ...super.additionalImports,
    const Import('dart:typed_data'),
  ];

  @override
  String typeName(SchemaRenderer context) => 'Uint8List';

  @override
  String equalsExpression(String name, SchemaRenderer context) =>
      'listsEqual(this.$name, other.$name)';

  @override
  bool get createsNewType => false;

  @override
  bool get defaultCanConstConstruct => false;
}

class RenderEmptyObject extends RenderNewType {
  const RenderEmptyObject({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });

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
    'doc_comment': createDocComment(body: description, indent: 4),
    'typeName': typeName(context),
    'nullableTypeName': nullableTypeName(context),
  };
}
