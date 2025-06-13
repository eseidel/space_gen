import 'dart:convert';

import 'package:file/file.dart';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart' as yaml;

typedef Json = Map<String, dynamic>;

/// A cache of JSON objects.
/// Handles both file and network urls.
class Cache {
  Cache(this.fs, {http.Client? client}) : client = client ?? http.Client();

  final FileSystem fs;
  final http.Client client;

  final _cache = <Uri, Json>{};

  // Does not check the cache, does handle both file and network urls.
  Future<Json> _fetchWithoutCache(Uri uri) async {
    final isYaml = uri.path.endsWith('.yaml') || uri.path.endsWith('.yml');

    Json decode(String content) {
      if (isYaml) {
        final yamlDoc = yaml.loadYaml(content);
        // re-encode as json to get a valid json object.
        final jsonString = jsonEncode(yamlDoc);
        return jsonDecode(jsonString) as Json;
      }
      return jsonDecode(content) as Json;
    }

    if (!uri.hasScheme || uri.scheme == 'file') {
      final content = fs.file(uri.toFilePath()).readAsStringSync();
      return decode(content);
    }

    final response = await client.get(uri);
    return decode(response.body);
  }

  Future<Json> load(Uri uri) async {
    if (uri.fragment.isNotEmpty) {
      throw Exception('Fragment not supported: $uri');
    }

    // Check the cache first.
    final maybeJson = _cache[uri];
    if (maybeJson != null) {
      return maybeJson;
    }

    final json = await _fetchWithoutCache(uri);
    _cache[uri] = json;
    return json;
  }

  Json? get(Uri uri) {
    if (uri.fragment.isNotEmpty) {
      throw Exception('Fragment not supported: $uri');
    }
    return _cache[uri];
  }
}
