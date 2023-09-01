import 'dart:convert';
import 'dart:io';

class Parameter {
  const Parameter({
    required this.name,
    required this.type,
  });

  final String name;
  final String type;
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

// https://spec.openapis.org/oas/v3.0.0#schemaObject
class Schema {
  const Schema({
    required this.type,
    this.properties = const {},
    this.required = const [],
    this.description = '',
  });

  final SchemaType type;
  final Map<String, dynamic> properties;
  final List<String> required;
  final String description;
}

Schema parseSchema(Map<String, dynamic> json) {
  final type = json['type'] as String;
  final properties = json['properties'] as Map<String, dynamic>? ?? {};
  final required = json['required'] as List<dynamic>? ?? [];
  final description = json['description'] as String? ?? '';
  return Schema(
    type: SchemaType.fromJson(type),
    properties: properties,
    required: required.cast<String>(),
    description: description,
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
  });

  final String path;
  final Method method;
  final String tag;
  final Map<String, dynamic> responses;
  final String operationId;
  final List<Parameter> parameters;
}

// Spec calls this the "OpenAPI Object"
// https://spec.openapis.org/oas/v3.1.0#openapi-object
class Spec {
  Spec(this.endpoints);

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

  static Future<Spec> load(Uri uri) async {
    final file = File(uri.toFilePath());
    final content = file.readAsStringSync();

    final endpoints = <Endpoint>[];

    final json = jsonDecode(content) as Map<String, dynamic>;
    final paths = json['paths'] as Map<String, dynamic>;
    for (final pathEntry in paths.entries) {
      final path = pathEntry.key;
      final pathValue = pathEntry.value as Map<String, dynamic>;
      for (final method in Method.values) {
        final methodValue = pathValue[method.key] as Map<String, dynamic>?;
        if (methodValue == null) {
          continue;
        }
        final responses = methodValue['responses'] as Map<String, dynamic>;
        final tags = methodValue['tags'] as List<dynamic>;
        final tag = tags.firstOrNull as String? ?? 'Default';
        endpoints.add(
          Endpoint(
            path: path,
            method: method,
            tag: tag,
            responses: responses,
            operationId: methodValue['operationId'] as String,
            parameters: [],
          ),
        );
      }
    }
    return Spec(endpoints);
  }
}
