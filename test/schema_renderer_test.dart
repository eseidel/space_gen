import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('renderSchema', () {
    test('smoke test', () {
      final schema = {
        'type': 'object',
        'properties': {'foo': <String, dynamic>{}},
      };
      final result = renderSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        {  this.foo,\n'
        '         }\n'
        '    );\n'
        '\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: json['foo'],\n"
        '        );\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final  dynamic? foo;\n'
        '\n'
        '\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo': foo,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          foo.hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && identical(foo, other.foo)\n'
        '        ;\n'
        '    }\n'
        '}\n'
        '',
      );
    });
    test('with datetime', () {
      final schema = {
        'type': 'object',
        'properties': {
          'foo': {'type': 'string', 'format': 'date-time'},
        },
      };
      final result = renderSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        {  this.foo,\n'
        '         }\n'
        '    );\n'
        '\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: maybeParseDateTime(json['foo'] as String?) ,\n"
        '        );\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final  DateTime? foo;\n'
        '\n'
        '\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo': foo?.toIso8601String(),\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          foo.hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && foo == other.foo\n'
        '        ;\n'
        '    }\n'
        '}\n'
        '',
      );
    });

    test('allOf', () {
      final schema = {
        'allOf': [
          {
            'type': 'object',
            'properties': {
              'foo': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'properties': {
              'bar': {'type': 'number'},
            },
          },
        ],
      };
      final logger = _MockLogger();
      final result = runWithLogger(logger, () => renderSchema(schema));
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        {  this.foo, this.bar,\n'
        '         }\n'
        '    );\n'
        '\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: json['foo'] as String? ,\n"
        "            bar: (json['bar'] as num?).toDouble() ,\n"
        '        );\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final  String? foo;\n'
        '    final  double? bar;\n'
        '\n'
        '\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo': foo,\n"
        "            'bar': bar,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '        Object.hash(\n'
        '          foo,\n'
        '          bar,\n'
        '        );\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && foo == other.foo\n'
        '            && bar == other.bar\n'
        '        ;\n'
        '    }\n'
        '}\n'
        '',
      );
    });

    test('oneOf', () {
      final schema = {
        'oneOf': [
          {'type': 'string'},
          {'type': 'number'},
        ],
      };
      final result = renderSchema(schema);
      expect(
        result,
        '\n'
        'sealed class Test {\n'
        '    static Test fromJson(dynamic jsonArg) {\n'
        '        // Determine which schema to use based on the json.\n'
        '        // TODO(eseidel): Implement this.\n'
        "        throw UnimplementedError('Test.fromJson');\n"
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(dynamic json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    /// Require all subclasses to implement toJson.\n'
        '    dynamic toJson();\n'
        '}\n'
        '',
      );
    });

    test('anyOf', () {
      final schema = {
        'anyOf': [
          {'type': 'string'},
          {'type': 'number'},
        ],
      };
      final result = renderSchema(schema);
      // anyOf currently renders as a oneOf, which is wrong.
      expect(
        result,
        '\n'
        'sealed class Test {\n'
        '    static Test fromJson(dynamic jsonArg) {\n'
        '        // Determine which schema to use based on the json.\n'
        '        // TODO(eseidel): Implement this.\n'
        "        throw UnimplementedError('Test.fromJson');\n"
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(dynamic json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    /// Require all subclasses to implement toJson.\n'
        '    dynamic toJson();\n'
        '}\n'
        '',
      );
    });

    test('map type', () {
      final schema = {
        'type': 'object',
        'properties': {
          'map': {
            'type': 'object',
            'additionalProperties': {'type': 'string'},
          },
        },
      };
      final result = renderSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        {  this.map,\n'
        '         }\n'
        '    );\n'
        '\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            map: json['map'].map((key, value) => MapEntry(key, value as String )).toMap(),\n"
        '        );\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final  Map<String, String>? map;\n'
        '\n'
        '\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'map': map.map((key, value) => MapEntry(key, value)).toMap(),\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          map.hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && mapsEqual(map, other.map)\n'
        '        ;\n'
        '    }\n'
        '}\n'
        '',
      );
    });

    test('empty object', () {
      final schema = {'type': 'object', 'properties': <String, dynamic>{}};
      final result = renderSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    const Test();\n'
        '\n'
        '    factory Test.fromJson(Map<String, dynamic> _) {\n'
        '        return const Test();\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    Map<String, dynamic> toJson() => const {};\n'
        '}\n'
        '',
      );
    });
  });

  group('renderOperation', () {
    test('application/octet-stream', () {
      final operation = {
        'tags': ['pet'],
        'summary': 'Uploads an image.',
        'operationId': 'uploadFile',
        'parameters': [
          {
            'name': 'petId',
            'in': 'path',
            'description': 'ID of pet to update',
            'required': true,
            'schema': {'type': 'integer', 'format': 'int64'},
          },
        ],
        'requestBody': {
          'content': {
            'application/octet-stream': {
              'schema': {'type': 'string', 'format': 'binary'},
            },
          },
        },
        'responses': {
          '200': {'description': 'successful operation'},
        },
      };
      final logger = _MockLogger();
      final result = runWithLogger(
        logger,
        () => renderOperation(
          path: '/pet/{petId}/uploadImage',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      verify(
        () => logger.detail('Unused keys: format in #/parameters/0/schema'),
      ).called(1);
      expect(
        result,
        'class PetApi {\n'
        '    PetApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<void> uploadFile(\n'
        '        int petId,\n'
        '        { Uint8List? uint8List, }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/pet/{petId}/uploadImage'\n"
        '            .replaceAll(\'{petId}\', "\${ petId }")\n'
        '            ,\n'
        '            body: uint8List,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$uploadFile');\n"
        '    }\n'
        '}\n'
        '',
      );
    });

    test('text/plain', () {
      final operation = {
        'tags': ['pet'],
        'summary': 'Uploads an image.',
        'operationId': 'uploadFile',
        'requestBody': {
          'content': {
            'text/plain': {
              'schema': {'type': 'string'},
            },
          },
        },
        'responses': {
          '200': {'description': 'successful operation'},
        },
      };
      final result = renderOperation(
        path: '/pet/{petId}/uploadFile',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(
        result,
        'class PetApi {\n'
        '    PetApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<void> uploadFile(\n'
        '        { String? string, }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/pet/{petId}/uploadFile'\n"
        ',\n'
        '            body: string,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$uploadFile');\n"
        '    }\n'
        '}\n'
        '',
      );
    });

    test('multiple successful responses with different content not supported', () {
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
          '201': {
            'description': 'Created',
            'content': {
              'application/json': {
                'schema': {'type': 'string'},
              },
            },
          },
        },
      };
      final result = renderOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<UsersResponse> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersResponse.fromJson(jsonDecode(response.body) as dynamic);\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n'
        '',
      );
    });

    test('multiple successful responses with same content is supported', () {
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
          '201': {
            'description': 'Created',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
        },
      };
      final result = renderOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<bool> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return (jsonDecode(response.body) as bool) ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n'
        '',
      );
    });

    test('multiple successful responses with content ignores empty responses', () {
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
          '204': {
            'description': 'No content',
            'content': {
              'application/json': {
                // This doesn't error because schema is empty.
                // This is a hack for Space Traders get-cooldown.
                'schema': {'description': 'No content'},
              },
            },
          },
        },
      };
      final result = renderOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<UsersResponse> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersResponse.fromJson(jsonDecode(response.body) as dynamic);\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n'
        '',
      );
    });

    test('multiple responses with content ignores non-successful responses', () {
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
          '404': {
            'description': 'Not Found',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
        },
      };
      final result = renderOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<bool> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return (jsonDecode(response.body) as bool) ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n'
        '',
      );
    });

    test('No successful responses', () {
      final json = {
        'summary': 'Get user',
        'responses': {
          '400': {'description': 'Bad Request'},
        },
      };
      final result = renderOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<void> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n'
        '',
      );
    });
  });
}
