import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/string.dart';

T _required<T>(ParseContext context, Json json, String key) {
  final value = json[key];
  if (value == null) {
    throw FormatException(
      'Required key not found: $key in ${context.pointer}: $json',
    );
  }
  return value as T;
}

void _expect(bool condition, ParseContext context, Json json, String message) {
  if (!condition) {
    throw FormatException('$message in ${context.pointer}');
  }
}

T? _optional<T>(ParseContext context, Json json, String key) {
  final value = json[key];
  if (value is T?) {
    return value;
  }
  throw FormatException(
    'Key $key is not of type $T: $value (in ${context.pointer})',
  );
}

// void _unimplemented(Json json, String key) {
//   final value = json[key];
//   if (value != null) {
//     throw UnimplementedError('Unsupported key: $key in $json');
//   }
// }

void _ignored(ParseContext context, Json json, String key) {
  final value = json[key];
  if (value != null) {
    logger.detail('Ignoring key: $key in ${context.pointer}');
  }
}

void _warn(ParseContext context, Json json, String message) {
  logger.warn('$message in ${context.pointer}');
}

void _error(ParseContext context, Json json, String message) {
  throw FormatException('$message in ${context.pointer}');
}

/// Parse a parameter from a json object.
Parameter parseParameter({required Json json, required ParseContext context}) {
  final schema = _optional<Json>(context, json, 'schema');
  final hasSchema = schema != null;
  final hasContent = _optional<Json>(context, json, 'content') != null;

  // Common fields.
  final name = _required<String>(context, json, 'name');
  final description = _optional<String>(context, json, 'description');
  final required = _optional<bool>(context, json, 'required') ?? false;
  final sendIn = SendIn.fromJson(_required<String>(context, json, 'in'));
  _ignored(context, json, 'deprecated');
  _ignored(context, json, 'allowEmptyValue');

  final SchemaRef type;
  if (hasSchema) {
    if (hasContent) {
      _error(context, json, 'Parameter cannot have both schema and content');
    }
    // Schema fields.
    type = parseSchemaOrRef(json: schema, context: context.key('schema'));
    _ignored(context, json, 'style');
    _ignored(context, json, 'explode');
    _ignored(context, json, 'allowReserved');
    _ignored(context, json, 'example');
    _ignored(context, json, 'examples');
  } else {
    if (!hasSchema && !hasContent) {
      _error(context, json, 'Parameter must have either schema or content');
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

  _ignored(context, json, 'nullable');
  _ignored(context, json, 'readOnly');
  _ignored(context, json, 'writeOnly');
  _ignored(context, json, 'discriminator');
  _ignored(context, json, 'xml');
  _ignored(context, json, 'example');
  _ignored(context, json, 'examples');
  _ignored(context, json, 'externalDocs');

  final defaultValue = _optional<dynamic>(context, json, 'default');

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
  final content = _required<Json>(context, requestBodyJson, 'content');
  final applicationJson = _required<Json>(context, content, 'application/json');
  final schema = parseSchemaOrRef(
    json: _required<Json>(context, applicationJson, 'schema'),
    context: context.addSnakeName('request').key('requestBody'),
  );
  _ignored(context, requestBodyJson, 'description');

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
    _optional<Json>(context, json, 'responses'),
    context.key('responses'),
  );
  final tags = _optional<List<dynamic>>(context, json, 'tags');
  final tag = tags?.firstOrNull as String? ?? 'Default';
  final parametersJson =
      _optional<List<dynamic>>(context, json, 'parameters') ?? [];
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

Info parseInfo(Json json, ParseContext context) {
  final title = _required<String>(context, json, 'title');
  final version = _required<String>(context, json, 'version');
  _ignored(context, json, 'summary');
  _ignored(context, json, 'description');
  _ignored(context, json, 'termsOfService');
  _ignored(context, json, 'contact');
  _ignored(context, json, 'license');
  return Info(title, version);
}

OpenApi parseOpenApi(Json json, ParseContext context) {
  final minimumVersion = Version.parse('3.1.0');
  final versionString = _required<String>(context, json, 'openapi');
  final version = Version.parse(versionString);
  if (version < minimumVersion) {
    _warn(
      context,
      json,
      '$version may not be supported, only tested with 3.1.0',
    );
  }

  final infoJson = _required<Json>(context, json, 'info');
  final info = parseInfo(infoJson, context.key('info'));

  final servers = _required<List<dynamic>>(context, json, 'servers');
  final firstServer = servers.first as Json;
  final serverUrl = _required<String>(context, firstServer, 'url');

  final paths = _required<Json>(context, json, 'paths');
  final endpoints = <Endpoint>[];
  for (final pathEntry in paths.entries) {
    final path = pathEntry.key;
    final pathContext = context.key('paths').key(path);
    _expect(path.isNotEmpty, pathContext, json, 'Path cannot be empty');
    _expect(
      path.startsWith('/'),
      pathContext,
      json,
      'Path must start with /: $path',
    );
    final pathValue = pathEntry.value as Json;
    for (final method in Method.values) {
      final methodValue = pathValue[method.key] as Json?;
      if (methodValue == null) {
        continue;
      }
      endpoints.add(
        parseEndpoint(
          parentContext: pathContext.key(method.key),
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
  return OpenApi(
    serverUrl: Uri.parse(serverUrl),
    version: version,
    info: info,
    endpoints: endpoints,
    components: components,
  );
}

class RefRegistry {
  RefRegistry();

  final objectsByUri = <Uri, dynamic>{};

  Iterable<Uri> get uris => objectsByUri.keys;

  T get<T>(Uri uri) {
    final object = objectsByUri[uri];
    if (object == null) {
      throw StateError('$T not found: $uri');
    }
    if (object is! T) {
      throw StateError('Expected $T, got $object');
    }
    return object;
  }

  void register(Uri uri, dynamic object) {
    if (objectsByUri.containsKey(uri)) {
      logger
        ..warn('Object already registered: $uri')
        ..info('before: ${objectsByUri[uri]}')
        ..info('after: $object');
      throw Exception('Object already registered: $uri');
    }
    if (object is Schema) {
      final schema = object;
      final byName = objectsByUri.entries
          .where((e) => e.value is Schema)
          .firstWhereOrNull(
            (e) => (e.value as Schema).snakeName == schema.snakeName,
          );
      if (byName != null) {
        logger
          ..warn('Schema already registered by name: ${schema.snakeName}')
          ..info('existing uri: ${byName.key}')
          ..info('existing schema: ${byName.value}')
          ..info('new uri: $uri')
          ..info('new schema: $schema');
      }
    }
    objectsByUri[uri] = object;
  }
}

/// Json pointer is a string that can be used to reference a value in a json
/// object.
/// https://spec.openapis.org/oas/v3.1.0#json-pointer
@immutable
class JsonPointer extends Equatable {
  /// Create a new JsonPointer from a list of parts.
  const JsonPointer(this.parts);

  /// The parts of the json pointer.
  final List<String> parts;

  /// This pointer encoded as a url-ready string.
  String get location => '/${parts.map(urlEncode).join('/')}';

  /// Encode a part of the json pointer as a url-ready string.
  static String urlEncode(String part) =>
      part.replaceAll('~', '~0').replaceAll('/', '~1');

  @override
  String toString() => '/${parts.join('/')}';

  @override
  List<Object?> get props => [parts];
}

/// Immutable context for parsing a spec.
/// SchemaRegistry is internally mutable, so this is not truly immutable.
class ParseContext {
  ParseContext({
    required this.baseUrl,
    required this.pointerParts,
    required this.snakeNameStack,
    required this.refRegistry,
    required this.isTopLevelComponent,
  }) {
    if (baseUrl.hasFragment) {
      throw ArgumentError.value(
        baseUrl,
        'baseUrl',
        'Base url cannot have a fragment',
      );
    }
  }
  ParseContext.initial(this.baseUrl)
    : pointerParts = [],
      snakeNameStack = [],
      refRegistry = RefRegistry(),
      isTopLevelComponent = false;

  /// The base url of the spec being parsed.
  final Uri baseUrl;

  /// Json pointer location of the current schema.
  final List<String> pointerParts;

  /// Stack of name parts for the current schema.
  final List<String> snakeNameStack;

  /// Whether the current schema is a top-level component.
  final bool isTopLevelComponent;

  JsonPointer get pointer => JsonPointer(pointerParts);

  String get snakeName {
    // To match OpenAPI, we don't put a _ before numbers.
    final buf = StringBuffer();
    for (final e in snakeNameStack) {
      if (buf.isNotEmpty && (e.isNotEmpty && int.tryParse(e[0]) == null)) {
        buf.write('_');
      }
      buf.write(e);
    }
    return buf.toString();
  }

  // Registry of all the schemas we've parsed so far.
  // RefRegistry is internally mutable.
  final RefRegistry refRegistry;

  ParseContext _addPart(String part) =>
      copyWith(pointerParts: [...pointerParts, part]);

  ParseContext key(String key) => _addPart(key);
  ParseContext index(int index) => _addPart(index.toString());

  void addObject(dynamic object) {
    final uri = baseUrl.replace(fragment: pointer.toString());
    refRegistry.register(uri, object);
  }

  /// Add a snake name to the current context.
  /// Also resets the top-level component flag by default.
  ParseContext addSnakeName(
    String snakeName, {
    bool isTopLevelComponent = false,
  }) => copyWith(
    snakeNameStack: [...snakeNameStack, snakeName],
    isTopLevelComponent: isTopLevelComponent,
  );

  ParseContext copyWith({
    List<String>? pointerParts,
    List<String>? snakeNameStack,
    bool? isTopLevelComponent,
  }) {
    return ParseContext(
      baseUrl: baseUrl,
      pointerParts: pointerParts ?? this.pointerParts,
      snakeNameStack: snakeNameStack ?? this.snakeNameStack,
      refRegistry: refRegistry,
      isTopLevelComponent: isTopLevelComponent ?? this.isTopLevelComponent,
    );
  }
}
