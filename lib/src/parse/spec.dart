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

class SchemaRef extends RefOr<Schema> {
  const SchemaRef.ref(String super.ref, super.pointer) : super.ref();
  const SchemaRef.schema(Schema super.schema, super.pointer) : super.object();

  Schema? get schema => object;
}

sealed class Schema extends Equatable implements HasPointer {
  const Schema({
    required this.pointer,
    required this.snakeName,
    required this.description,
  });

  /// Where this schema is located in the spec.
  @override
  final JsonPointer pointer;

  /// The snake name of this schema.
  final String snakeName;

  /// The description of this schema.
  final String? description;

  @override
  List<Object?> get props => [pointer, snakeName, description];
}

/// A schema which is a POD (plain old data) type.
class SchemaPod extends Schema {
  const SchemaPod({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.type,
    required this.defaultValue,
  });

  /// The type of data.
  final PodType type;

  /// The default value of the data.
  // TODO(eseidel): This should be typed.
  final dynamic defaultValue;

  @override
  List<Object?> get props => [super.props, type, defaultValue];
}

class SchemaString extends Schema {
  const SchemaString({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.defaultValue,
    required this.maxLength,
    required this.minLength,
  });

  final String? defaultValue;
  final int? maxLength;
  final int? minLength;

  @override
  List<Object?> get props => [super.props, defaultValue, maxLength, minLength];
}

abstract class SchemaNumeric<T extends num> extends Schema {
  const SchemaNumeric({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.defaultValue,
    required this.minimum,
    required this.maximum,
    required this.exclusiveMinimum,
    required this.exclusiveMaximum,
    required this.multipleOf,
  });

  final T? defaultValue;
  final T? minimum;
  final T? maximum;
  final T? exclusiveMinimum;
  final T? exclusiveMaximum;
  final T? multipleOf;
}

class SchemaInteger extends SchemaNumeric<int> {
  const SchemaInteger({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required super.defaultValue,
    required super.minimum,
    required super.maximum,
    required super.exclusiveMinimum,
    required super.exclusiveMaximum,
    required super.multipleOf,
  });
}

class SchemaNumber extends SchemaNumeric<double> {
  const SchemaNumber({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required super.defaultValue,
    required super.minimum,
    required super.maximum,
    required super.exclusiveMinimum,
    required super.exclusiveMaximum,
    required super.multipleOf,
  });
}

abstract class SchemaObjectBase extends Schema {
  const SchemaObjectBase({
    required super.pointer,
    required super.snakeName,
    required super.description,
  });
}

/// Map isn't a type in the spec, but rather inferred by having
/// additionalProperties and no other properties.
class SchemaMap extends Schema {
  const SchemaMap({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.valueSchema,
  });

  final SchemaRef valueSchema;

  @override
  List<Object?> get props => [super.props, valueSchema];
}

class SchemaBinary extends Schema {
  const SchemaBinary({
    required super.pointer,
    required super.snakeName,
    required super.description,
  });
}

class SchemaEnum extends Schema {
  const SchemaEnum({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.defaultValue,
    required this.enumValues,
  });

  /// The default value of the enum.
  final String? defaultValue;

  // Only string enums are supported for now.
  final List<String> enumValues;

  @override
  List<Object?> get props => [super.props, defaultValue, enumValues];
}

class SchemaNull extends Schema {
  const SchemaNull({
    required super.pointer,
    required super.snakeName,
    required super.description,
  });
}

class SchemaArray extends Schema {
  const SchemaArray({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.items,
    required this.defaultValue,
  });

  final SchemaRef items;

  final dynamic defaultValue;

  @override
  List<Object?> get props => [super.props, items, defaultValue];
}

// Renders as dynamic.
class SchemaUnknown extends Schema {
  const SchemaUnknown({
    required super.pointer,
    required super.snakeName,
    required super.description,
  });

  @override
  List<Object?> get props => [super.props, description];
}

// Parses as a single, constant object, renders to json as {}.
class SchemaEmptyObject extends Schema {
  const SchemaEmptyObject({
    required super.pointer,
    required super.snakeName,
    required super.description,
  });
}

abstract class SchemaCombiner extends SchemaObjectBase {
  const SchemaCombiner({
    required super.pointer,
    required super.snakeName,
    required this.schemas,
    required super.description,
  });

  final List<SchemaRef> schemas;

  @override
  List<Object?> get props => [super.props, schemas];
}

class SchemaAnyOf extends SchemaCombiner {
  const SchemaAnyOf({
    required super.pointer,
    required super.snakeName,
    required super.schemas,
    required super.description,
  });
}

class SchemaAllOf extends SchemaCombiner {
  const SchemaAllOf({
    required super.pointer,
    required super.snakeName,
    required super.schemas,
    required super.description,
  });
}

class SchemaOneOf extends SchemaCombiner {
  const SchemaOneOf({
    required super.pointer,
    required super.snakeName,
    required super.schemas,
    required super.description,
  });
}

/// A schema is a json object that describes the shape of a json object.
/// https://spec.openapis.org/oas/v3.0.0#schemaObject
@immutable
class SchemaObject extends SchemaObjectBase {
  /// Create a new schema.
  SchemaObject({
    required super.pointer,
    required super.snakeName,
    required super.description,
    required this.properties,
    required this.requiredProperties,
    required this.additionalProperties,
    required this.defaultValue,
    required this.example,
  }) {
    if (snakeName.isEmpty) {
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
  final List<String> requiredProperties;

  /// The example value for this schema.
  // Not currently used by the generator.
  final dynamic example;

  /// The additional properties of this schema.
  /// Used for specifying T for Map\<String, T\>.
  final SchemaRef? additionalProperties;

  /// The default value of this schema.
  final dynamic defaultValue;

  @override
  List<Object?> get props => [
    super.props,
    properties,
    requiredProperties,
    example,
    description,
    additionalProperties,
    defaultValue,
  ];

  @override
  String toString() {
    return 'Schema(name: $snakeName, pointer: $pointer, '
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
  final String? summary;

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

  final Map<String, Schema> schemas;
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
