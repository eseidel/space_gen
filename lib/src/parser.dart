import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/string.dart';

/// Parse a parameter from a json object.
Parameter parseParameter({required Json json, required ParseContext context}) {
  final schema = _optional<Json>(json, 'schema');
  final hasSchema = schema != null;
  final hasContent = _optional<Json>(json, 'content') != null;

  // Common fields.
  final name = _required<String>(json, 'name');
  final description = _optional<String>(json, 'description');
  final required = _optional<bool>(json, 'required') ?? false;
  final sendIn = SendIn.fromJson(_required<String>(json, 'in'));
  _ignored(json, 'deprecated');
  _ignored(json, 'allowEmptyValue');

  final SchemaRef type;
  if (hasSchema) {
    if (hasContent) {
      _error(json, 'Parameter cannot have both schema and content');
    }
    // Schema fields.
    type = parseSchemaOrRef(json: schema, context: context.key('schema'));
    _ignored(json, 'style');
    _ignored(json, 'explode');
    _ignored(json, 'allowReserved');
    _ignored(json, 'example');
    _ignored(json, 'examples');
  } else {
    if (!hasSchema && !hasContent) {
      _error(json, 'Parameter must have either schema or content');
    }
    // Content fields.
    // Use an explicit throw so Dart can see `type` is always set.
    throw const FormatException('Content parameters not supported');
  }

  if (sendIn == SendIn.cookie) {
    throw UnimplementedError('Cookie parameters not supported');
  }
  if (sendIn == SendIn.path) {
    if (type.schema?.type != SchemaType.string) {
      throw UnimplementedError('Path parameters must be strings');
    }
    if (required != true) {
      throw UnimplementedError('Path parameters must be required');
    }
  }

  return Parameter(
    name: name,
    description: description,
    isRequired: required,
    sendIn: sendIn,
    type: type,
  );
}

/// Parse a schema from a json object.
Schema parseSchema(Json json, ParseContext context) {
  final type = SchemaType.fromJson(json['type'] as String? ?? 'unknown');
  final properties = parseProperties(
    json: json['properties'] as Json?,
    context: context.key('properties'),
  );
  final items = json['items'] as Json?;
  SchemaRef? itemSchema;
  if (items != null) {
    const innerName = 'inner'; // Matching OpenAPI.
    itemSchema = parseSchemaOrRef(
      json: items,
      context: context.addSnakeName(innerName).key('items'),
    );
  }

  _ignored(json, 'nullable');
  _ignored(json, 'readOnly');
  _ignored(json, 'writeOnly');
  _ignored(json, 'discriminator');
  _ignored(json, 'xml');
  _ignored(json, 'example');
  _ignored(json, 'examples');
  _ignored(json, 'externalDocs');

  final defaultValue = _optional<dynamic>(json, 'default');

  final required = json['required'] as List<dynamic>? ?? [];
  final description = json['description'] as String? ?? '';
  final enumValues = json['enum'] as List<dynamic>? ?? [];
  if (enumValues.isNotEmpty) {
    if (type != SchemaType.string) {
      throw UnimplementedError(
        'Enum values are currently only supported for string types',
      );
    }
  }
  final format = json['format'] as String?;
  final additionalPropertiesJson = json['additionalProperties'];
  SchemaRef? additionalProperties;
  if (additionalPropertiesJson is Json) {
    additionalProperties = parseSchemaOrRef(
      json: additionalPropertiesJson,
      context: context.key('additionalProperties'),
    );
  } else if (additionalPropertiesJson is bool) {
    throw UnimplementedError('additionalProperties is bool');
  } else if (additionalPropertiesJson != null) {
    throw UnimplementedError('additionalProperties is not a map or bool');
  }

  final schema = Schema(
    pointer: context.pointer.toString(),
    snakeName: context.snakeName,
    type: type,
    properties: properties,
    required: required.cast<String>(),
    description: description,
    items: itemSchema,
    enumValues: enumValues.cast<String>(),
    format: format,
    additionalProperties: additionalProperties,
    defaultValue: defaultValue,
    useNewType: context.isTopLevelComponent,
  );
  context.addObject(schema);
  return schema;
}

/// Parse a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
/// https://spec.openapis.org/oas/v3.0.0#relative-references-in-urls
SchemaRef parseSchemaOrRef({
  required Json json,
  required ParseContext context,
}) {
  if (json.containsKey(r'$ref')) {
    return SchemaRef.ref(json[r'$ref'] as String);
  }

  if (json.containsKey('oneOf')) {
    // TODO(eseidel): Support oneOf
    throw UnimplementedError('OneOf not supported');
  }

  if (json.containsKey('allOf')) {
    final allOf = json['allOf'] as List<dynamic>;
    if (allOf.length != 1) {
      throw UnimplementedError('AllOf with ${allOf.length} items');
    }
    return parseSchemaOrRef(
      json: allOf.first as Json,
      context: context.key('allOf'),
    );
  }

  if (json.containsKey('anyOf')) {
    final anyOf = json['anyOf'] as List<dynamic>;
    if (anyOf.length == 1) {
      return parseSchemaOrRef(
        json: anyOf.first as Map<String, dynamic>,
        context: context,
      );
    }
    if (anyOf.length == 2) {
      final first = anyOf.first as Json;
      final second = anyOf.last as Json;

      // Two special case hacks to make space_traders work for now.
      // One is if one is a type and the other is type=null, we just
      // pretend the first is just marked nullable.
      if (first.containsKey('type') && second.containsKey('type')) {
        final firstType = first['type'] as String;
        final secondType = second['type'] as String;
        if (firstType == 'boolean' && secondType == 'null') {
          return parseSchemaOrRef(json: first, context: context);
        }
      }

      // The second hack is if one is an array of ref and the second is
      // that ref, we just pretend it's just an array of that ref.
      if (first.containsKey('items') && second.containsKey(r'$ref')) {
        final items = first['items'] as Json;
        final ref = second[r'$ref'] as String;
        if (items[r'$ref'] == ref) {
          return parseSchemaOrRef(json: first, context: context);
        }
      }
    }

    throw UnimplementedError('AnyOf with ${anyOf.length} items');
  }

  return SchemaRef.schema(parseSchema(json, context));
}

/// Parse a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
/// https://spec.openapis.org/oas/v3.0.0#relative-references-in-urls
RefOr<RequestBody> parseRequestBodyOrRef({
  required Json json,
  required ParseContext context,
}) {
  if (json.containsKey(r'$ref')) {
    return RefOr<RequestBody>.ref(json[r'$ref'] as String);
  }
  final body = parseRequestBody(json, context);
  return RefOr<RequestBody>.object(body);
}

/// Parse the properties of a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
Map<String, SchemaRef> parseProperties({
  required Json? json,
  required ParseContext context,
}) {
  if (json == null) {
    return {};
  }
  final properties = <String, SchemaRef>{};
  if (json.isEmpty) {
    return properties;
  }
  for (final entry in json.entries) {
    final name = entry.key;
    final snakeName = snakeFromCamel(name);
    final value = entry.value as Json;
    properties[name] = parseSchemaOrRef(
      json: value,
      context: context.addSnakeName(snakeName).key(name),
    );
  }
  return properties;
}

RequestBody parseRequestBody(Json requestBodyJson, ParseContext context) {
  final content = _required<Json>(requestBodyJson, 'content');
  final applicationJson = _required<Json>(content, 'application/json');
  final schema = parseSchemaOrRef(
    json: _required<Json>(applicationJson, 'schema'),
    context: context.addSnakeName('request').key('requestBody'),
  );
  _ignored(requestBodyJson, 'description');

  final isRequired = requestBodyJson['required'] as bool? ?? false;
  final body = RequestBody(
    pointer: context.pointer.toString(),
    isRequired: isRequired,
    schema: schema,
  );
  context.addObject(body);
  return body;
}

/// Parse an endpoint from a json object.
Endpoint parseEndpoint({
  required Json json,
  required String path,
  required Method method,
  required ParseContext parentContext,
}) {
  final snakeName =
      (json['operationId'] as String? ?? Uri.parse(path).pathSegments.last)
          .replaceAll('-', '_');

  final context = parentContext.addSnakeName(snakeName);

  final responses = parseResponses(
    _optional<Json>(json, 'responses'),
    context.key('responses'),
  );
  final tags = _optional<List<dynamic>>(json, 'tags');
  final tag = tags?.firstOrNull as String? ?? 'Default';
  final parametersJson = _optional<List<dynamic>>(json, 'parameters') ?? [];
  final parameters = parametersJson
      .cast<Json>()
      .indexed
      .map(
        (indexed) => parseParameter(
          json: indexed.$2,
          context: context
              .addSnakeName('parameter${indexed.$1}')
              .key('parameters')
              .index(indexed.$1),
        ),
      )
      .toList();
  final requestBodyJson = json['requestBody'] as Json?;
  RefOr<RequestBody>? requestBody;
  if (requestBodyJson != null) {
    requestBody = parseRequestBodyOrRef(
      json: requestBodyJson,
      context: context.key('requestBody'),
    );
  }
  return Endpoint(
    path: path,
    method: method,
    tag: tag,
    responses: responses,
    snakeName: snakeName,
    parameters: parameters,
    requestBody: requestBody,
  );
}

List<Response> parseResponses(Json? json, ParseContext parentContext) {
  if (json == null) {
    return [];
  }
  // Hack to make get cooldown compile.
  final responseCodes = json.keys.toList()..remove('204');
  if (responseCodes.length != 1) {
    throw UnimplementedError(
      'Multiple responses not supported: ${parentContext.pointer}',
    );
  }

  final responseCode = responseCodes.first;
  final responseTypes = json[responseCode] as Json;
  final content = responseTypes['content'] as Json?;
  if (content == null) {
    return [];
  }
  final jsonResponse = content['application/json'] as Json;
  return [
    Response(
      code: int.parse(responseCode),
      content: parseSchemaOrRef(
        json: jsonResponse['schema'] as Json,
        context: parentContext
            .addSnakeName(responseCode)
            .addSnakeName('response')
            .key(responseCode)
            .key('content')
            .key('application/json')
            .key('schema'),
      ),
    ),
  ];
}

Components parseComponents(Json? json, ParseContext context) {
  if (json == null) {
    return const Components(schemas: {}, requestBodies: {});
  }
  final keys = json.keys.toList();
  final supportedKeys = ['schemas', 'securitySchemes', 'requestBodies'];

  for (final key in keys) {
    if (!supportedKeys.contains(key)) {
      final value = json[key] as Json;
      if (value.isNotEmpty) {
        throw UnimplementedError('Components key not supported: $key');
      }
    }
  }

  final securitySchemesJson = json['securitySchemes'] as Json?;
  if (securitySchemesJson != null) {
    logger.warn('Ignoring securitySchemes.');
  }

  final schemasJson = json['schemas'] as Json?;
  final schemas = <String, Schema>{};
  if (schemasJson != null) {
    for (final entry in schemasJson.entries) {
      final name = entry.key;
      final snakeName = snakeFromCamel(name);
      final value = entry.value as Json;
      final childContext = context
          .addSnakeName(snakeName, isTopLevelComponent: true)
          .key('schemas')
          .key(name);
      final ref = parseSchemaOrRef(json: value, context: childContext);
      final schema = ref.schema;
      if (schema == null) {
        throw UnimplementedError(
          'reference found, schema expected: ${childContext.pointer}',
        );
      }
      schemas[name] = schema;
    }
  }

  final requestBodiesJson = json['requestBodies'] as Json?;
  final requestBodies = <String, RequestBody>{};
  if (requestBodiesJson != null) {
    for (final entry in requestBodiesJson.entries) {
      final name = entry.key;
      final snakeName = snakeFromCamel(name);
      final value = entry.value as Json;
      requestBodies[name] = parseRequestBody(
        value,
        context
            .addSnakeName(snakeName, isTopLevelComponent: true)
            .key('requestBodies')
            .key(name),
      );
    }
  }

  return Components(schemas: schemas, requestBodies: requestBodies);
}

Spec parseSpec(Json json, ParseContext context) {
  final servers = _required<List<dynamic>>(json, 'servers');
  final firstServer = servers.first as Json;
  final serverUrl = _required<String>(firstServer, 'url');

  final paths = _required<Json>(json, 'paths');
  final endpoints = <Endpoint>[];
  for (final pathEntry in paths.entries) {
    final path = pathEntry.key;
    _expect(path.isNotEmpty, json, 'Path cannot be empty');
    _expect(path.startsWith('/'), json, 'Path must start with /: $path');
    final pathValue = pathEntry.value as Json;
    for (final method in Method.values) {
      final methodValue = pathValue[method.key] as Json?;
      if (methodValue == null) {
        continue;
      }
      endpoints.add(
        parseEndpoint(
          parentContext: context.key('paths').key(path).key(method.key),
          path: path,
          json: methodValue,
          method: method,
        ),
      );
    }
  }
  final components = parseComponents(
    json['components'] as Json?,
    context.key('components'),
  );
  return Spec(Uri.parse(serverUrl), endpoints, components);
}

T _required<T>(Json json, String key) {
  final value = json[key];
  if (value == null) {
    throw FormatException('Required key not found: $key in $json');
  }
  return value as T;
}

void _expect(bool condition, Json json, String message) {
  if (!condition) {
    throw FormatException('$message in $json');
  }
}

T? _optional<T>(Json json, String key) {
  final value = json[key];
  if (value is T?) {
    return value;
  }
  throw FormatException('Key $key is not of type $T: $value (from $json)');
}

// void _unimplemented(Json json, String key) {
//   final value = json[key];
//   if (value != null) {
//     throw UnimplementedError('Unsupported key: $key in $json');
//   }
// }

void _ignored(Json json, String key) {
  final value = json[key];
  if (value != null) {
    logger.detail('Ignoring key: $key in $json');
  }
}

void _error(Json json, String message) {
  throw FormatException('$message in $json');
}
