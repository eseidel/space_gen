// https://spec.openapis.org/oas/v3.1.0#paths-object

import 'dart:convert';
import 'dart:io';

class Endpoint {
  const Endpoint({
    required this.path,
    required this.method,
    required this.tag,
  });

  final String path;
  final String method;
  final String tag;
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

  List<Endpoint> endpoints;

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
        final tags = methodValue['tags'] as List<dynamic>;
        final tag = tags.firstOrNull as String? ?? 'Default';
        endpoints.add(
          Endpoint(
            path: path,
            method: method,
            tag: tag,
          ),
        );
      }
    }
    return Spec(endpoints);
  }
}
