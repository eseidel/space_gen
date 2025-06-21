import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/types.dart';
import 'package:version/version.dart';

export 'package:space_gen/src/types.dart';
export 'package:version/version.dart';

/// A typedef representing a json object.
typedef Json = Map<String, dynamic>;

abstract class HasPointer {
  JsonPointer get pointer;
}

/// A parameter is a parameter to an endpoint.
/// https://spec.openapis.org/oas/v3.0.0#parameter-object
@immutable
class Parameter extends Equatable implements HasPointer {
  /// Create a new parameter.
  const Parameter({
    required this.name,
    required this.description,
    required this.type,
    required this.isRequired,
    required this.sendIn,
    required this.pointer,
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

  /// Where this parameter is located in the spec.
  @override
  final JsonPointer pointer;

  @override
  List<Object?> get props => [
    name,
    description,
    isRequired,
    sendIn,
    type,
    pointer,
  ];
}

@immutable
class Header extends Equatable implements HasPointer {
  const Header({
    required this.description,
    required this.schema,
    required this.pointer,
  });

  /// The description of the header.
  final String? description;

  /// The type of the header.
  final SchemaRef? schema;

  /// Where this header is located in the spec.
  @override
  final JsonPointer pointer;

  @override
  List<Object?> get props => [description, schema, pointer];
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

  /// Null.
  null_,

  // TODO(eseidel): Remove unknown type and just use a separate class.
  /// If 'type' is missing.
  unknown; // if 'type' is missing.

  // Should this be parseSchemaType instead?
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
      case 'null':
        return null_;
      // Intentionally fall through for unknown.
      default:
        throw FormatException('Unknown SchemaType: $json');
    }
  }
}

/// An object which either holds a schema or a reference to a schema.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
@immutable
class RefOr<T> extends Equatable {
  const RefOr.ref(this.ref, this.pointer) : object = null;
  const RefOr.object(this.object, this.pointer) : ref = null;

  final String? ref;
  final T? object;

  final JsonPointer pointer;

  @override
  List<Object?> get props => [ref, object];
}

class SchemaRef extends RefOr<SchemaBase> {
  const SchemaRef.ref(String super.ref, super.pointer) : super.ref();
  const SchemaRef.schema(SchemaBase super.schema, super.pointer)
    : super.object();

  SchemaBase? get schema => object;
}

sealed class SchemaBase extends Equatable implements HasPointer {
  const SchemaBase({
    required this.pointer,
    required this.snakeName,
    required this.type,
  });

  /// Where this schema is located in the spec.
  @override
  final JsonPointer pointer;

  /// The snake name of this schema.
  final String snakeName;

  /// The type of this schema.
  final SchemaType type;

  @override
  List<Object?> get props => [pointer, snakeName, type];
}

class SchemaAnyOf extends SchemaBase {
  const SchemaAnyOf({
    required super.pointer,
    required super.snakeName,
    required this.schemas,
  }) : super(type: SchemaType.object);

  final List<SchemaRef> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

class SchemaAllOf extends SchemaBase {
  const SchemaAllOf({
    required super.pointer,
    required super.snakeName,
    required this.schemas,
  }) : super(type: SchemaType.object);

  final List<SchemaRef> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

class SchemaOneOf extends SchemaBase {
  const SchemaOneOf({
    required super.pointer,
    required super.snakeName,
    required this.schemas,
  }) : super(type: SchemaType.object);

  final List<SchemaRef> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

/// A schema is a json object that describes the shape of a json object.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
@immutable
class Schema extends SchemaBase {
  /// Create a new schema.
  Schema({
    required super.pointer,
    required super.snakeName,
    required super.type,
    required this.properties,
    required this.required,
    required this.description,
    required this.items,
    required this.enumValues,
    required this.format,
    required this.additionalProperties,
    required this.defaultValue,
    required this.example,
  }) {
    if (type == SchemaType.object && snakeName.isEmpty) {
      throw ArgumentError.value(
        snakeName,
        'snakeName',
        'Schema name cannot be empty',
      );
    }
  }

  /// The properties of this schema.
  final Map<String, SchemaRef> properties;

  /// The required properties of this schema.
  final List<String> required;

  /// The example value for this schema.
  // Not currently used by the generator.
  final dynamic example;

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

  @override
  List<Object?> get props => [
    super.props,
    properties,
    required,
    description,
    items,
    enumValues,
    format,
    additionalProperties,
    defaultValue,
  ];

  @override
  String toString() {
    return 'Schema(name: $snakeName, pointer: $pointer, type: $type, '
        'description: $description)';
  }
}

/// A media type is a mime type and a schema.
/// https://spec.openapis.org/oas/v3.0.0#mediaTypeObject
@immutable
class MediaType extends Equatable {
  /// Create a new media type.
  const MediaType({required this.schema});

  /// 3.0.1 seems to allow a ref in MediaType, but 3.1.0 does not.
  final SchemaRef schema;

  @override
  List<Object?> get props => [schema];
}

/// Request body is sorta a schema, but it's a bit different.
/// https://spec.openapis.org/oas/v3.0.0#requestBodyObject
/// Notably "required" is a boolean, not a list of strings.
@immutable
class RequestBody extends Equatable implements HasPointer {
  const RequestBody({
    required this.pointer,
    required this.description,
    required this.content,
    required this.isRequired,
  });

  /// Where this request body is located in the spec.
  @override
  final JsonPointer pointer;

  /// The description of the request body.
  final String? description;

  /// The content of the request body.
  final Map<String, MediaType> content;

  /// Whether the request body is required.
  final bool isRequired;

  @override
  List<Object?> get props => [pointer, description, content, isRequired];
}

class Operation extends Equatable implements HasPointer {
  const Operation({
    required this.pointer,
    required this.tags,
    required this.snakeName,
    required this.summary,
    required this.description,
    required this.responses,
    required this.parameters,
    required this.requestBody,
    required this.deprecated,
  });

  /// Where this operation is located in the spec.
  @override
  final JsonPointer pointer;

  /// A list of tags for this operation.
  final List<String> tags;

  /// The snake name of this endpoint (e.g. get_user)
  /// Typically the operationId, or the last path segment if not present.
  final String snakeName;

  /// The summary of this operation.
  final String summary;

  /// The description of this operation.
  final String? description;

  /// The responses of this operation.
  final Responses responses;

  /// The parameters of this operation.
  final List<RefOr<Parameter>> parameters;

  /// The request body of this operation.
  final RefOr<RequestBody>? requestBody;

  /// Whether this operation is deprecated.
  final bool deprecated;

  @override
  List<Object?> get props => [
    tags,
    snakeName,
    summary,
    description,
    responses,
    parameters,
    requestBody,
    deprecated,
  ];
}

/// An endpoint is a path with a method.
/// https://spec.openapis.org/oas/v3.0.0#path-item-object
@immutable
class PathItem extends Equatable implements HasPointer {
  /// Create a new endpoint.
  const PathItem({
    required this.pointer,
    required this.path,
    required this.operations,
    required this.summary,
    required this.description,
    // required this.parameters,
  });

  /// Where this path item is located in the spec.
  @override
  final JsonPointer pointer;

  /// The path of this endpoint (e.g. /my/user/{name})
  final String path;

  /// The operations supported by this path.
  final Map<Method, Operation> operations;

  /// The default summary for all operations in this path.
  final String? summary;

  /// The default description for all operations in this path.
  final String? description;

  /// Parameters available to all operations in this path.
  // final List<Parameter> parameters;

  @override
  List<Object?> get props => [
    path,
    operations,
    summary,
    description,
    // parameters,
  ];
}

/// A map of response codes to responses.
/// https://spec.openapis.org/oas/v3.1.0#responses-object
@immutable
class Responses extends Equatable {
  /// Create a new responses object.
  const Responses({required this.responses});

  /// The responses of this endpoint.
  final Map<int, RefOr<Response>> responses;

  // default is not yet supported.

  /// Whether this endpoint has any responses.
  bool get isEmpty => responses.isEmpty;

  RefOr<Response>? operator [](int code) => responses[code];

  @override
  List<Object?> get props => [responses];
}

/// A response from an endpoint.
/// https://spec.openapis.org/oas/v3.1.0#response-object
@immutable
class Response extends Equatable implements HasPointer {
  /// Create a new response.
  const Response({
    required this.pointer,
    required this.description,
    this.content,
    this.headers,
  });

  /// Where this response is located in the spec.
  @override
  final JsonPointer pointer;

  /// The description of this response.
  final String description;

  /// The content of this response.
  final Map<String, MediaType>? content;

  /// The possible headers for this response.
  final Map<String, RefOr<Header>>? headers;

  @override
  List<Object?> get props => [pointer, description, content, headers];
}

@immutable
class Components extends Equatable {
  const Components({
    this.schemas = const {},
    this.requestBodies = const {},
    this.parameters = const {},
    this.responses = const {},
    this.headers = const {},
  });

  final Map<String, SchemaBase> schemas;
  final Map<String, Parameter> parameters;

  // final Map<String, SecurityScheme> securitySchemes;
  final Map<String, RequestBody> requestBodies;
  final Map<String, Response> responses;
  final Map<String, Header> headers;
  // final Map<String, Example> examples;
  // final Map<String, Link> links;
  // final Map<String, Callback> callbacks;

  @override
  List<Object?> get props => [schemas, requestBodies, parameters];
}

@immutable
class Info extends Equatable {
  const Info(this.title, this.version);
  final String title;
  final String version;
  @override
  List<Object?> get props => [title, version];
}

/// A map of paths to path items.
/// https://spec.openapis.org/oas/v3.1.0#paths-object
@immutable
class Paths extends Equatable {
  const Paths({required this.paths});

  final Map<String, PathItem> paths;

  Iterable<String> get keys => paths.keys;
  PathItem operator [](String path) => paths[path]!;

  @override
  List<Object?> get props => [paths];
}

/// The OpenAPI object.  The root object of a spec.
/// https://spec.openapis.org/oas/v3.1.0#openapi-object
/// Objects in this library are not a one-to-one mapping with the spec,
/// and may include extra information from parsing e.g. snakeCaseName.
@immutable
class OpenApi extends Equatable {
  const OpenApi({
    required this.serverUrl,
    required this.version,
    required this.info,
    required this.paths,
    required this.components,
  });

  /// The server url of the spec.
  final Uri serverUrl;

  /// The version of the spec.
  final Version version;

  /// The info of the spec.
  final Info info;

  /// The paths of the spec.
  final Paths paths;

  /// The components of the spec.
  final Components components;

  @override
  List<Object?> get props => [serverUrl, info, paths, components];
}
