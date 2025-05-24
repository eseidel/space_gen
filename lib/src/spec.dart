import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/string.dart';

/// A typedef representing a json object.
typedef Json = Map<String, dynamic>;

/// The "in" of a parameter.  "in" is a keyword in Dart, so we use SendIn.
/// e.g. query, header, path, cookie.
/// https://spec.openapis.org/oas/v3.0.0#parameter-object
enum SendIn {
  /// The query parameter is a parameter that is sent in the query string.
  query,

  /// The header parameter is a parameter that is sent in the header.
  header,

  /// The path parameter is a parameter that is sent in the path.
  path,

  /// The cookie parameter is a parameter that is sent in the cookie.
  cookie;

  /// Parse a SendIn from a json string.
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

/// A parameter is a parameter to an endpoint.
/// https://spec.openapis.org/oas/v3.0.0#parameter-object
class Parameter {
  /// Create a new parameter.
  const Parameter({
    required this.name,
    required this.description,
    required this.type,
    required this.isRequired,
    required this.sendIn,
  });

  /// Parse a parameter from a json object.
  factory Parameter.parse({required Json json, required ParseContext context}) {
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

  /// The name of the parameter.
  final String name;

  /// The description of the parameter.
  final String? description;

  /// Whether the parameter is required.
  final bool isRequired;

  /// The "in" of the parameter.
  /// e.g. query, header, path, cookie.
  final SendIn sendIn;

  /// The type of the parameter.
  final SchemaRef type;
}

/// A type of schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
enum SchemaType {
  /// A string.
  string,

  /// A number.
  number,

  /// An integer.
  integer,

  /// A boolean.
  boolean,

  /// An array.
  array,

  /// An object.
  object,

  /// If 'type' is missing.
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

/// An object which either holds a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
@immutable
class SchemaRef {
  /// Create a new schema reference from a path.
  const SchemaRef.fromPath({required String ref}) : schema = null, uri = ref;

  /// Create a new schema reference from a schema.
  const SchemaRef.schema(this.schema) : uri = null;

  /// The uri of the schema.
  final String? uri;

  /// The schema.
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

/// A schema is a json object that describes the shape of a json object.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
class Schema {
  /// Create a new schema.
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
    required this.useNewType,
  }) {
    if (type == SchemaType.object && snakeName.isEmpty) {
      throw ArgumentError.value(
        snakeName,
        'snakeName',
        'Schema name cannot be empty',
      );
    }
  }

  /// Parse a schema from a json object.
  factory Schema.parse(Json json, ParseContext context) {
    final type = SchemaType.fromJson(json['type'] as String? ?? 'unknown');
    final properties = parseProperties(
      json: json['properties'] as Json?,
      context: context.key('properties'),
    );
    final items = json['items'] as Json?;
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
    context.addSchema(schema);
    return schema;
  }

  /// Json pointer location of this schema.
  final String pointer;

  /// Name of this schema based on parse location.
  final String snakeName;

  /// The type of this schema.
  final SchemaType type;

  /// The properties of this schema.
  final Map<String, SchemaRef> properties;

  /// The required properties of this schema.
  final List<String> required;

  /// The description of this schema.
  final String description;

  /// The items of this schema.
  final SchemaRef? items;

  /// The enum values of this schema.
  final List<String> enumValues;

  /// The format of this schema.
  final String? format;

  /// The additional properties of this schema.
  /// Used for specifying T for Map\<String, T\>.
  final SchemaRef? additionalProperties;

  /// The default value of this schema.
  final dynamic defaultValue;

  /// Whether to use the newtype pattern for this schema.
  /// e.g. Wrap the underlying type in a named object.
  final bool useNewType;

  @override
  String toString() {
    return 'Schema(name: $snakeName, pointer: $pointer, type: $type, '
        'description: $description, useNewType: $useNewType)';
  }
}

/// Parse a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
/// https://spec.openapis.org/oas/v3.0.0#relative-references-in-urls
SchemaRef parseSchemaOrRef({
  required Json json,
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
      json: allOf.first as Json,
      context: context.key('allOf'),
    );
  }

  return SchemaRef.schema(Schema.parse(json, context));
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

/// A method is a http method.
/// https://spec.openapis.org/oas/v3.0.0#operation-object
enum Method {
  /// The GET method is used to retrieve a resource.
  get,

  /// The POST method is used to create a resource.
  post,

  /// The PUT method is used to update a resource.
  put,

  /// The DELETE method is used to delete a resource.
  delete,

  /// The PATCH method is used to update a resource.
  patch,

  /// The HEAD method is used to get the headers of a resource.
  head,

  /// The OPTIONS method is used to get the supported methods of a resource.
  options,

  /// The TRACE method is used to get the trace of a resource.
  trace;

  /// The method as a lowercase string.
  String get key => name.toLowerCase();
}

/// An endpoint is a path with a method.
/// https://spec.openapis.org/oas/v3.0.0#path-item-object
class Endpoint {
  /// Create a new endpoint.
  const Endpoint({
    required this.path,
    required this.method,
    required this.tag,
    required this.responses,
    required this.parameters,
    required this.snakeName,
    required this.requestBody,
  });

  /// Parse an endpoint from a json object.
  factory Endpoint.parse({
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
          (indexed) => Parameter.parse(
            json: indexed.$2,
            context: context
                .addSnakeName('parameter${indexed.$1}')
                .key('parameters')
                .index(indexed.$1),
          ),
        )
        .toList();
    final requestBodyJson = json['requestBody'] as Json?;
    SchemaRef? requestBody;
    if (requestBodyJson != null) {
      final content = requestBodyJson['content'] as Json;
      final json = content['application/json'] as Json;
      requestBody = parseSchemaOrRef(
        json: json['schema'] as Json,
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

  /// The path of this endpoint (e.g. /my/user/{name})
  final String path;

  /// The method of this endpoint (e.g. GET, POST, etc.)
  final Method method;

  /// A tag for grouping endpoints.
  final String tag;

  /// The responses of this endpoint.
  final List<Response> responses;

  /// The snake name of this endpoint (e.g. get_user)
  /// Typically the operationId, or the last path segment if not present.
  final String snakeName;

  /// The parameters of this endpoint.
  final List<Parameter> parameters;

  /// The request body of this endpoint.
  final SchemaRef? requestBody;
}

/// A response from an endpoint.
/// https://spec.openapis.org/oas/v3.1.0#response-object
class Response {
  /// Create a new response.
  const Response({required this.code, required this.content});

  /// The status code of this response.
  final int code;

  /// The content of this response.
  /// The official spec has a map here by mime type, but we only support json.
  final SchemaRef content;
}

List<Response> parseResponses(Json? json, ParseContext parentContext) {
  if (json == null) {
    return [];
  }
  // Hack to make get cooldown compile.
  final responseCodes = json.keys.toList()..remove('204');
  if (responseCodes.length != 1) {
    throw UnimplementedError('Multiple responses not supported');
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

Components parseComponents(Json? json, ParseContext context) {
  if (json == null) {
    return const Components(schemas: {});
  }
  final keys = json.keys.toList();
  final supportedKeys = ['schemas', 'securitySchemes'];

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
      schemas[name] = Schema.parse(
        value,
        context
            .addSnakeName(snakeName, isTopLevelComponent: true)
            .key('schemas')
            .key(name),
      );
    }
  }

  return Components(schemas: schemas);
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

// Spec calls this the "OpenAPI Object"
// https://spec.openapis.org/oas/v3.1.0#openapi-object
class Spec {
  Spec(this.serverUrl, this.endpoints, this.components);

  factory Spec.parse(Json json, ParseContext context) {
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
      json['components'] as Json?,
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

/// Json pointer is a string that can be used to reference a value in a json
/// object.
/// https://spec.openapis.org/oas/v3.1.0#json-pointer
class JsonPointer {
  /// Create a new JsonPointer from a list of parts.
  JsonPointer(this.parts);

  /// The parts of the json pointer.
  final List<String> parts;

  /// This pointer encoded as a url-ready string.
  String get location => '/${parts.map(urlEncode).join('/')}';

  /// Encode a part of the json pointer as a url-ready string.
  static String urlEncode(String part) =>
      part.replaceAll('~', '~0').replaceAll('/', '~1');

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
      schemas = SchemaRegistry(),
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
      schemas: schemas,
      isTopLevelComponent: isTopLevelComponent ?? this.isTopLevelComponent,
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
