// https://spec.openapis.org/oas/v3.1.0#paths-object

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
  final String method;
  final String tag;
  final Map<String, dynamic> responses;
  final String operationId;
  final List<Parameter> parameters;
}

final _methods = [
  'GET',
  'POST',
  'PUT',
  'DELETE',
  'PATCH',
  'HEAD',
  'OPTIONS',
  'CONNECT',
  'TRACE',
];

class Spec {
  Spec(this.endpoints);

  final List<Endpoint> endpoints;

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
      for (final method in _methods) {
        final methodValue =
            pathValue[method.toLowerCase()] as Map<String, dynamic>?;
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
