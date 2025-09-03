// The job here is to walk the spec and resolve all the references.
// This also creates a tree that is more designed for rendering rather
// than serialization/deserialization with the openapi spec.
// This also discards all non-json values.

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parse/visitor.dart';
import 'package:space_gen/src/parser.dart';

void _warn(String message, JsonPointer pointer) {
  logger.warn('$message in $pointer');
}

Never _error(String message, JsonPointer pointer) {
  throw FormatException('$message in $pointer');
}

class ResolveContext {
  ResolveContext({
    required this.specUrl,
    required this.refRegistry,
    required this.globalSecurityRequirements,
    required this.securitySchemes,
  });

  /// Used for cases where we need a ResolveContext, but don't actually
  /// plan to look up any objects in the registry.
  ResolveContext.test({
    Uri? specUrl,
    RefRegistry? refRegistry,
    this.globalSecurityRequirements = const [],
    List<SecurityScheme>? securitySchemes,
  }) : specUrl = specUrl ?? Uri.parse('https://example.com'),
       refRegistry = refRegistry ?? RefRegistry(),
       securitySchemes = securitySchemes ?? [];

  /// The spec url of the spec.
  final Uri specUrl;

  /// The registry of all the objects we've parsed so far.
  final RefRegistry refRegistry;

  /// The global security requirements of the spec.
  final List<ResolvedSecurityRequirement> globalSecurityRequirements;

  /// The security schemes of the spec.
  final List<SecurityScheme> securitySchemes;

  /// The registry of all the objects we've parsed so far.
  /// Resolve a nullable [SchemaRef] into a nullable [SchemaObject].
  T? _maybeResolve<T extends Parseable>(RefOr<T>? ref) {
    if (ref == null) {
      return null;
    }
    return _resolve(ref);
  }

  /// Resolve a [SchemaRef] into a [SchemaObject].
  T _resolve<T extends Parseable>(RefOr<T> refOr) {
    if (refOr.object != null) {
      return refOr.object!;
    }
    final uri = specUrl.resolveUri(refOr.ref!.uri);
    return _resolveUri(uri);
  }

  /// Resolve a uri into a [SchemaObject].
  T _resolveUri<T>(Uri uri) => refRegistry.get<T>(uri);
}

List<ResolvedPath> _resolvePaths(Paths paths, ResolveContext context) {
  return paths.paths.entries.map((entry) {
    final path = entry.key;
    final pathItem = entry.value;
    return ResolvedPath(
      path: path,
      operations: _resolveOperations(pathItem, context),
    );
  }).toList();
}

ResolvedSchema? _maybeResolveSchemaRef(SchemaRef? ref, ResolveContext context) {
  if (ref == null) {
    return null;
  }
  return resolveSchemaRef(ref, context);
}

ResolvedSchema resolveSchemaRef(SchemaRef ref, ResolveContext context) {
  final schema = context._maybeResolve(ref);
  if (schema == null) {
    throw Exception('Schema not found: $ref');
  }

  if (schema is SchemaObject) {
    return ResolvedObject(
      common: schema.common,
      properties: schema.properties.map((key, value) {
        return MapEntry(key, resolveSchemaRef(value, context));
      }),
      additionalProperties: _maybeResolveSchemaRef(
        schema.additionalProperties,
        context,
      ),
      requiredProperties: schema.requiredProperties,
    );
  }
  if (schema is SchemaEnum) {
    return ResolvedEnum(
      common: schema.common,
      defaultValue: schema.defaultValue,
      values: schema.enumValues,
    );
  }
  if (schema is SchemaBinary) {
    return ResolvedBinary(common: schema.common);
  }
  if (schema is SchemaPod) {
    return ResolvedPod(
      common: schema.common,
      type: schema.type,
      defaultValue: schema.defaultValue,
    );
  }
  if (schema is SchemaInteger) {
    return ResolvedInteger(
      common: schema.common,
      defaultValue: schema.defaultValue,
      maximum: schema.maximum,
      minimum: schema.minimum,
      exclusiveMaximum: schema.exclusiveMaximum,
      exclusiveMinimum: schema.exclusiveMinimum,
      multipleOf: schema.multipleOf,
    );
  }
  if (schema is SchemaString) {
    return ResolvedString(
      common: schema.common,
      defaultValue: schema.defaultValue,
      maxLength: schema.maxLength,
      minLength: schema.minLength,
      pattern: schema.pattern,
    );
  }
  if (schema is SchemaNumber) {
    return ResolvedNumber(
      common: schema.common,
      defaultValue: schema.defaultValue,
      maximum: schema.maximum,
      minimum: schema.minimum,
      exclusiveMaximum: schema.exclusiveMaximum,
      exclusiveMinimum: schema.exclusiveMinimum,
      multipleOf: schema.multipleOf,
    );
  } else if (schema is SchemaArray) {
    final items = _maybeResolveSchemaRef(schema.items, context);
    if (items == null) {
      _error('items must be a schema for type=array', schema.pointer);
    }
    return ResolvedArray(
      common: schema.common,
      items: items,
      defaultValue: schema.defaultValue,
      maxItems: schema.maxItems,
      minItems: schema.minItems,
      uniqueItems: schema.uniqueItems,
    );
  }
  if (schema is SchemaOneOf) {
    final oneOf = schema;
    return ResolvedOneOf(
      common: schema.common,
      schemas: oneOf.schemas.map((e) => resolveSchemaRef(e, context)).toList(),
    );
  }
  if (schema is SchemaAllOf) {
    final allOf = schema;
    final schemas = allOf.schemas
        .map((e) => resolveSchemaRef(e, context))
        .toList();
    // Elide the allOf if there is only one schema.
    // Probably should only do this for the pod case?  Since in the object
    // case allOf should probably create a new object?
    if (schemas.length == 1) {
      return schemas.first;
    }
    for (final schema in schemas) {
      if (schema is! ResolvedObject) {
        _error('allOf only supports objects: $schema', allOf.pointer);
      }
    }
    return ResolvedAllOf(common: schema.common, schemas: schemas);
  }
  if (schema is SchemaAnyOf) {
    final anyOf = schema;
    final schemas = anyOf.schemas
        .map((e) => resolveSchemaRef(e, context))
        .toList();
    final forceNullable = schemas.any((e) => e is ResolvedNull);
    if (forceNullable) {
      schemas.removeWhere((e) => e is ResolvedNull);
    }
    ResolvedSchema copyIfNeeded(
      ResolvedSchema schema, {
      bool forceNullable = false,
    }) {
      final common = schema.common.copyWith(nullable: forceNullable);
      return schema.copyWith(common: common);
    }

    // Elide the anyOf if there is only only one schema left.
    if (schemas.length == 1) {
      return copyIfNeeded(schemas.first, forceNullable: forceNullable);
    }
    // TODO(eseidel): Make this union(object, List<object>) hack optional.
    // Dart doesn't have union types, but commonly openapi specs come from
    // typescript where foo(bar) and foo([bar]) are the same, we elide the
    // anyOf and just use the array in that case.
    if (schemas.length == 2) {
      final first = schemas.first;
      final second = schemas.last;
      if (first is ResolvedArray && first.items == second) {
        return first;
      } else if (second is ResolvedArray && second.items == first) {
        return second;
      }
    }
    return ResolvedAnyOf(common: schema.common, schemas: schemas);
  }
  if (schema is SchemaNull) {
    return ResolvedNull(common: schema.common);
  }
  if (schema is SchemaUnknown) {
    return ResolvedUnknown(common: schema.common);
  }
  if (schema is SchemaMap) {
    return ResolvedMap(
      common: schema.common,
      valueSchema: resolveSchemaRef(schema.valueSchema, context),
    );
  }
  if (schema is SchemaEmptyObject) {
    return ResolvedEmptyObject(common: schema.common);
  }
  _error('Missing code to resolve schema: $schema', schema.pointer);
}

ResolvedRequestBody? _resolveRequestBody(
  RefOr<RequestBody>? ref,
  ResolveContext context,
) {
  if (ref == null) {
    return null;
  }
  final requestBody = context._maybeResolve(ref);
  if (requestBody == null) {
    _error('Request body not found', ref.pointer);
  }
  final content = requestBody.content;
  final jsonSchema = content['application/json']?.schema;
  if (jsonSchema != null) {
    return ResolvedRequestBody(
      mimeType: MimeType.applicationJson,
      schema: resolveSchemaRef(jsonSchema, context),
      description: requestBody.description,
      isRequired: requestBody.isRequired,
    );
  }
  final octetStreamSchema = content['application/octet-stream']?.schema;
  if (octetStreamSchema != null) {
    return ResolvedRequestBody(
      mimeType: MimeType.applicationOctetStream,
      schema: resolveSchemaRef(octetStreamSchema, context),
      description: requestBody.description,
      isRequired: requestBody.isRequired,
    );
  }
  final textPlainSchema = content['text/plain']?.schema;
  if (textPlainSchema != null) {
    return ResolvedRequestBody(
      mimeType: MimeType.textPlain,
      schema: resolveSchemaRef(textPlainSchema, context),
      description: requestBody.description,
      isRequired: requestBody.isRequired,
    );
  }
  _error(
    'Request body has no application/json, '
    'application/octet-stream, or text/plain schema',
    requestBody.pointer,
  );
}

bool _canBePathParameter(ResolvedSchema schema) {
  if (schema is ResolvedString || schema is ResolvedInteger) {
    return true;
  }
  if (schema is ResolvedOneOf) {
    return schema.schemas.every(_canBePathParameter);
  }

  /// Note this will be wrong if we support non-string, non-integer enums.
  if (schema is ResolvedEnum) {
    return true;
  }
  return false;
}

List<ResolvedParameter> _resolveParameters(
  List<RefOr<Parameter>> parameters,
  ResolveContext context,
) {
  return parameters.map((parameter) {
    final resolved = context._resolve(parameter);
    final type = resolveSchemaRef(resolved.type, context);
    if (resolved.inLocation == ParameterLocation.path &&
        !_canBePathParameter(type)) {
      _error('Path parameters must be strings or integers', resolved.pointer);
    }
    return ResolvedParameter(
      name: resolved.name,
      inLocation: resolved.inLocation,
      description: resolved.description,
      isRequired: resolved.isRequired,
      isDeprecated: resolved.isDeprecated,
      schema: type,
    );
  }).toList();
}

ResolvedSecurityRequirement _resolveSecurityRequirement({
  required SecurityRequirement requirement,
  required List<SecurityScheme> securitySchemes,
}) {
  // Walk the conditions of the requirement and resolve each security scheme.
  final conditions = requirement.conditions.map((name, value) {
    final securityScheme = securitySchemes.firstWhereOrNull(
      (scheme) => scheme.name == name,
    );
    if (securityScheme == null) {
      _error(
        'Security scheme not found with name "$name"',
        requirement.pointer,
      );
    }
    return MapEntry(securityScheme, value);
  });
  return ResolvedSecurityRequirement(conditions: conditions);
}

List<ResolvedSecurityRequirement> _resolveSecurityRequirements({
  required List<SecurityRequirement> securityRequirements,
  required List<SecurityScheme> securitySchemes,
  required List<ResolvedSecurityRequirement> globalSecurityRequirements,
}) {
  if (securityRequirements.isEmpty) {
    return globalSecurityRequirements;
  }

  // Security requirements are looked up by name, not reference.
  final resolved = securityRequirements.map((requirement) {
    return _resolveSecurityRequirement(
      requirement: requirement,
      securitySchemes: securitySchemes,
    );
  }).toList();
  return resolved;
}

ResolvedOperation resolveOperation({
  required String path,
  required Method method,
  required Operation operation,
  required ResolveContext context,
}) {
  final requestBody = _resolveRequestBody(operation.requestBody, context);
  final responses = _resolveResponses(operation.responses, context);

  // Need to resolve any local security requirements, or otherwise fall back to
  // the global security requirements.
  final securityRequirements = _resolveSecurityRequirements(
    securityRequirements: operation.securityRequirements,
    securitySchemes: context.securitySchemes,
    globalSecurityRequirements: context.globalSecurityRequirements,
  );

  return ResolvedOperation(
    pointer: operation.pointer,
    snakeName: operation.snakeName,
    tags: operation.tags,
    summary: operation.summary,
    description: operation.description,
    method: method,
    path: path,
    requestBody: requestBody,
    responses: responses,
    parameters: _resolveParameters(operation.parameters, context),
    securityRequirements: securityRequirements,
  );
}

List<ResolvedOperation> _resolveOperations(
  PathItem pathItem,
  ResolveContext context,
) {
  return pathItem.operations.entries.map((entry) {
    return resolveOperation(
      path: pathItem.path,
      method: entry.key,
      operation: entry.value,
      context: context,
    );
  }).toList();
}

ResolvedSchema _resolveContent(Response response, ResolveContext context) {
  final content = response.content;
  final voidSchema = ResolvedVoid(
    // TODO(eseidel): Should this pass along description?
    common: CommonProperties.empty(
      pointer: response.pointer,
      snakeName: 'void',
    ),
  );
  if (content == null) {
    return voidSchema;
  }
  if (content.isEmpty) {
    _warn('Response has no content: $response', response.pointer);
    return voidSchema;
  }
  final jsonSchema = content['application/json']?.schema;
  if (jsonSchema != null) {
    return resolveSchemaRef(jsonSchema, context);
  }
  _warn('Response has no application/json schema: $response', response.pointer);
  return resolveSchemaRef(content.values.first.schema, context);
}

List<ResolvedResponse> _resolveResponses(
  Responses responses,
  ResolveContext context,
) {
  return responses.responses.entries.map((entry) {
    final statusCode = entry.key;
    final response = context._resolve(entry.value);

    return ResolvedResponse(
      statusCode: statusCode,
      description: response.description,
      content: _resolveContent(response, context),
    );
  }).toList();
}

class RegistryBuilder extends Visitor {
  RegistryBuilder(this.specUrl, this.refRegistry);
  final Uri specUrl;
  final RefRegistry refRegistry;

  void add(HasPointer object) {
    final fragment = object.pointer.urlEncodedFragment;
    final uri = specUrl.resolve(fragment);
    refRegistry.register(uri, object);
  }

  @override
  void visitPathItem(PathItem pathItem) => add(pathItem);
  @override
  void visitOperation(Operation operation) => add(operation);
  @override
  void visitParameter(Parameter parameter) => add(parameter);
  @override
  void visitResponse(Response response) => add(response);
  @override
  void visitRequestBody(RequestBody requestBody) => add(requestBody);
  @override
  void visitSchema(Schema schema) => add(schema);
  @override
  void visitHeader(Header header) => add(header);
}

ResolvedTag _resolvedTag(Tag tag) {
  return ResolvedTag(name: tag.name, description: tag.description);
}

ResolvedSpec resolveSpec(
  OpenApi spec, {
  required Uri specUrl,
  bool logSchemas = true,
}) {
  final refRegistry = RefRegistry();
  final builder = RegistryBuilder(specUrl, refRegistry);
  SpecWalker(builder).walkRoot(spec);

  if (logSchemas) {
    logger.detail('Registered schemas:');
    for (final uri in refRegistry.uris) {
      logger.detail('  - $uri');
    }
  }
  // Need to have resolved security schemes before resolving paths.
  final securitySchemes = spec.components.securitySchemes;
  final globalSecurityRequirements = _resolveSecurityRequirements(
    securityRequirements: spec.securityRequirements,
    securitySchemes: securitySchemes,
    // Don't pass any global security requirements, to disable the fallback
    // behavior while resolving the actual global security requirements.
    globalSecurityRequirements: [],
  );
  final context = ResolveContext(
    specUrl: specUrl,
    refRegistry: refRegistry,
    globalSecurityRequirements: globalSecurityRequirements,
    securitySchemes: securitySchemes,
  );
  return ResolvedSpec(
    title: spec.info.title,
    serverUrl: spec.serverUrl,
    paths: _resolvePaths(spec.paths, context),
    tags: spec.tags.map(_resolvedTag).toList(),
  );
}

class ResolvedTag {
  const ResolvedTag({required this.name, required this.description});

  /// The name of the resolved tag.
  final String name;

  /// The description of the resolved tag.
  final String? description;
}

class ResolvedSpec {
  const ResolvedSpec({
    required this.serverUrl,
    required this.title,
    required this.paths,
    required this.tags,
  });

  /// The server url of the spec.
  final Uri serverUrl;

  /// The title of the spec.
  final String title;

  /// The paths of the spec.
  final List<ResolvedPath> paths;

  /// The tags of the spec.
  final List<ResolvedTag> tags;
}

class ResolvedPath {
  const ResolvedPath({required this.path, required this.operations});

  /// The path of the resolved path.
  final String path;

  /// The operations of the resolved path.
  final List<ResolvedOperation> operations;
}

class ResolvedParameter {
  const ResolvedParameter({
    required this.name,
    required this.inLocation,
    required this.description,
    required this.isRequired,
    required this.isDeprecated,
    required this.schema,
  });

  /// The name of the resolved parameter.
  final String name;

  /// The in of the resolved parameter.
  final ParameterLocation inLocation;

  /// The description of the resolved parameter.
  final String? description;

  /// Whether the parameter is required.
  final bool isRequired;

  /// Whether the parameter is deprecated.
  final bool isDeprecated;

  /// The schema of the resolved parameter.
  final ResolvedSchema schema;
}

class ResolvedRequestBody {
  const ResolvedRequestBody({
    required this.schema,
    required this.description,
    required this.isRequired,
    required this.mimeType,
  });

  /// The mime type of the resolved request body.
  final MimeType mimeType;

  /// The schema of the resolved request body.
  final ResolvedSchema schema;

  /// The description of the resolved request body.
  final String? description;

  /// Whether the request body is required.
  final bool isRequired;
}

class ResolvedSecurityRequirement {
  const ResolvedSecurityRequirement({required this.conditions});

  /// Whether this represents an optional security requirement.
  bool get isOptional => conditions.isEmpty;

  /// The conditions imposed by this security requirement.
  /// Keys are security schemes, and values are the scopes (or roles)
  /// associated with the security scheme.
  final Map<SecurityScheme, List<String>> conditions;
}

class ResolvedOperation {
  const ResolvedOperation({
    required this.method,
    required this.path,
    required this.pointer,
    required this.snakeName,
    required this.requestBody,
    required this.responses,
    required this.tags,
    required this.summary,
    required this.description,
    required this.parameters,
    required this.securityRequirements,
  });

  /// The method of the resolved operation.
  final Method method;

  /// The pointer of the resolved operation.
  final JsonPointer pointer;

  /// The path of the resolved operation.
  final String path;

  /// The snake name of the resolved operation.
  final String snakeName;

  /// The parameters of the resolved operation.
  final List<ResolvedParameter> parameters;

  /// The request body of the resolved operation.
  final ResolvedRequestBody? requestBody;

  /// The responses of the resolved operation.
  final List<ResolvedResponse> responses;

  /// The tags of the resolved operation.
  final List<String> tags;

  /// The summary of the resolved operation.
  final String? summary;

  /// The description of the resolved operation.
  final String? description;

  /// The security requirements of the resolved operation.
  final List<ResolvedSecurityRequirement> securityRequirements;
}

class ResolvedResponse {
  const ResolvedResponse({
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
  final ResolvedSchema content;
}

abstract class ResolvedSchema extends Equatable {
  const ResolvedSchema({required this.common});

  final CommonProperties common;

  JsonPointer get pointer => common.pointer;

  String get snakeName => common.snakeName;

  ResolvedSchema copyWith({CommonProperties? common});

  @override
  List<Object?> get props => [common];

  @override
  String toString() => '$runtimeType(snakeName: $snakeName, pointer: $pointer)';
}

class ResolvedString extends ResolvedSchema {
  const ResolvedString({
    required super.common,
    this.defaultValue,
    this.maxLength,
    this.minLength,
    this.pattern,
  });

  /// The default value of the resolved schema.
  final String? defaultValue;

  /// The maximum length of the resolved schema.
  final int? maxLength;

  /// The minimum length of the resolved schema.
  final int? minLength;

  /// The pattern to match the string against.
  final String? pattern;

  @override
  ResolvedString copyWith({CommonProperties? common}) {
    return ResolvedString(
      common: common ?? this.common,
      defaultValue: defaultValue,
      maxLength: maxLength,
      minLength: minLength,
      pattern: pattern,
    );
  }

  @override
  List<Object?> get props => [
    super.props,
    defaultValue,
    maxLength,
    minLength,
    pattern,
  ];
}

abstract class ResolvedNumeric<T extends num> extends ResolvedSchema {
  const ResolvedNumeric({
    required super.common,
    this.defaultValue,
    this.maximum,
    this.minimum,
    this.exclusiveMaximum,
    this.exclusiveMinimum,
    this.multipleOf,
  });

  /// The default value of the resolved schema.
  final T? defaultValue;

  /// The maximum value of the resolved schema.
  final T? maximum;

  /// The minimum value of the resolved schema.
  final T? minimum;

  /// The exclusive maximum value of the resolved schema.
  final T? exclusiveMaximum;

  /// The exclusive minimum value of the resolved schema.
  final T? exclusiveMinimum;

  /// The multiple of value of the resolved schema.
  final T? multipleOf;

  @override
  List<Object?> get props => [
    super.props,
    maximum,
    minimum,
    exclusiveMaximum,
    exclusiveMinimum,
    multipleOf,
  ];
}

class ResolvedNumber extends ResolvedNumeric<double> {
  const ResolvedNumber({
    required super.common,
    super.maximum,
    super.minimum,
    super.exclusiveMaximum,
    super.exclusiveMinimum,
    super.multipleOf,
    super.defaultValue,
  });

  @override
  ResolvedNumber copyWith({CommonProperties? common}) {
    return ResolvedNumber(
      common: common ?? this.common,
      defaultValue: defaultValue,
      maximum: maximum,
      minimum: minimum,
      exclusiveMaximum: exclusiveMaximum,
      exclusiveMinimum: exclusiveMinimum,
      multipleOf: multipleOf,
    );
  }
}

class ResolvedInteger extends ResolvedNumeric<int> {
  const ResolvedInteger({
    required super.common,
    super.maximum,
    super.minimum,
    super.exclusiveMaximum,
    super.exclusiveMinimum,
    super.multipleOf,
    super.defaultValue,
  });

  @override
  ResolvedInteger copyWith({CommonProperties? common}) {
    return ResolvedInteger(
      common: common ?? this.common,
      defaultValue: defaultValue,
      maximum: maximum,
      minimum: minimum,
      exclusiveMaximum: exclusiveMaximum,
      exclusiveMinimum: exclusiveMinimum,
      multipleOf: multipleOf,
    );
  }
}

// TODO(eseidel): defaultValue should be strongly typed.
class ResolvedPod extends ResolvedSchema {
  const ResolvedPod({
    required super.common,
    required this.type,
    this.defaultValue,
  });

  /// The type of the resolved schema.
  final PodType type;

  /// The default value of the pop type.
  final dynamic defaultValue;

  @override
  ResolvedPod copyWith({CommonProperties? common}) {
    return ResolvedPod(
      common: common ?? this.common,
      type: type,
      defaultValue: defaultValue,
    );
  }

  @override
  List<Object?> get props => [super.props, type, defaultValue];
}

class ResolvedArray extends ResolvedSchema {
  const ResolvedArray({
    required super.common,
    required this.items,
    this.defaultValue,
    this.maxItems,
    this.minItems,
    this.uniqueItems = false,
  });

  /// type of the items in the array
  final ResolvedSchema items;

  /// The maximum number of items in the array.
  final int? maxItems;

  /// The minimum number of items in the array.
  final int? minItems;

  /// Whether the items in the array must be unique.
  final bool uniqueItems;

  /// The default value of the array type.
  final dynamic defaultValue;

  @override
  ResolvedArray copyWith({CommonProperties? common}) {
    return ResolvedArray(
      common: common ?? this.common,
      items: items,
      defaultValue: defaultValue,
      maxItems: maxItems,
      minItems: minItems,
      uniqueItems: uniqueItems,
    );
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
}

class ResolvedEnum extends ResolvedSchema {
  const ResolvedEnum({
    required super.common,
    required this.defaultValue,
    required this.values,
  });

  /// The values of the resolved schema.
  // If we support non-string, non-integer enums, we will need to fix path
  // parameter validation to only allow string and integer enum types.
  final List<String> values;

  /// The default value of the enum type.
  final dynamic defaultValue;

  @override
  ResolvedEnum copyWith({CommonProperties? common}) {
    return ResolvedEnum(
      common: common ?? this.common,
      defaultValue: defaultValue,
      values: values,
    );
  }

  @override
  List<Object?> get props => [super.props, values, defaultValue];
}

class ResolvedObject extends ResolvedSchema {
  const ResolvedObject({
    required super.common,
    required this.properties,
    required this.additionalProperties,
    required this.requiredProperties,
  });

  /// The properties of the resolved schema.
  final Map<String, ResolvedSchema> properties;

  /// The value type when the schema is a map.
  // TODO(eseidel): Should this be a separate type?
  final ResolvedSchema? additionalProperties;

  /// The required properties of the resolved schema.
  final List<String> requiredProperties;

  @override
  ResolvedObject copyWith({CommonProperties? common}) {
    return ResolvedObject(
      common: common ?? this.common,
      properties: properties,
      additionalProperties: additionalProperties,
      requiredProperties: requiredProperties,
    );
  }

  @override
  List<Object?> get props => [
    super.props,
    properties,
    additionalProperties,
    requiredProperties,
  ];
}

/// An unknown schema, typically means empty (e.g. schema: {})
class ResolvedUnknown extends ResolvedSchema {
  const ResolvedUnknown({required super.common});

  @override
  ResolvedUnknown copyWith({CommonProperties? common}) {
    return ResolvedUnknown(common: common ?? this.common);
  }
}

abstract class ResolvedSchemaCollection extends ResolvedSchema {
  const ResolvedSchemaCollection({
    required super.common,
    required this.schemas,
  });

  /// The schemas of the resolved schema collection.
  final List<ResolvedSchema> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

class ResolvedOneOf extends ResolvedSchemaCollection {
  const ResolvedOneOf({required super.schemas, required super.common});

  @override
  ResolvedOneOf copyWith({CommonProperties? common}) {
    return ResolvedOneOf(common: common ?? this.common, schemas: schemas);
  }
}

class ResolvedAnyOf extends ResolvedSchemaCollection {
  const ResolvedAnyOf({required super.schemas, required super.common});

  @override
  ResolvedAnyOf copyWith({CommonProperties? common}) {
    return ResolvedAnyOf(common: common ?? this.common, schemas: schemas);
  }
}

class ResolvedAllOf extends ResolvedSchemaCollection {
  const ResolvedAllOf({required super.schemas, required super.common});

  @override
  ResolvedAllOf copyWith({CommonProperties? common}) {
    return ResolvedAllOf(common: common ?? this.common, schemas: schemas);
  }
}

class ResolvedVoid extends ResolvedSchema {
  const ResolvedVoid({required super.common});

  @override
  ResolvedVoid copyWith({CommonProperties? common}) {
    return ResolvedVoid(common: common ?? this.common);
  }
}

class ResolvedBinary extends ResolvedSchema {
  const ResolvedBinary({required super.common});

  @override
  ResolvedBinary copyWith({CommonProperties? common}) {
    return ResolvedBinary(common: common ?? this.common);
  }
}

class ResolvedNull extends ResolvedSchema {
  const ResolvedNull({required super.common});

  @override
  ResolvedNull copyWith({CommonProperties? common}) {
    return ResolvedNull(common: common ?? this.common);
  }
}

class ResolvedMap extends ResolvedSchema {
  const ResolvedMap({required super.common, required this.valueSchema});

  final ResolvedSchema valueSchema;

  @override
  ResolvedMap copyWith({CommonProperties? common}) {
    return ResolvedMap(common: common ?? this.common, valueSchema: valueSchema);
  }
}

class ResolvedEmptyObject extends ResolvedSchema {
  const ResolvedEmptyObject({required super.common});

  @override
  ResolvedEmptyObject copyWith({CommonProperties? common}) {
    return ResolvedEmptyObject(common: common ?? this.common);
  }
}
