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
        "            path: '/pet/{petId}/uploadImage'.replaceAll('{petId}', \"\${ petId }\"),\n"
        '            body: uint8List,\n'
        '            bodyContentType: BodyContentType.octetStream,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });

    test('multipart/form-data with required file only', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'required': true,
          'content': {
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'required': ['file'],
                'properties': {
                  'file': {'type': 'string', 'format': 'binary'},
                },
              },
            },
          },
        },
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/upload',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      // Required file goes directly into the list literal; no .add call.
      expect(
        result,
        contains(
          "http.MultipartFile.fromBytes('file', uploadFileRequest.file, filename: 'file'),",
        ),
      );
      expect(result, contains('client.invokeApiMultipart('));
      expect(result, contains('fields: multipartFields,'));
      expect(result, contains('files: multipartFiles,'));
      // No JSON `body:` parameter in the generated call.
      expect(result, isNot(contains('body:')));
    });

    test('multipart/form-data with scalar + binary + optional field', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'required': true,
          'content': {
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'required': ['file', 'name', 'count'],
                'properties': {
                  'file': {'type': 'string', 'format': 'binary'},
                  'name': {'type': 'string'},
                  'description': {'type': 'string'},
                  'count': {'type': 'integer'},
                },
              },
            },
          },
        },
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/upload',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      // Required String field inlined in the fields literal.
      expect(result, contains("'name': uploadFileRequest.name,"));
      // Required integer field: .toString() inlined in fields literal.
      expect(
        result,
        contains("'count': uploadFileRequest.count.toString(),"),
      );
      // Optional scalar: captured to a local, null-checked before set.
      expect(result, contains('final v = uploadFileRequest.description;'));
      expect(
        result,
        contains("if (v != null) multipartFields['description'] = v;"),
      );
      // Required file inlined in the files literal.
      expect(
        result,
        contains(
          "http.MultipartFile.fromBytes('file', uploadFileRequest.file, filename: 'file'),",
        ),
      );
    });

    test('multipart/form-data with optional file', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'required': true,
          'content': {
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'properties': {
                  'file': {'type': 'string', 'format': 'binary'},
                },
              },
            },
          },
        },
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/upload',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(result, contains('final f = uploadFileRequest.file;'));
      expect(
        result,
        contains(
          "if (f != null) multipartFiles.add(http.MultipartFile.fromBytes('file', f, filename: 'file'));",
        ),
      );
    });

    test(
      'multipart/form-data nullable body: body access guarded by null check',
      () {
        // Regression: previously the template emitted the required-field
        // literal init *outside* any null guard, so a nullable body
        // (`required: true` omitted — which is the OpenAPI default) produced
        // `multipartRequest.file` on a nullable receiver — a compile error.
        final operation = {
          'tags': ['files'],
          'operationId': 'upload',
          'requestBody': {
            'content': {
              'multipart/form-data': {
                'schema': {
                  'type': 'object',
                  'required': ['file'],
                  'properties': {
                    'file': {'type': 'string', 'format': 'binary'},
                  },
                },
              },
            },
          },
          'responses': {
            '200': {'description': 'OK'},
          },
        };
        final result = renderTestOperation(
          path: '/upload',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        );
        // The body param itself must be nullable.
        expect(result, contains('UploadRequest? uploadRequest'));
        // The literal init must be empty and precede the null guard —
        // the guarded block does the actual assignment so that the field
        // access only happens after we confirm the body is non-null.
        expect(result, contains('final multipartFields = <String, String>{};'));
        expect(
          result,
          contains('final multipartFiles = <http.MultipartFile>[];'),
        );
        expect(result, contains('if (uploadRequest != null)'));
        // Body-field access is inside the guard.
        final guardIndex = result.indexOf('if (uploadRequest != null)');
        final accessIndex = result.indexOf('uploadRequest.file');
        expect(guardIndex, isNonNegative);
        expect(accessIndex, greaterThan(guardIndex));
      },
    );

    test('multipart/form-data rejects non-object schema', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'content': {
            'multipart/form-data': {
              'schema': {'type': 'string'},
            },
          },
        },
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      expect(
        () => renderTestOperation(
          path: '/upload',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains(
              'multipart/form-data request body schema must be an object',
            ),
          ),
        ),
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
        "            path: '/pet/{petId}/uploadFile',\n"
        '            body: string,\n'
        '            bodyContentType: BodyContentType.textPlain,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });
  });

  group('multiple responses', () {
    test('default + 4xx with no content → untyped ApiException, no `body: ,`', () {
      // Regression: a `default:` (or 4XX/5XX) response declared with only a
      // description — no `content` schema — used to produce a `RenderVoid`
      // that landed in the typed-error branch with `errorType == 'void'`
      // and `errorFromJson == ''`. The template emitted
      // `ApiException<void>(..., body: ,);` — an empty named arg that
      // failed `dart format` and aborted the whole generation (first
      // seen on petstore).
      final json = {
        'responses': {
          '200': {'description': 'OK'},
          '400': {'description': 'Bad request'},
          'default': {'description': 'Unexpected error'},
        },
      };
      final result = renderTestOperation(
        path: '/ping',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(result, contains('ApiException<Object?>'));
      expect(result, isNot(contains('ApiException<void>')));
      expect(result, isNot(contains('body: ,')));
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
        "            path: '/users',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersResponse.fromJson(jsonDecode(response.body) as dynamic);\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
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
        "            path: '/users',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return jsonDecode(response.body) as bool;\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
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
        "            path: '/users',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersResponse.fromJson(jsonDecode(response.body) as dynamic);\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
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
        "            path: '/users',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return jsonDecode(response.body) as bool;\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
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
        "            path: '/users',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
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
        "            path: '/users',\n"
        '            queryParameters: {\n'
        "                'foo': ?foo?.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
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
      // allListsDefaultToEmpty is an openapi-only quirk; the plain
      // Quirks() default no longer turns it on.
      const quirks = Quirks(allListsDefaultToEmpty: true);
      expect(const Quirks().allListsDefaultToEmpty, isFalse);
      expect(const Quirks.openapi().allListsDefaultToEmpty, isTrue);
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        quirks: quirks,
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
        "            path: '/users',\n"
        '            queryParameters: {\n'
        "                'foo': ?foo?.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
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
        "            path: '/users',\n"
        '            queryParameters: {\n'
        "                'page': ?page?.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
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
        "            path: '/users',\n"
        '            queryParameters: {\n'
        "                'foo': ?foo?.toString(),\n"
        "                'bar': ?bar?.toString(),\n"
        "                'baz': ?baz?.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
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
          "            path: '/users',\n"
          '            queryParameters: {\n'
          "                'foo': ?foo?.toJson()?.toString(),\n"
          '            },\n'
          '        );\n'
          '\n'
          '        if (response.statusCode >= HttpStatus.badRequest) {\n'
          '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
          '        }\n'
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
        "            path: '/emojis',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return (jsonDecode(response.body) as Map<String, dynamic>).map((key, value) => MapEntry(key, value as String));\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });

    test('nullable primitive query param is null-safe', () {
      // Regression: previously generated `'foo': ?foo.toString()`, which
      // always emitted the entry because `.toString()` on a null primitive
      // returns the literal string "null". Must be `?foo?.toString()` so
      // the null-aware map entry suppresses the pair entirely.
      final json = {
        'summary': 'Get user',
        'operationId': 'getUser',
        'tags': ['users'],
        'parameters': [
          {
            'name': 'flag',
            'in': 'query',
            'schema': {'type': 'boolean'},
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
      expect(result, contains('?flag?.toString()'));
      expect(result, isNot(contains('?flag.toString()')));
    });

    test('void return omits body/unhandled branch (allows 204)', () {
      final json = {
        'summary': 'Delete user',
        'operationId': 'deleteUser',
        'tags': ['users'],
        'responses': {
          '204': {'description': 'No content'},
        },
      };
      final result = renderTestOperation(
        path: '/users/{id}',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      // Generated `Future<void>` methods should not contain the
      // `response.body.isNotEmpty` guard or the `ApiException.unhandled`
      // fallback — otherwise every successful 204 would throw.
      expect(result, contains('Future<void> deleteUser'));
      expect(result, isNot(contains('response.body.isNotEmpty')));
      expect(result, isNot(contains('ApiException.unhandled')));
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
        "            path: '/emojis',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return (jsonDecode(response.body) as Map<String, dynamic>).map((key, value) => MapEntry(key, value as String));\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
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
        "            path: '/users',\n"
        '            authRequest: ApiKeyAuth(name: "apiKey", secretName: "apiKey", sendIn: ApiKeyLocation.header),\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersGet200Response.fromJson(jsonDecode(response.body) as Map<String, dynamic>);\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
    test('multiple conditions', () {
      final json = {
        'description': 'Get a user',
        'operationId': 'users-get',
        'tags': ['users'],
        'security': <Map<String, List<String>>>[
          {'apiKey': <String>[], 'http': <String>[]},
          {'apiKey': <String>[]},
          {},
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
          'http': {'type': 'http', 'scheme': 'Bearer'},
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
        "            path: '/users',\n"
        '            authRequest: OneOfAuth([\n'
        '              AllOfAuth([\n'
        '                ApiKeyAuth(name: "apiKey", secretName: "apiKey", sendIn: ApiKeyLocation.header),\n'
        '                HttpAuth(scheme: "Bearer", secretName: "http"),\n'
        '              ]),\n'
        '              ApiKeyAuth(name: "apiKey", secretName: "apiKey", sendIn: ApiKeyLocation.header),\n'
        '              NoAuth(),\n'
        '            ]),\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersGet200Response.fromJson(jsonDecode(response.body) as Map<String, dynamic>);\n'
        '        }\n'
        '\n'
        '        throw ApiException<Object?>.unhandled(response.statusCode);\n'
        '    }\n'
        '}\n',
      );
    });
  });

  group('range (NXX) responses', () {
    test('2XX schema drives return type when no explicit 2xx code', () {
      final json = {
        'summary': 'Get widgets',
        'operationId': 'getWidgets',
        'responses': {
          '2XX': {
            'description': 'Success',
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'properties': {
                    'id': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/widgets',
        operationJson: json,
        serverUrl: Uri.parse('https://example.com'),
      );
      // Assert on the return type line rather than the whole output —
      // the interesting bit is that the 2XX schema won.
      expect(result, contains('Future<GetWidgets2XXResponse> getWidgets('));
    });
  });

  group('default response (typed error body)', () {
    test('emits ApiException<ErrorType> with parsed body', () {
      final json = {
        'summary': 'Get widgets',
        'operationId': 'getWidgets',
        'responses': {
          '200': {'description': 'OK'},
          'default': {
            'description': 'Error',
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'properties': {
                    'message': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/widgets',
        operationJson: json,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get widgets\n'
        '    Future<void> getWidgets(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/widgets',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<GetWidgetsDefaultResponse>(\n'
        '                response.statusCode,\n'
        '                response.body.toString(),\n'
        '                body: GetWidgetsDefaultResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>),\n'
        '            );\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });

    test('4XX range alone drives the typed error body', () {
      final json = {
        'summary': 'Get widgets',
        'operationId': 'getWidgets',
        'responses': {
          '200': {'description': 'OK'},
          '4XX': {
            'description': 'Client error',
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'properties': {
                    'reason': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/widgets',
        operationJson: json,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(result, contains('throw ApiException<GetWidgets4XXResponse>('));
      expect(result, contains('body: GetWidgets4XXResponse.fromJson'));
    });

    test(
      'default + 4XX with identical inline schemas still typed',
      () {
        final errorSchema = {
          'type': 'object',
          'properties': {
            'message': {'type': 'string'},
          },
        };
        final json = {
          'summary': 'Get widgets',
          'operationId': 'getWidgets',
          'responses': {
            '200': {'description': 'OK'},
            '4XX': {
              'description': 'Client error',
              'content': {
                'application/json': {'schema': errorSchema},
              },
            },
            'default': {
              'description': 'Error',
              'content': {
                'application/json': {'schema': errorSchema},
              },
            },
          },
        };
        final result = renderTestOperation(
          path: '/widgets',
          operationJson: json,
          serverUrl: Uri.parse('https://example.com'),
        );
        // Both default and 4XX are structurally the same inline schema;
        // deduplication collapses them so the typed throw still fires.
        expect(result, contains('throw ApiException<'));
        expect(result, isNot(contains('throw ApiException<Object?>')));
      },
    );

    test(
      'default + 4XX with different schemas falls back to untyped',
      () {
        final json = {
          'summary': 'Get widgets',
          'operationId': 'getWidgets',
          'responses': {
            '200': {'description': 'OK'},
            '4XX': {
              'description': 'Client error',
              'content': {
                'application/json': {
                  'schema': {
                    'type': 'object',
                    'properties': {
                      'reason': {'type': 'string'},
                    },
                  },
                },
              },
            },
            'default': {
              'description': 'Error',
              'content': {
                'application/json': {
                  'schema': {
                    'type': 'object',
                    'properties': {
                      'message': {'type': 'string'},
                    },
                  },
                },
              },
            },
          },
        };
        final result = renderTestOperation(
          path: '/widgets',
          operationJson: json,
          serverUrl: Uri.parse('https://example.com'),
        );
        // Schemas disagree — fall back to untyped throw.
        expect(
          result,
          contains(
            'throw ApiException<Object?>(response.statusCode, '
            'response.body.toString());',
          ),
        );
      },
    );
  });
}
