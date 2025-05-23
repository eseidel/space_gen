import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/string.dart';

typedef Json = Map<String, dynamic>;

enum SendIn {
  query,
  header,
  path,
  cookie;

  static SendIn fromJson(String json) {
    switch (json) {
      case 'query':
        return query;
      case 'header':
        return header;
      case 'path':
        return path;
      case 'cookie':
        return cookie;
      default:
        throw ArgumentError.value(json, 'json', 'Unknown SendIn');
    }
  }
}

class Parameter {
  const Parameter({
    required this.name,
    required this.description,
    required this.type,
    required this.isRequired,
    required this.sendIn,
  });

  factory Parameter.parse({
    required Map<String, dynamic> json,
    required ParseContext context,
  }) {
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
  final String name;
  final String? description;
  final bool isRequired;
  final SendIn sendIn;
  final SchemaRef type;
}

enum SchemaType {
  string,
  number,
  integer,
  boolean,
  array,
  object,
  unknown; // if 'type' is missing.

  static SchemaType fromJson(String json) {
    switch (json) {
      case 'string':
        return string;
      case 'number':
        return number;
      case 'integer':
        return integer;
      case 'boolean':
        return boolean;
      case 'array':
        return array;
      case 'object':
        return object;
      case 'unknown':
        return unknown;
      default:
        throw ArgumentError.value(json, 'json', 'Unknown SchemaType');
    }
  }
}

@immutable
class SchemaRef {
  const SchemaRef.fromPath({required String ref}) : schema = null, uri = ref;
  const SchemaRef.schema(this.schema) : uri = null;

  final String? uri;
  final Schema? schema;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchemaRef &&
          runtimeType == other.runtimeType &&
          uri == other.uri &&
          schema == other.schema;

  @override
  int get hashCode => Object.hash(uri, schema);
}

// https://spec.openapis.org/oas/v3.0.0#schemaObject
class Schema {
  Schema({
    required this.pointer,
    required this.snakeName,
    required this.type,
    required this.properties,
    required this.required,
    required this.description,
    required this.items,
    required this.enumValues,
    required this.format,
    required this.additionalProperties,
    required this.defaultValue,
  }) {
    if (type == SchemaType.object && snakeName.isEmpty) {
      throw ArgumentError.value(
        snakeName,
        'snakeName',
        'Schema name cannot be empty',
      );
    }
  }

  factory Schema.parse(Map<String, dynamic> json, ParseContext context) {
    final type = json['type'] as String? ?? 'unknown';
    final properties = parseProperties(
      json: json['properties'] as Map<String, dynamic>?,
      context: context.key('properties'),
    );
    final items = json['items'] as Map<String, dynamic>?;
    SchemaRef? itemSchema;
    if (items != null) {
      itemSchema = parseSchemaOrRef(
        json: items,
        context: context.addSnakeName('item').key('items'),
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
    final format = json['format'] as String?;
    final additionalPropertiesJson = json['additionalProperties'];
    SchemaRef? additionalProperties;
    if (additionalPropertiesJson is Map<String, dynamic>) {
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
      type: SchemaType.fromJson(type),
      properties: properties,
      required: required.cast<String>(),
      description: description,
      items: itemSchema,
      enumValues: enumValues.cast<String>(),
      format: format,
      additionalProperties: additionalProperties,
      defaultValue: defaultValue,
    );
    context.addSchema(schema);
    return schema;
  }

  /// Json pointer location of this schema.
  final String pointer;

  /// Name of this schema based on parse location.
  final String snakeName;

  final SchemaType type;
  final Map<String, SchemaRef> properties;
  final List<String> required;
  final String description;
  final SchemaRef? items;
  final List<String> enumValues;
  final String? format;
  final SchemaRef? additionalProperties;
  final dynamic defaultValue;

  @override
  String toString() {
    return 'Schema(type: $type, properties: $properties, '
        'required: $required, description: $description, '
        'items: $items, enumValues: $enumValues, format: $format)';
  }
}

/// Parse a schema or a reference to a schema.
SchemaRef parseSchemaOrRef({
  required Map<String, dynamic> json,
  required ParseContext context,
}) {
  if (json.containsKey(r'$ref')) {
    return SchemaRef.fromPath(ref: json[r'$ref'] as String);
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
      json: allOf.first as Map<String, dynamic>,
      context: context.key('allOf'),
    );
  }

  return SchemaRef.schema(Schema.parse(json, context));
}

Map<String, SchemaRef> parseProperties({
  required Map<String, dynamic>? json,
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
    final value = entry.value as Map<String, dynamic>;
    properties[name] = parseSchemaOrRef(
      json: value,
      context: context.addSnakeName(snakeName).key(name),
    );
  }
  return properties;
}

enum Method {
  get,
  post,
  put,
  delete,
  patch,
  head,
  options,
  trace;

  String get key => name.toLowerCase();
}

// https://spec.openapis.org/oas/v3.0.0#path-item-object
class Endpoint {
  const Endpoint({
    required this.path,
    required this.method,
    required this.tag,
    required this.responses,
    required this.parameters,
    required this.snakeName,
    required this.requestBody,
  });

  factory Endpoint.parse({
    required Map<String, dynamic> json,
    required String path,
    required Method method,
    required ParseContext parentContext,
  }) {
    final snakeName =
        (json['operationId'] as String? ?? Uri.parse(path).pathSegments.last)
            .replaceAll('-', '_');

    final context = parentContext.addSnakeName(snakeName);

    final responses = parseResponses(
      _optional<Map<String, dynamic>>(json, 'responses'),
      context.key('responses'),
    );
    final tags = _optional<List<dynamic>>(json, 'tags');
    final tag = tags?.firstOrNull as String? ?? 'Default';
    final parametersJson = _optional<List<dynamic>>(json, 'parameters') ?? [];
    final parameters = parametersJson
        .cast<Map<String, dynamic>>()
        .indexed
        .map(
          (indexed) => Parameter.parse(
            json: indexed.$2,
            context: context
                .addSnakeName('parameter${indexed.$1}')
                .key('parameters')
                .index(indexed.$1),
          ),
        )
        .toList();
    final requestBodyJson = json['requestBody'] as Map<String, dynamic>?;
    SchemaRef? requestBody;
    if (requestBodyJson != null) {
      final content = requestBodyJson['content'] as Map<String, dynamic>;
      final json = content['application/json'] as Map<String, dynamic>;
      requestBody = parseSchemaOrRef(
        json: json['schema'] as Map<String, dynamic>,
        context: context.addSnakeName('request').key('requestBody'),
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

  final String path;
  final Method method;
  final String tag;
  final List<Response> responses;
  final String snakeName;
  final List<Parameter> parameters;
  final SchemaRef? requestBody;
}

class Response {
  const Response({required this.code, required this.content});

  final int code;
  // The official spec has a map here by mime type, but we only support json.
  final SchemaRef content;
}

List<Response> parseResponses(
  Map<String, dynamic>? json,
  ParseContext parentContext,
) {
  if (json == null) {
    return [];
  }
  // Hack to make get cooldown compile.
  final responseCodes = json.keys.toList()..remove('204');
  if (responseCodes.length != 1) {
    throw UnimplementedError('Multiple responses not supported');
  }

  final responseCode = responseCodes.first;
  final responseTypes = json[responseCode] as Map<String, dynamic>;
  final content = responseTypes['content'] as Map<String, dynamic>?;
  if (content == null) {
    return [];
  }
  final jsonResponse = content['application/json'] as Map<String, dynamic>;
  return [
    Response(
      code: int.parse(responseCode),
      content: parseSchemaOrRef(
        json: jsonResponse['schema'] as Map<String, dynamic>,
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

class Components {
  const Components({required this.schemas});

  final Map<String, Schema> schemas;
  // final Map<String, Parameter> parameters;
  // final Map<String, SecurityScheme> securitySchemes;
  // final Map<String, RequestBody> requestBodies;
  // final Map<String, Response> responses;
  // final Map<String, Header> headers;
  // final Map<String, Example> examples;
  // final Map<String, Link> links;
  // final Map<String, Callback> callbacks;
}

Components parseComponents(Map<String, dynamic>? json, ParseContext context) {
  if (json == null) {
    return const Components(schemas: {});
  }
  final keys = json.keys.toList();
  final supportedKeys = ['schemas', 'securitySchemes'];

  for (final key in keys) {
    if (!supportedKeys.contains(key)) {
      final value = json[key] as Map<String, dynamic>;
      if (value.isNotEmpty) {
        throw UnimplementedError('Components key not supported: $key');
      }
    }
  }

  final securitySchemesJson = json['securitySchemes'] as Map<String, dynamic>?;
  if (securitySchemesJson != null) {
    logger.warn('Ignoring securitySchemes.');
  }

  final schemasJson = json['schemas'] as Map<String, dynamic>?;
  final schemas = <String, Schema>{};
  if (schemasJson != null) {
    for (final entry in schemasJson.entries) {
      final name = entry.key;
      final snakeName = snakeFromCamel(name);
      final value = entry.value as Map<String, dynamic>;
      schemas[name] = Schema.parse(
        value,
        context.addSnakeName(snakeName).key('schemas').key(name),
      );
    }
  }

  return Components(schemas: schemas);
}

T _required<T>(Map<String, dynamic> json, String key) {
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

T? _optional<T>(Map<String, dynamic> json, String key) {
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

// Spec calls this the "OpenAPI Object"
// https://spec.openapis.org/oas/v3.1.0#openapi-object
class Spec {
  Spec(this.serverUrl, this.endpoints, this.components);

  factory Spec.parse(Map<String, dynamic> json, ParseContext context) {
    final servers = _required<List<dynamic>>(json, 'servers');
    final firstServer = servers.first as Map<String, dynamic>;
    final serverUrl = _required<String>(firstServer, 'url');

    final paths = _required<Map<String, dynamic>>(json, 'paths');
    final endpoints = <Endpoint>[];
    for (final pathEntry in paths.entries) {
      final path = pathEntry.key;
      _expect(path.isNotEmpty, json, 'Path cannot be empty');
      _expect(path.startsWith('/'), json, 'Path must start with /: $path');
      final pathValue = pathEntry.value as Map<String, dynamic>;
      for (final method in Method.values) {
        final methodValue = pathValue[method.key] as Map<String, dynamic>?;
        if (methodValue == null) {
          continue;
        }
        endpoints.add(
          Endpoint.parse(
            parentContext: context.key('paths').key(path).key(method.key),
            path: path,
            json: methodValue,
            method: method,
          ),
        );
      }
    }
    final components = parseComponents(
      json['components'] as Map<String, dynamic>?,
      context.key('components'),
    );
    return Spec(Uri.parse(serverUrl), endpoints, components);
  }

  final Uri serverUrl;
  final List<Endpoint> endpoints;
  final Components components;

  List<String> get tags => endpoints.map((e) => e.tag).toSet().sorted();
}

class SchemaRegistry {
  SchemaRegistry();

  final Map<Uri, Schema> schemas = {};

  Schema get(Uri uri) {
    final schema = schemas[uri];
    if (schema == null) {
      throw Exception('Schema not found: $uri');
    }
    return schema;
  }

  Schema operator [](Uri uri) => get(uri);

  void register(Uri uri, Schema schema) {
    if (schemas.containsKey(uri)) {
      logger
        ..warn('Schema already registered: $uri')
        ..info('before: ${schemas[uri]}')
        ..info('after: $schema');
      throw Exception('Schema already registered: $uri');
    }
    final byName = schemas.entries.firstWhereOrNull(
      (e) => e.value.snakeName == schema.snakeName,
    );
    if (byName != null) {
      logger
        ..warn('Schema already registered by name: ${schema.snakeName}')
        ..info('existing uri: ${byName.key}')
        ..info('existing schema: ${byName.value}')
        ..info('new uri: $uri')
        ..info('new schema: $schema');
    }
    schemas[uri] = schema;
  }

  Uri lookupUri(Schema schema) {
    final entry = schemas.entries.firstWhereOrNull((e) => e.value == schema);
    if (entry == null) {
      throw Exception('Url not found for schema: $schema');
    }
    return entry.key;
  }
}

class JsonPointer {
  JsonPointer(this.parts);

  final List<String> parts;

  String get location {
    return '/${parts.map(urlEncode).join('/')}';
  }

  String urlEncode(String part) {
    return part.replaceAll('~', '~0').replaceAll('/', '~1');
  }

  @override
  String toString() => location;
}

/// Immutable context for parsing a spec.
/// SchemaRegistry is internally mutable, so this is not truly immutable.
class ParseContext {
  ParseContext({
    required this.baseUrl,
    required this.pointerParts,
    required this.snakeNameStack,
    required this.schemas,
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
      schemas = SchemaRegistry();

  /// The base url of the spec being parsed.
  final Uri baseUrl;

  /// Json pointer location of the current schema.
  final List<String> pointerParts;

  /// Stack of name parts for the current schema.
  final List<String> snakeNameStack;

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
  // SchemaRegistry is internally mutable.
  final SchemaRegistry schemas;

  ParseContext _addPart(String part) =>
      copyWith(pointerParts: [...pointerParts, part]);

  ParseContext key(String key) => _addPart(key);
  ParseContext index(int index) => _addPart(index.toString());

  void addSchema(Schema schema) {
    final uri = baseUrl.replace(fragment: pointer.toString());
    schemas.register(uri, schema);
  }

  ParseContext addSnakeName(String snakeName) =>
      copyWith(snakeNameStack: [...snakeNameStack, snakeName]);

  ParseContext copyWith({
    List<String>? pointerParts,
    List<String>? snakeNameStack,
  }) {
    return ParseContext(
      baseUrl: baseUrl,
      pointerParts: pointerParts ?? this.pointerParts,
      snakeNameStack: snakeNameStack ?? this.snakeNameStack,
      schemas: schemas,
    );
  }
}

/// We use a parse method rather than just fromJson since we need to maintain
/// the location (json pointer) information for each schema we parse and
/// write that information down somewhere (currently in the schema registry).
Spec parseSpec(Json json, ParseContext context) {
  final spec = Spec.parse(json, context);
  return spec;
}
