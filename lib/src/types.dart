import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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

  /// This pointer encoded as a url-ready string.
  String get location => '/${parts.map(urlEncode).join('/')}';

  /// Encode a part of the json pointer as a url-ready string.
  static String urlEncode(String part) =>
      part.replaceAll('~', '~0').replaceAll('/', '~1');

  @override
  String toString() => '#/${parts.join('/')}';

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

enum PodType { boolean, dateTime, uri }

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

  /// The title of the schema.
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
