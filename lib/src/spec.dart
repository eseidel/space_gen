import 'dart:convert';

import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:space_gen/src/string.dart';

enum SentIn {
  query,
  header,
  path,
  cookie;

  static SentIn fromJson(String json) {
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
        throw ArgumentError.value(json, 'json', 'Unknown SentIn');
    }
  }
}

class Parameter {
  const Parameter({
    required this.name,
    required this.type,
    required this.isRequired,
    required this.sentIn,
  });

  final bool isRequired;
  final SentIn sentIn;
  final String name;
  final SchemaRef type;
}

class Api {
  const Api({
    required this.name,
    required this.endpoints,
  });

  final String name;
  final List<Endpoint> endpoints;
}

enum SchemaType {
  string,
  number,
  integer,
  boolean,
  array,
  object;

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
      default:
        throw ArgumentError.value(json, 'json', 'Unknown SchemaType');
    }
  }
}

class RefResolver {
  RefResolver(FileSystem fs, this.baseUrl) : _fs = fs;
  final Uri baseUrl;
  final FileSystem _fs;
  final Map<Uri, Schema> _schemas = {};

  Schema resolve(SchemaRef ref) {
    if (ref.schema != null) {
      return ref.schema!;
    }
    final uri = ref.uri!;
    if (_schemas.containsKey(uri)) {
      return _schemas[uri]!;
    }
    final file = _fs.file(uri.toFilePath());
    final contents = file.readAsStringSync();
    final schema = parseSchema(
      current: uri,
      name: p.basenameWithoutExtension(uri.path),
      json: jsonDecode(contents) as Map<String, dynamic>,
    );
    _schemas[uri] = schema;
    return schema;
  }
}

@immutable
class SchemaRef {
  SchemaRef.fromPath({required String ref, required Uri current})
      : schema = null,
        uri = current.resolve(ref);
  const SchemaRef.schema(this.schema) : uri = null;

  final Uri? uri;
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
  const Schema({
    required this.name,
    required this.type,
    required this.properties,
    required this.required,
    required this.description,
    required this.items,
    required this.enumValues,
    required this.format,
  });

  final String name;
  final SchemaType type;
  final Map<String, SchemaRef> properties;
  final List<String> required;
  final String description;
  final SchemaRef? items;
  final List<String> enumValues;
  final String? format;
}

/// Parse a schema or a reference to a schema.
/// [inferredName] to give a name to the schema if it is not a ref.
/// it should include the name of the parent type and the name of the property
/// if it is a property.
SchemaRef parseSchemaOrRef({
  required Uri current,
  required Map<String, dynamic> json,
  required String inferredName,
}) {
  if (json.containsKey(r'$ref')) {
    return SchemaRef.fromPath(ref: json[r'$ref'] as String, current: current);
  }

  if (json.containsKey('oneOf')) {
    // TODO(eseidel): Support oneOf
    return const SchemaRef.schema(
      Schema(
        description: 'OneOf',
        name: 'OneOf',
        type: SchemaType.object,
        properties: {},
        required: [],
        items: null,
        enumValues: [],
        format: null,
      ),
    );
  }

  // Add "Inner" to our name if not an object.
  // This matches what the Dart open api generator does.
  final type = json['type'] as String;
  var name = inferredName;
  if (type != 'object') {
    name = '${inferredName}Inner';
  }
  return SchemaRef.schema(
    parseSchema(current: current, name: name, json: json),
  );
}

Map<String, SchemaRef> parseProperties({
  required Map<String, dynamic>? json,
  required String inferredName,
  required Uri current,
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
    final value = entry.value as Map<String, dynamic>;
    properties[name] = parseSchemaOrRef(
      inferredName: '$inferredName${name.capitalize()}',
      current: current,
      json: value,
    );
  }
  return properties;
}

Schema parseSchema({
  required Uri current,
  required String name,
  required Map<String, dynamic> json,
}) {
  final type = json['type'] as String;
  final properties = parseProperties(
    current: current,
    inferredName: name,
    json: json['properties'] as Map<String, dynamic>?,
  );
  final items = json['items'] as Map<String, dynamic>?;
  SchemaRef? itemSchema;
  if (items != null) {
    itemSchema = parseSchemaOrRef(
      inferredName: name,
      current: current,
      json: items,
    );
  }

  final required = json['required'] as List<dynamic>? ?? [];
  final description = json['description'] as String? ?? '';
  final enumValues = json['enum'] as List<dynamic>? ?? [];
  final format = json['format'] as String?;

  return Schema(
    name: name,
    type: SchemaType.fromJson(type),
    properties: properties,
    required: required.cast<String>(),
    description: description,
    items: itemSchema,
    enumValues: enumValues.cast<String>(),
    format: format,
  );
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
    required this.operationId,
    required this.requestBody,
  });

  final String path;
  final Method method;
  final String tag;
  final Responses responses;
  final String operationId;
  final List<Parameter> parameters;
  final SchemaRef? requestBody;
}

class Response {
  const Response({
    required this.code,
    required this.content,
  });

  final int code;
  // The official spec has a map here by mime type, but we only support json.
  final SchemaRef content;
}

class Responses {
  const Responses({
    required this.responses,
  });

  final List<Response> responses;
}

Responses parseResponses(
  Uri current,
  Map<String, dynamic> json,
  String operationId,
) {
  // Hack to make get cooldown compile.
  final responseCodes = json.keys.toList()..remove('204');
  if (responseCodes.length != 1) {
    throw UnimplementedError(
      'Multiple responses not supported, $operationId',
    );
  }
  final camelName = operationId.splitMapJoin(
    '-',
    onMatch: (m) => '',
    onNonMatch: (n) => n.capitalize(),
  );
  final responseCode = responseCodes.first;
  final inferredName = '$camelName${responseCode}Response';
  final responseTypes = json[responseCode] as Map<String, dynamic>;
  final content = responseTypes['content'] as Map<String, dynamic>;
  final jsonResponse = content['application/json'] as Map<String, dynamic>;
  final responses = [
    Response(
      code: int.parse(responseCode),
      content: parseSchemaOrRef(
        inferredName: inferredName,
        current: current,
        json: jsonResponse['schema'] as Map<String, dynamic>,
      ),
    ),
  ];
  return Responses(responses: responses);
}

Parameter parseParameter(Uri current, Map<String, dynamic> json) {
  final name = json['name'] as String;
  final required = json['required'] as bool? ?? false;
  final sentIn = json['in'] as String;
  final schema = json['schema'] as Map<String, dynamic>;
  final type = parseSchemaOrRef(
    inferredName: name,
    current: current,
    json: schema,
  );
  return Parameter(
    name: name,
    isRequired: required,
    sentIn: SentIn.fromJson(sentIn),
    type: type,
  );
}

Endpoint parseEndpoint(
  Uri current,
  Map<String, dynamic> methodValue,
  String path,
  Method method,
) {
  final operationId = methodValue['operationId'] as String;
  final responses = parseResponses(
    current,
    methodValue['responses'] as Map<String, dynamic>,
    operationId,
  );
  final tags = methodValue['tags'] as List<dynamic>;
  final tag = tags.firstOrNull as String? ?? 'Default';
  final parametersJson = methodValue['parameters'] as List<dynamic>? ?? [];
  final parameters = parametersJson
      .cast<Map<String, dynamic>>()
      .map((p) => parseParameter(current, p))
      .toList();
  final requestBodyJson = methodValue['requestBody'] as Map<String, dynamic>?;
  SchemaRef? requestBody;
  if (requestBodyJson != null) {
    final camelName = operationId.splitMapJoin(
      '-',
      onMatch: (m) => '',
      onNonMatch: (n) => n.capitalize(),
    );
    final inferredName = '${camelName}Request';
    final content = requestBodyJson['content'] as Map<String, dynamic>;
    final json = content['application/json'] as Map<String, dynamic>;
    requestBody = parseSchemaOrRef(
      inferredName: inferredName,
      current: current,
      json: json['schema'] as Map<String, dynamic>,
    );
  }
  return Endpoint(
    path: path,
    method: method,
    tag: tag,
    responses: responses,
    operationId: operationId,
    parameters: parameters,
    requestBody: requestBody,
  );
}

// Spec calls this the "OpenAPI Object"
// https://spec.openapis.org/oas/v3.1.0#openapi-object
class Spec {
  Spec(this.serverUrl, this.endpoints);

  final Uri serverUrl;
  final List<Endpoint> endpoints;

  // OpenAPI refers to these as Tags, but we call them APIs since the Dart
  // open api generator groups endpoints by tag into an API class and we've
  // matched that for now.
  Iterable<Api> get apis {
    final tags = endpoints.map((e) => e.tag).toSet();
    return tags.map((tag) {
      return Api(
        name: tag,
        endpoints: endpoints.where((e) => e.tag == tag).toList(),
      );
    });
  }

  static Future<Spec> load(
    String content,
    Uri uri,
    RefResolver resolver,
  ) async {
    final endpoints = <Endpoint>[];

    final json = jsonDecode(content) as Map<String, dynamic>;
    // Should support more than one server?
    final servers = json['servers'] as List<dynamic>;
    final firstServer = servers.first as Map<String, dynamic>;
    final serverUrl = firstServer['url'] as String;

    final paths = json['paths'] as Map<String, dynamic>;
    for (final pathEntry in paths.entries) {
      final path = pathEntry.key;
      final pathValue = pathEntry.value as Map<String, dynamic>;
      for (final method in Method.values) {
        final methodValue = pathValue[method.key] as Map<String, dynamic>?;
        if (methodValue == null) {
          continue;
        }
        endpoints.add(
          parseEndpoint(
            uri,
            methodValue,
            path,
            method,
          ),
        );
      }
    }
    return Spec(Uri.parse(serverUrl), endpoints);
  }
}
