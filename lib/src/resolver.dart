// The job here is to walk the spec and resolve all the references.
// This also creates a tree that is more designed for rendering rather
// than serialization/deserialization with the openapi spec.
// This also discards all non-json values.

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
  ResolveContext({required this.specUrl, required this.refRegistry});

  /// Used for cases where we need a ResolveContext, but don't actually
  /// plan to look up any objects in the registry.
  ResolveContext.test()
    : specUrl = Uri.parse('https://example.com'),
      refRegistry = RefRegistry();

  /// The spec url of the spec.
  final Uri specUrl;

  /// The registry of all the objects we've parsed so far.
  final RefRegistry refRegistry;

  /// The registry of all the objects we've parsed so far.
  /// Resolve a nullable [SchemaRef] into a nullable [SchemaObject].
  T? _maybeResolve<T>(RefOr<T>? ref) {
    if (ref == null) {
      return null;
    }
    return _resolve(ref);
  }

  /// Resolve a [SchemaRef] into a [SchemaObject].
  T _resolve<T>(RefOr<T> ref) {
    if (ref.object != null) {
      return ref.object!;
    }
    final uri = specUrl.resolve(ref.ref!);
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
      pointer: schema.pointer,
      description: schema.description,
      properties: schema.properties.map((key, value) {
        return MapEntry(key, resolveSchemaRef(value, context));
      }),
      snakeName: schema.snakeName,
      additionalProperties: _maybeResolveSchemaRef(
        schema.additionalProperties,
        context,
      ),
      requiredProperties: schema.requiredProperties,
    );
  }
  if (schema is SchemaEnum) {
    return ResolvedEnum(
      pointer: schema.pointer,
      description: schema.description,
      defaultValue: schema.defaultValue,
      values: schema.enumValues,
      snakeName: schema.snakeName,
    );
  }
  if (schema is SchemaBinary) {
    return ResolvedBinary(
      pointer: schema.pointer,
      snakeName: schema.snakeName,
      description: schema.description,
    );
  }
  if (schema is SchemaPod) {
    return ResolvedPod(
      type: schema.type,
      pointer: schema.pointer,
      snakeName: schema.snakeName,
      description: schema.description,
      defaultValue: schema.defaultValue,
    );
  }
  if (schema is SchemaInteger) {
    return ResolvedInteger(
      pointer: schema.pointer,
      snakeName: schema.snakeName,
      description: schema.description,
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
      pointer: schema.pointer,
      snakeName: schema.snakeName,
      description: schema.description,
      defaultValue: schema.defaultValue,
      maxLength: schema.maxLength,
      minLength: schema.minLength,
      pattern: schema.pattern,
    );
  }
  if (schema is SchemaNumber) {
    return ResolvedNumber(
      pointer: schema.pointer,
      snakeName: schema.snakeName,
      description: schema.description,
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
      items: items,
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
      defaultValue: schema.defaultValue,
    );
  }
  if (schema is SchemaOneOf) {
    final oneOf = schema;
    return ResolvedOneOf(
      schemas: oneOf.schemas.map((e) => resolveSchemaRef(e, context)).toList(),
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
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
    return ResolvedAllOf(
      schemas: schemas,
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
    );
  }
  if (schema is SchemaAnyOf) {
    final anyOf = schema;
    final schemas = anyOf.schemas
        .map((e) => resolveSchemaRef(e, context))
        .toList();
    // Elide the anyOf if there is only one schema.
    if (schemas.length == 1) {
      return schemas.first;
    }
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
      // If one of the schemas is null, we can just return the other schema.
      // We may need to copy it to make it nullable?
      if (first is ResolvedPod && second is ResolvedNull) {
        return first;
      }
      if (first is ResolvedNull && second is ResolvedPod) {
        return second;
      }
    }
    return ResolvedAnyOf(
      schemas: schemas,
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
    );
  }
  if (schema is SchemaNull) {
    return ResolvedNull(
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
    );
  }
  if (schema is SchemaUnknown) {
    return ResolvedUnknown(
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
    );
  }
  if (schema is SchemaMap) {
    return ResolvedMap(
      valueSchema: resolveSchemaRef(schema.valueSchema, context),
      snakeName: schema.snakeName,
      pointer: schema.pointer,
      description: schema.description,
    );
  }
  if (schema is SchemaEmptyObject) {
    return ResolvedEmptyObject(
      pointer: schema.pointer,
      snakeName: schema.snakeName,
      description: schema.description,
    );
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
    if (resolved.sendIn == SendIn.path && !_canBePathParameter(type)) {
      _error('Path parameters must be strings or integers', resolved.pointer);
    }
    return ResolvedParameter(
      name: resolved.name,
      sendIn: resolved.sendIn,
      description: resolved.description,
      isRequired: resolved.isRequired,
      schema: type,
    );
  }).toList();
}

ResolvedOperation resolveOperation({
  required String path,
  required Method method,
  required Operation operation,
  required ResolveContext context,
}) {
  final requestBody = _resolveRequestBody(operation.requestBody, context);
  final responses = _resolveResponses(operation.responses, context);
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
  // Should this just be a void response?
  if (content == null) {
    return ResolvedVoid(
      snakeName: 'void',
      pointer: response.pointer,
      description: response.description,
    );
  }
  if (content.isEmpty) {
    _warn('Response has no content: $response', response.pointer);
    return ResolvedVoid(
      snakeName: 'void',
      pointer: response.pointer,
      description: response.description,
    );
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
  RegistryBuilder(this.spec, this.refRegistry);
  final OpenApi spec;
  final RefRegistry refRegistry;

  void add(HasPointer object) {
    final uri = spec.serverUrl.replace(fragment: object.pointer.location);
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

ResolvedSpec resolveSpec(OpenApi spec) {
  final refRegistry = RefRegistry();
  final builder = RegistryBuilder(spec, refRegistry);
  SpecWalker(builder).walkRoot(spec);

  logger.detail('Registered schemas:');
  for (final uri in refRegistry.uris) {
    logger.detail('  - $uri');
  }

  final context = ResolveContext(
    specUrl: spec.serverUrl,
    refRegistry: refRegistry,
  );
  return ResolvedSpec(
    serverUrl: spec.serverUrl,
    paths: _resolvePaths(spec.paths, context),
  );
}

class ResolvedSpec {
  const ResolvedSpec({required this.serverUrl, required this.paths});

  /// The server url of the spec.
  final Uri serverUrl;

  /// The paths of the spec.
  final List<ResolvedPath> paths;
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
    required this.sendIn,
    required this.description,
    required this.isRequired,
    required this.schema,
  });

  /// The name of the resolved parameter.
  final String name;

  /// The in of the resolved parameter.
  final SendIn sendIn;

  /// The description of the resolved parameter.
  final String? description;

  /// Whether the parameter is required.
  final bool isRequired;

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
  const ResolvedSchema({
    required this.snakeName,
    required this.pointer,
    required this.description,
  });

  /// Where this schema is located in the spec.
  final JsonPointer pointer;

  /// The snake name of the resolved schema.
  final String snakeName;

  /// The description of the resolved schema.
  final String? description;

  @override
  List<Object?> get props => [pointer, snakeName, description];

  @override
  String toString() => '$runtimeType(snakeName: $snakeName, pointer: $pointer)';
}

class ResolvedString extends ResolvedSchema {
  const ResolvedString({
    required super.snakeName,
    required super.pointer,
    required super.description,
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

  /// The pattern of the resolved schema.
  final String? pattern;

  @override
  List<Object?> get props => [super.props, defaultValue];
}

abstract class ResolvedNumeric<T extends num> extends ResolvedSchema {
  const ResolvedNumeric({
    required super.snakeName,
    required super.pointer,
    required super.description,
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
    required super.snakeName,
    required super.pointer,
    required super.description,
    super.maximum,
    super.minimum,
    super.exclusiveMaximum,
    super.exclusiveMinimum,
    super.multipleOf,
    super.defaultValue,
  });
}

class ResolvedInteger extends ResolvedNumeric<int> {
  const ResolvedInteger({
    required super.snakeName,
    required super.pointer,
    required super.description,
    super.maximum,
    super.minimum,
    super.exclusiveMaximum,
    super.exclusiveMinimum,
    super.multipleOf,
    super.defaultValue,
  });
}

class ResolvedPod extends ResolvedSchema {
  const ResolvedPod({
    required super.snakeName,
    required super.pointer,
    required super.description,
    required this.type,
    this.defaultValue,
  });

  /// The type of the resolved schema.
  final PodType type;

  /// The default value of the pop type.
  final dynamic defaultValue;

  @override
  List<Object?> get props => [super.props, type, defaultValue];
}

class ResolvedArray extends ResolvedSchema {
  const ResolvedArray({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.items,
    this.defaultValue,
  });

  /// type of the items in the array
  final ResolvedSchema items;

  /// The default value of the array type.
  final dynamic defaultValue;

  @override
  List<Object?> get props => [super.props, items, defaultValue];
}

class ResolvedEnum extends ResolvedSchema {
  const ResolvedEnum({
    required super.snakeName,
    required super.pointer,
    required super.description,
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
  List<Object?> get props => [super.props, values, defaultValue];
}

class ResolvedObject extends ResolvedSchema {
  const ResolvedObject({
    required super.pointer,
    required super.snakeName,
    required super.description,
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
  List<Object?> get props => [
    super.props,
    properties,
    additionalProperties,
    requiredProperties,
  ];
}

/// An unknown schema, typically means empty (e.g. schema: {})
class ResolvedUnknown extends ResolvedSchema {
  const ResolvedUnknown({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

abstract class ResolvedSchemaCollection extends ResolvedSchema {
  const ResolvedSchemaCollection({
    required super.snakeName,
    required super.pointer,
    required super.description,
    required this.schemas,
  });

  /// The schemas of the resolved schema collection.
  final List<ResolvedSchema> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

class ResolvedOneOf extends ResolvedSchemaCollection {
  const ResolvedOneOf({
    required super.schemas,
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

class ResolvedAnyOf extends ResolvedSchemaCollection {
  const ResolvedAnyOf({
    required super.schemas,
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

class ResolvedAllOf extends ResolvedSchemaCollection {
  const ResolvedAllOf({
    required super.schemas,
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

class ResolvedVoid extends ResolvedSchema {
  const ResolvedVoid({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

class ResolvedBinary extends ResolvedSchema {
  const ResolvedBinary({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

class ResolvedNull extends ResolvedSchema {
  const ResolvedNull({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}

class ResolvedMap extends ResolvedSchema {
  const ResolvedMap({
    required super.snakeName,
    required super.pointer,
    required super.description,
    required this.valueSchema,
  });

  final ResolvedSchema valueSchema;
}

class ResolvedEmptyObject extends ResolvedSchema {
  const ResolvedEmptyObject({
    required super.snakeName,
    required super.pointer,
    required super.description,
  });
}
