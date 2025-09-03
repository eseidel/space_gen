// We don't have a good way to shorten the literal strings from the
// expected generated code, so ignoring 80c for now.
// ignore_for_file: lines_longer_than_80_chars
import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('contentTypes', () {
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
        () => renderTestOperation(
          path: '/pet/{petId}/uploadImage',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      verify(
        () => logger.detail(
          'Ignoring: format=int64 (String) in #/parameters/0/schema',
        ),
      ).called(1);
      expect(
        result,
        '/// Test API\n'
        'class PetApi {\n'
        '    PetApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Uploads an image.\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
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
      final result = renderTestOperation(
        path: '/pet/{petId}/uploadFile',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(
        result,
        '/// Test API\n'
        'class PetApi {\n'
        '    PetApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Uploads an image.\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
  });

  group('multiple responses', () {
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
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
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
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
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
        '            return jsonDecode(response.body) as bool;\n'
        '        }\n'
        '\n'
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
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
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
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
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
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
        '            return jsonDecode(response.body) as bool;\n'
        '        }\n'
        '\n'
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });

    test('No successful responses', () {
      final json = {
        'summary': 'Get user',
        'responses': {
          '400': {'description': 'Bad Request'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
  });

  group('parameters', () {
    test('string with default', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
            'schema': {'type': 'string', 'default': 'bar'},
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        "        { String? foo = 'bar', }\n"
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'foo': ?foo.toString(),\n"
        '            },\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
    test('openapi quirks all lists to empty default', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
            'schema': {
              'type': 'array',
              'items': {'type': 'string'},
            },
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      const quirks = Quirks();
      // If this expectation changes, set an explicit quirks for renderOperation
      expect(quirks.allListsDefaultToEmpty, isTrue);
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        // Using default quirks.
      );
      expect(
        result,
        // This expectation is wrong.  foo should just default to null
        // even when quirking for OpenAPI.  Example:
        // https://github.com/eseidel/space_traders/blob/a40923167bb6fec2069ec3c42b6ff69c7fc14439/packages/openapi/lib/api/systems_api.dart#L482
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '        { List<String>? foo = const [], }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'foo': ?foo.toString(),\n"
        '            },\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });

    test('optional newtype parameters', () {
      final json = {
        'operationId': 'get-agents',
        'summary': 'List all public agent details.',
        'tags': ['Agents'],
        'description': 'List all public agent details.',
        'parameters': [
          {
            'schema': {'type': 'integer', 'minimum': 1, 'default': 1},
            'in': 'query',
            'name': 'page',
            'description': 'What entry offset to request',
          },
        ],
        'responses': {
          '200': {'description': 'Successfully fetched agents details.'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class AgentsApi {\n'
        '    AgentsApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// List all public agent details.\n'
        '    /// List all public agent details.\n'
        '    Future<void> getAgents(\n'
        '        { int? page = 1, }\n'
        '    ) async {\n'
        '        page?.validateMinimum(1);\n'
        '\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'page': ?page.toString(),\n"
        '            },\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });

    test('validation statements', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
            'schema': {
              'type': 'string',
              'minLength': 1,
              'maxLength': 10,
              'pattern': r'^[a-z]+$',
            },
          },
          {
            'name': 'bar',
            'in': 'query',
            'description': 'Bar',
            'schema': {
              'type': 'integer',
              'minimum': 1,
              'maximum': 10,
              'exclusiveMinimum': 1,
              'exclusiveMaximum': 10,
              'multipleOf': 2,
            },
          },
          {
            'name': 'baz',
            'in': 'query',
            'description': 'Baz',
            'schema': {
              'type': 'number',
              'multipleOf': 0.1,
              'minimum': 0.1,
              'maximum': 10,
              'exclusiveMinimum': 0.1,
              'exclusiveMaximum': 10.2,
            },
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '        { String? foo,int? bar,double? baz, }\n'
        '    ) async {\n'
        '        foo?.validateMaximumLength(10);\n'
        '        foo?.validateMinimumLength(1);\n'
        "        foo?.validatePattern('^[a-z]+\$');\n"
        '        bar?.validateMaximum(10);\n'
        '        bar?.validateMinimum(1);\n'
        '        bar?.validateExclusiveMaximum(10);\n'
        '        bar?.validateExclusiveMinimum(1);\n'
        '        bar?.validateMultipleOf(2);\n'
        '        baz?.validateMaximum(10.0);\n'
        '        baz?.validateMinimum(0.1);\n'
        '        baz?.validateExclusiveMaximum(10.2);\n'
        '        baz?.validateExclusiveMinimum(0.1);\n'
        '        baz?.validateMultipleOf(0.1);\n'
        '\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'foo': ?foo.toString(),\n"
        "                'bar': ?bar.toString(),\n"
        "                'baz': ?baz.toString(),\n"
        '            },\n'
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
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });

    group('multiple types', () {
      test('string or number', () {
        final json = {
          'summary': 'Get user',
          'parameters': [
            {
              'name': 'foo',
              'in': 'query',
              'description': 'Foo',
              'schema': {
                'type': ['string', 'number'],
              },
            },
          ],
          'responses': {
            '200': {'description': 'OK'},
          },
        };
        final result = renderTestOperation(
          path: '/users',
          operationJson: json,
          serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        );
        // TODO(eseidel): Use dynamic instead of UsersParameter0.
        expect(
          result,
          '/// Test API\n'
          'class DefaultApi {\n'
          '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
          '\n'
          '    final ApiClient client;\n'
          '\n'
          '    /// Get user\n'
          '    Future<void> users(\n'
          '        { UsersParameter0? foo, }\n'
          '    ) async {\n'
          '        final response = await client.invokeApi(\n'
          '            method: Method.post,\n'
          "            path: '/users'\n"
          ',\n'
          '            queryParameters: {\n'
          "                'foo': ?foo?.toJson().toString(),\n"
          '            },\n'
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
          '        throw ApiException.unhandled(response.statusCode);\n'
          '    }\n'
          '}\n',
        );
      });
    });
  });

  group('return type', () {
    test('return type matches json type', () {
      final json = {
        'summary': 'Get emojis',
        'description': 'Lists all the emojis available to use on GitHub.',
        'operationId': 'emojis/get',
        'tags': ['emojis'],
        'responses': {
          '200': {
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'additionalProperties': {'type': 'string'},
                },
              },
            },
            'description': 'Response',
          },
        },
      };
      final result = renderTestOperation(
        path: '/emojis',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class EmojisApi {\n'
        '    EmojisApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get emojis\n'
        '    /// Lists all the emojis available to use on GitHub.\n'
        '    Future<Map<String, String>> emojisGet(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/emojis'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return (jsonDecode(response.body) as Map<String, dynamic>).map((key, value) => MapEntry(key, value as String));\n'
        '        }\n'
        '\n'
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });

    test('remove prefix', () {
      final json = {
        'summary': 'Get emojis',
        'description': 'Lists all the emojis available to use on GitHub.',
        'operationId': 'emojis-get',
        'tags': ['emojis'],
        'responses': {
          '200': {
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'additionalProperties': {'type': 'string'},
                },
              },
            },
            'description': 'Response',
          },
        },
      };
      final result = renderTestOperation(
        path: '/emojis',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        removePrefix: 'emojis',
      );
      expect(
        result,
        '/// Test API\n'
        'class EmojisApi {\n'
        '    EmojisApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get emojis\n'
        '    /// Lists all the emojis available to use on GitHub.\n'
        '    Future<Map<String, String>> get(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/emojis'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return (jsonDecode(response.body) as Map<String, dynamic>).map((key, value) => MapEntry(key, value as String));\n'
        '        }\n'
        '\n'
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
  });

  group('security requirements', () {
    test('apiKey', () {
      final json = {
        'description': 'Get a user',
        'operationId': 'users-get',
        'tags': ['users'],
        'security': [
          {'apiKey': <String>[]},
        ],
        'responses': {
          '200': {
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'properties': {
                    'name': {'type': 'string'},
                  },
                },
              },
            },
            'description': 'User',
          },
        },
      };
      final componentsJson = {
        'securitySchemes': {
          'apiKey': {'type': 'apiKey', 'name': 'apiKey', 'in': 'header'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        componentsJson: componentsJson,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class UsersApi {\n'
        '    UsersApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get a user\n'
        '    Future<UsersGet200Response> usersGet(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            authRequest: ApiKeyAuth(name: "apiKey", secretName: "apiKey", sendIn: SendIn.header),\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersGet200Response.fromJson(jsonDecode(response.body) as Map<String, dynamic>);\n'
        '        }\n'
        '\n'
        '        throw ApiException.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
  });
}
