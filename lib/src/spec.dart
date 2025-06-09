import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/logger.dart';

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
@immutable
class Parameter extends Equatable {
  /// Create a new parameter.
  const Parameter({
    required this.name,
    required this.description,
    required this.type,
    required this.isRequired,
    required this.sendIn,
  });

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

  @override
  List<Object?> get props => [name, description, isRequired, sendIn, type];
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
class RefOr<T> extends Equatable {
  const RefOr.ref(this.ref) : object = null;
  const RefOr.object(this.object) : ref = null;

  final String? ref;
  final T? object;

  @override
  List<Object?> get props => [ref, object];
}

class SchemaRef extends RefOr<Schema> {
  const SchemaRef.ref(String super.ref) : super.ref();
  const SchemaRef.schema(Schema super.schema) : super.object();

  Schema? get schema => object;
}

/// A schema is a json object that describes the shape of a json object.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
@immutable
class Schema extends Equatable {
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
  List<Object?> get props => [
    pointer,
    snakeName,
    type,
    properties,
    required,
    description,
    items,
    enumValues,
    format,
    additionalProperties,
    defaultValue,
    useNewType,
  ];

  @override
  String toString() {
    return 'Schema(name: $snakeName, pointer: $pointer, type: $type, '
        'description: $description, useNewType: $useNewType)';
  }
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

/// Request body is sorta a schema, but it's a bit different.
/// https://spec.openapis.org/oas/v3.0.0#requestBodyObject
/// Notably "required" is a boolean, not a list of strings.
@immutable
class RequestBody extends Equatable {
  const RequestBody({
    required this.pointer,
    required this.isRequired,
    required this.schema,
  });

  /// The pointer to this request body.
  final String pointer;

  /// Whether the request body is required.
  final bool isRequired;

  /// The schema of the application/json content.
  final SchemaRef schema;

  @override
  List<Object?> get props => [pointer, isRequired, schema];
}

/// An endpoint is a path with a method.
/// Spec splits this into a "path item" and a "operation" object.
/// https://spec.openapis.org/oas/v3.0.0#path-item-object
@immutable
class Endpoint extends Equatable {
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
  final RefOr<RequestBody>? requestBody;

  @override
  List<Object?> get props => [
    path,
    method,
    tag,
    responses,
    snakeName,
    parameters,
    requestBody,
  ];
}

/// A response from an endpoint.
/// https://spec.openapis.org/oas/v3.1.0#response-object
@immutable
class Response extends Equatable {
  /// Create a new response.
  const Response({required this.code, required this.content});

  /// The status code of this response.
  final int code;

  /// The content of this response.
  /// The official spec has a map here by mime type, but we only support json.
  final SchemaRef content;

  @override
  List<Object?> get props => [code, content];
}

@immutable
class Components extends Equatable {
  const Components({required this.schemas, required this.requestBodies});

  final Map<String, Schema> schemas;
  // final Map<String, Parameter> parameters;
  // final Map<String, SecurityScheme> securitySchemes;
  final Map<String, RequestBody> requestBodies;
  // final Map<String, Response> responses;
  // final Map<String, Header> headers;
  // final Map<String, Example> examples;
  // final Map<String, Link> links;
  // final Map<String, Callback> callbacks;

  @override
  List<Object?> get props => [schemas, requestBodies];
}

// Spec calls this the "OpenAPI Object"
// https://spec.openapis.org/oas/v3.1.0#openapi-object

@immutable
class Spec extends Equatable {
  const Spec(this.serverUrl, this.endpoints, this.components);

  final Uri serverUrl;
  final List<Endpoint> endpoints;
  final Components components;

  List<String> get tags => endpoints.map((e) => e.tag).toSet().sorted();

  @override
  List<Object?> get props => [serverUrl, endpoints, components];
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
