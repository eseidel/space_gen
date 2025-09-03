import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// The "in" of a parameter.  "in" is a keyword in Dart, so we use SendIn.
/// e.g. query, header, path, cookie.
/// https://spec.openapis.org/oas/v3.0.0#parameter-object
enum ParameterLocation {
  /// The query parameter is a parameter that is sent in the query string.
  query,

  /// The header parameter is a parameter that is sent in the header.
  header,

  /// The path parameter is a parameter that is sent in the path.
  path,

  /// The cookie parameter is a parameter that is sent in the cookie.
  cookie,
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

/// Json pointer is a string that can be used to reference a value in a json
/// object.
/// https://spec.openapis.org/oas/v3.1.0#json-pointer
@immutable
class JsonPointer extends Equatable {
  const JsonPointer.empty() : parts = const [];

  /// Create a new JsonPointer from a list of parts.
  const JsonPointer.fromParts(this.parts);

  /// Create a new JsonPointer from a string.
  factory JsonPointer.parse(String string) {
    if (!string.startsWith('#/')) {
      throw FormatException('Invalid json pointer: $string');
    }
    return JsonPointer.fromParts(string.substring(2).split('/'));
  }

  JsonPointer add(String part) => JsonPointer.fromParts([...parts, part]);

  /// The parts of the json pointer.
  final List<String> parts;

  String get urlEncodedFragment {
    /// This pointer encoded as a url-ready string.
    /// e.g. #/components/schemas/User
    return '#/${parts.map(urlEncode).join('/')}';
  }

  /// Encode a part of the json pointer as a url-ready string.
  static String urlEncode(String part) =>
      part.replaceAll('~', '~0').replaceAll('/', '~1');

  @override
  String toString() => urlEncodedFragment;

  @override
  List<Object?> get props => [parts];
}

/// Known supported mime types for this library.
enum MimeType {
  applicationJson('application/json'),
  applicationOctetStream('application/octet-stream'),
  textPlain('text/plain');

  const MimeType(this.value);

  final String value;
}

enum PodType { boolean, dateTime, uri, uriTemplate }

/// Properties that are common to all schemas and across
/// parsing, resolution and rendering.  This just saves a lot of boilerplate.
class CommonProperties extends Equatable {
  const CommonProperties({
    required this.pointer,
    required this.snakeName,
    required this.title,
    required this.description,
    required this.isDeprecated,
    required this.nullable,
    required this.example,
    required this.examples,
  });

  /// A common properties object with no additional properties.
  /// Used for implicit schemas.
  const CommonProperties.empty({required this.pointer, required this.snakeName})
    : title = null,
      description = null,
      isDeprecated = false,
      nullable = false,
      example = null,
      examples = null;

  /// Tests don't need to specify all properties.
  const CommonProperties.test({
    required this.pointer,
    required this.snakeName,
    this.title,
    this.description,
    this.isDeprecated = false,
    this.nullable = false,
    this.example,
    this.examples,
  });

  /// The location of the schema in the spec.
  final JsonPointer pointer;

  /// The snake name of the schema.
  final String snakeName;

  /// The description of the schema.
  final String? title;

  /// The description of the schema.
  final String? description;

  /// Whether the schema is deprecated.
  final bool isDeprecated;

  /// Whether the schema is nullable.
  final bool nullable;

  // TODO(eseidel): Make these strongly typed.
  /// An example of the schema.
  final dynamic example;

  /// Examples of the schema.
  final List<dynamic>? examples;

  CommonProperties copyWith({
    JsonPointer? pointer,
    String? snakeName,
    String? title,
    String? description,
    bool? isDeprecated,
    bool? nullable,
    dynamic example,
    List<dynamic>? examples,
  }) {
    return CommonProperties(
      pointer: pointer ?? this.pointer,
      snakeName: snakeName ?? this.snakeName,
      title: title ?? this.title,
      description: description ?? this.description,
      isDeprecated: isDeprecated ?? this.isDeprecated,
      nullable: nullable ?? this.nullable,
      example: example ?? this.example,
      examples: examples ?? this.examples,
    );
  }

  @override
  List<Object?> get props => [
    pointer,
    snakeName,
    title,
    description,
    isDeprecated,
    nullable,
  ];
}

// Security schemes do not need a Resolved or Render variant, so sharing
// them via this file.
@immutable
sealed class SecurityScheme extends Equatable {
  const SecurityScheme({
    required this.description,
    required this.name,
    required this.pointer,
  });

  /// The location of the scheme in the spec.
  final JsonPointer pointer;

  // Name as it appears in the component map of the spec.
  final String name;

  /// Description of the security scheme, mostly for documentation.
  final String? description;

  @override
  List<Object?> get props => [description, name];
}

enum ApiKeyLocation { header, query, cookie }

/// A api key security scheme.
@immutable
class ApiKeySecurityScheme extends SecurityScheme {
  const ApiKeySecurityScheme({
    required super.pointer,
    required super.name,
    required super.description,
    required this.keyName,
    required this.inLocation,
  });

  /// Name of the api key, used as a query param or header.
  final String keyName;

  /// Where to send the api key in the request.
  final ApiKeyLocation inLocation;
  @override
  List<Object?> get props => [super.props, name, inLocation];
}

/// A http security scheme.
@immutable
class HttpSecurityScheme extends SecurityScheme {
  const HttpSecurityScheme({
    required super.pointer,
    required super.name,
    required super.description,
    required this.scheme,
    required this.bearerFormat,
  });

  /// The scheme of the http security scheme.
  final String scheme;

  /// The bearer format of the http security scheme.
  final String? bearerFormat;

  @override
  List<Object?> get props => [super.props, scheme, bearerFormat];
}
