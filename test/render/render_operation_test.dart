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
        "            path: '/pet/{petId}/uploadImage'.replaceAll('{petId}', '\$petId'),\n"
        '            body: uint8List,\n'
        '            bodyContentType: BodyContentType.octetStream,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });

    test('String path parameter substitutes bare, without interpolation', () {
      // A String path parameter is already a String, so it substitutes
      // directly — no `'${...}'` wrapper (which would trip
      // unnecessary_string_interpolations / _brace_in_string_interps).
      final operation = {
        'tags': ['pet'],
        'summary': 'Get by name.',
        'operationId': 'getByName',
        'parameters': [
          {
            'name': 'name',
            'in': 'path',
            'required': true,
            'schema': {'type': 'string'},
          },
        ],
        'responses': {
          '200': {'description': 'ok'},
        },
      };
      final result = runWithLogger(
        _MockLogger(),
        () => renderTestOperation(
          path: '/pet/{name}',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      expect(
        result,
        contains(".replaceAll('{name}', Uri.encodeComponent(name))"),
      );
      expect(result, isNot(contains(r"'${ name }'")));
      expect(result, isNot(contains(r"'$name'")));
    });

    test('path parameter is percent-encoded', () {
      // Substitution is textual, so an unencoded value carrying a
      // reserved character changes the URL's structure: a `/` splits
      // one segment into two and addresses a different endpoint.
      final operation = {
        'tags': ['pet'],
        'operationId': 'getByName',
        'parameters': [
          {
            'name': 'name',
            'in': 'path',
            'required': true,
            'schema': {'type': 'string'},
          },
        ],
        'responses': {
          '200': {'description': 'ok'},
        },
      };
      final result = runWithLogger(
        _MockLogger(),
        () => renderTestOperation(
          path: '/pet/{name}',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      expect(result, contains('Uri.encodeComponent(name)'));
    });

    test('numeric path parameter is not encoded', () {
      // `int.toString()` can only produce `[0-9-]`, none of which
      // `Uri.encodeComponent` alters, so wrapping it would be noise in
      // the generated source.
      final operation = {
        'tags': ['pet'],
        'operationId': 'getById',
        'parameters': [
          {
            'name': 'petId',
            'in': 'path',
            'required': true,
            'schema': {'type': 'integer'},
          },
        ],
        'responses': {
          '200': {'description': 'ok'},
        },
      };
      final result = runWithLogger(
        _MockLogger(),
        () => renderTestOperation(
          path: '/pet/{petId}',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      expect(result, contains(r".replaceAll('{petId}', '$petId')"));
      expect(result, isNot(contains('Uri.encodeComponent')));
    });

    test('String query parameter is not stringified with .toString()', () {
      // A String query param already produces a String, so no
      // `.toString()` (which would trip noop_primitive_operations). An
      // int param keeps it, since it genuinely converts.
      final operation = {
        'tags': ['pet'],
        'operationId': 'search',
        'parameters': [
          {
            'name': 'q',
            'in': 'query',
            'schema': {'type': 'string'},
          },
          {
            'name': 'page',
            'in': 'query',
            'schema': {'type': 'integer'},
          },
        ],
        'responses': {
          '200': {'description': 'ok'},
        },
      };
      final result = renderTestOperation(
        path: '/search',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(result, contains("'q': [q],"));
      expect(result, isNot(contains('q.toString()')));
      // int param still converts.
      expect(result, contains("'page': [page.toString()],"));
    });

    // #296: a union whose variants are all arrays needs per-variant
    // treatment, but this one is `NoDispatch` — no wrapper subclasses to
    // match on — so the renderer genuinely cannot emit the switch. It must
    // say so. Falling back silently is what made the wrong wire format
    // (`?k=[a, b]`, Dart's `List.toString()`) invisible.
    test('query union the renderer cannot switch over warns', () {
      final operation = {
        'tags': ['pet'],
        'operationId': 'search',
        'parameters': [
          {
            'name': 'twoArrays',
            'in': 'query',
            'schema': {
              'oneOf': [
                {
                  'type': 'array',
                  'items': {'type': 'string'},
                },
                {
                  'type': 'array',
                  'items': {'type': 'integer'},
                },
              ],
            },
          },
        ],
        'responses': {
          '200': {'description': 'ok'},
        },
      };
      final logger = _MockLogger();
      final result = runWithLogger(
        logger,
        () => renderTestOperation(
          path: '/search',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      // The fallback is still the stringified form...
      expect(result, contains("'twoArrays': [twoArrays.toJson().toString()]"));
      // ...but it is no longer silent.
      verify(
        () => logger.warn(
          any(
            that: allOf(
              contains('twoArrays'),
              contains('wrapper subclass'),
            ),
          ),
        ),
      ).called(1);
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

    // #294: `format: date` and base64 bytes were missing from
    // `_isMultipartScalar`, so either one crashed the generator with
    // "must be a scalar or binary" instead of rendering. Both serialize
    // to a `String` on the wire, which is exactly what a multipart text
    // field carries — base64 bytes in particular are a *text* field
    // holding base64, not a file part like `format: binary`.
    test('multipart/form-data with date and base64 fields', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'required': true,
          'content': {
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'required': ['when', 'blob'],
                'properties': {
                  'when': {'type': 'string', 'format': 'date'},
                  'until': {'type': 'string', 'format': 'date'},
                  // The 3.1 spelling; `format: byte` is the 3.0 one and
                  // converges on the same node (#298).
                  'blob': {'type': 'string', 'contentEncoding': 'base64'},
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
      // `Date.toJson()` is already a String — no `.toString()` on top
      // of it (that would be a `noop_primitive_operations` lint).
      expect(result, contains("'when': uploadFileRequest.when.toJson(),"));
      // Optional date: captured to a local, null-checked before set.
      expect(result, contains('final v = uploadFileRequest.until;'));
      expect(
        result,
        contains("if (v != null) multipartFields['until'] = v.toJson();"),
      );
      // Base64 bytes are a text field carrying base64, not a file part.
      expect(
        result,
        contains("'blob': base64.encode(uploadFileRequest.blob),"),
      );
      expect(result, isNot(contains("MultipartFile.fromBytes('blob'")));
    });

    // openfoodfacts `add_or_edit_a_product` carries `brands`/`labels`/
    // `categories` as `type: array` of strings, documented "comma separated
    // list of values". `http`'s `fields` is a `Map<String, String>` and
    // can't repeat a key, so an array field comma-joins into one value —
    // the same `explode: false` form header and query arrays already use.
    test('multipart/form-data with array-of-scalar fields', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'required': true,
          'content': {
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'required': ['brands', 'counts'],
                'properties': {
                  'brands': {
                    'type': 'array',
                    'items': {'type': 'string'},
                  },
                  'labels': {
                    'type': 'array',
                    'items': {'type': 'string'},
                  },
                  'counts': {
                    'type': 'array',
                    'items': {'type': 'integer'},
                  },
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
      // String items are already `String` on the wire — comma-join with no
      // per-element `.map`, which would only copy the list.
      expect(result, contains("'brands': uploadFileRequest.brands.join(','),"));
      // Non-String items convert each element before joining.
      expect(
        result,
        contains(
          "'counts': uploadFileRequest.counts.map((e) => e.toString()).join(','),",
        ),
      );
      // Optional array: captured to a local, null-checked, then joined.
      expect(result, contains('final v = uploadFileRequest.labels;'));
      expect(
        result,
        contains("if (v != null) multipartFields['labels'] = v.join(',');"),
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

    // Array *fields* comma-join (above), but only when their items are
    // themselves wire scalars. An array of objects has no single-value wire
    // form, so it stays outside the v1-supported set and throws — naming
    // the property, like every other unsupported multipart shape.
    test('multipart/form-data rejects an array-of-objects field', () {
      final operation = {
        'tags': ['files'],
        'operationId': 'uploadFile',
        'requestBody': {
          'required': true,
          'content': {
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'required': ['items'],
                'properties': {
                  'items': {
                    'type': 'array',
                    'items': {
                      'type': 'object',
                      'properties': {
                        'name': {'type': 'string'},
                      },
                    },
                  },
                },
              },
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
            allOf(
              contains('multipart/form-data property must be a scalar'),
              contains('"items"'),
            ),
          ),
        ),
      );
    });

    // openfoodfacts `POST /cgi/session.pl` offers only
    // application/x-www-form-urlencoded (no JSON alternative), so it's the
    // sole content type the resolver can pick. The body object renders as a
    // `Map<String, String>` literal that `http` encodes as form fields.
    test('application/x-www-form-urlencoded renders a string-map body', () {
      final operation = {
        'tags': ['auth'],
        'operationId': 'createSession',
        'requestBody': {
          'required': true,
          'content': {
            'application/x-www-form-urlencoded': {
              'schema': {
                'type': 'object',
                'required': ['userId', 'password'],
                'properties': {
                  'userId': {'type': 'string'},
                  'password': {'type': 'string'},
                  'remember': {'type': 'boolean'},
                  'attempts': {'type': 'integer'},
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
        path: '/session',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(result, contains('body: <String, String>{'));
      expect(
        result,
        contains('bodyContentType: BodyContentType.formUrlEncoded,'),
      );
      // Required String: bare, no stringify.
      expect(result, contains("'userId': createSessionRequest.userId"));
      expect(result, contains("'password': createSessionRequest.password"));
      // Optional non-String: coerced with .toString() to satisfy the map
      // value type, and gated behind a collection-if null check.
      expect(
        result,
        contains(
          'if (createSessionRequest.remember case final value?) '
          "'remember': value.toString()",
        ),
      );
      expect(
        result,
        contains(
          'if (createSessionRequest.attempts case final value?) '
          "'attempts': value.toString()",
        ),
      );
      // Uses the shared invokeApi send path, not invokeApiMultipart.
      expect(result, isNot(contains('invokeApiMultipart')));
    });

    // An optional body makes the whole parameter nullable, so even its
    // required fields read through `?.` and hide behind a null check.
    test('application/x-www-form-urlencoded optional body reads via ?.', () {
      final operation = {
        'tags': ['auth'],
        'operationId': 'createSession',
        'requestBody': {
          'content': {
            'application/x-www-form-urlencoded': {
              'schema': {
                'type': 'object',
                'required': ['userId'],
                'properties': {
                  'userId': {'type': 'string'},
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
        path: '/session',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(
        result,
        contains(
          "if (createSessionRequest?.userId case final value?) 'userId': value",
        ),
      );
    });

    // Same comma-join rule as multipart: an array-of-scalar field becomes
    // one `Map<String, String>` value, not repeated keys the map can't hold.
    test('application/x-www-form-urlencoded with array-of-scalar fields', () {
      final operation = {
        'tags': ['auth'],
        'operationId': 'createSession',
        'requestBody': {
          'required': true,
          'content': {
            'application/x-www-form-urlencoded': {
              'schema': {
                'type': 'object',
                'required': ['brands'],
                'properties': {
                  'brands': {
                    'type': 'array',
                    'items': {'type': 'string'},
                  },
                  'labels': {
                    'type': 'array',
                    'items': {'type': 'string'},
                  },
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
        path: '/session',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      // Required array: bare comma-join off the body field.
      expect(
        result,
        contains("'brands': createSessionRequest.brands.join(',')"),
      );
      // Optional array: gated behind a collection-if, joined off `value`.
      expect(
        result,
        contains(
          'if (createSessionRequest.labels case final value?) '
          "'labels': value.join(',')",
        ),
      );
    });

    test('application/x-www-form-urlencoded rejects non-object schema', () {
      final operation = {
        'tags': ['auth'],
        'operationId': 'createSession',
        'requestBody': {
          'content': {
            'application/x-www-form-urlencoded': {
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
          path: '/session',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains(
              'application/x-www-form-urlencoded request body schema must '
              'be an object',
            ),
          ),
        ),
      );
    });

    test(
      'text/plain response body returns response.body without jsonDecode',
      () {
        // Surfaced by github's `/zen` (and `/octocat`, `/markdown`,
        // `/markdown/raw`): the spec declares non-JSON response content
        // (`text/plain`, `text/html`, `application/octocat-stream`) with
        // a `type: string` schema. `package:http`'s `Response.body` is
        // already a `String`; wrapping it in `jsonDecode` would crash
        // at runtime (`Mind your words …` isn't JSON).
        final operation = {
          'tags': ['meta'],
          'summary': 'Get the zen',
          'operationId': 'getZen',
          'responses': {
            '200': {
              'description': 'Response',
              'content': {
                'text/plain': {
                  'schema': {'type': 'string'},
                },
              },
            },
          },
        };
        final result = renderTestOperation(
          path: '/zen',
          operationJson: operation,
          serverUrl: Uri.parse('https://api.github.com'),
        );
        expect(result, contains('return response.body;'));
        expect(result, isNot(contains('jsonDecode')));
      },
    );

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
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });

    test('application/json omits the default bodyContentType argument', () {
      // invokeApi defaults bodyContentType to BodyContentType.json, so a
      // JSON body passes only `body:` (avoid_redundant_argument_values).
      final operation = {
        'tags': ['pet'],
        'operationId': 'createPet',
        'requestBody': {
          'content': {
            'application/json': {
              'schema': {'type': 'string'},
            },
          },
        },
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/pet',
        operationJson: operation,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(result, contains('body: string,'));
      expect(result, isNot(contains('bodyContentType:')));
    });
  });

  group('multiple responses', () {
    test('default + 4xx with no content → untyped ApiException', () {
      // Regression: a `default:` (or 4XX/5XX) response declared with only a
      // description — no `content` schema — used to produce a `RenderVoid`
      // that landed in the typed-error branch with `errorType == 'void'`
      // and `errorFromJson == ''`. The template emitted
      // `ApiException<void>(..., body: ,);` — an empty named arg that
      // failed `dart format` and aborted the whole generation (first
      // seen on petstore). This operation has no request body or error
      // body schema, so the emitted method should not contain `body:`
      // anywhere.
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
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<void> ping(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/ping',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
      expect(result, isNot(contains('body:')));
    });

    test(
      'multiple successful responses with different content emit '
      'status-code dispatch',
      () {
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
          'sealed class UsersResponse {\n'
          '    const UsersResponse();\n'
          '}\n'
          '\n'
          '@immutable\n'
          'final class UsersResponse200 extends UsersResponse {\n'
          '    const UsersResponse200(this.value);\n'
          '\n'
          '    final bool value;\n'
          '\n'
          '    @override\n'
          '    int get hashCode => value.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is UsersResponse200 && value == other.value;\n'
          '    }\n'
          '}\n'
          '\n'
          '@immutable\n'
          'final class UsersResponse201 extends UsersResponse {\n'
          '    const UsersResponse201(this.value);\n'
          '\n'
          '    final String value;\n'
          '\n'
          '    @override\n'
          '    int get hashCode => value.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is UsersResponse201 && value == other.value;\n'
          '    }\n'
          '}\n'
          '\n'
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
          '            throw ApiException<Object?>(response.statusCode, response.body);\n'
          '        }\n'
          '\n'
          '        return switch (response.statusCode) {\n'
          '            200 => UsersResponse200(jsonDecode(response.body) as bool),\n'
          '            201 => UsersResponse201(jsonDecode(response.body) as String),\n'
          '            _ => throw ApiException<Object?>.unhandled(response.statusCode),\n'
          '        };\n'
          '    }\n'
          '}\n',
        );
      },
    );

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
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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

    test(
      'response with empty schema dispatches as a dynamic-valued arm',
      () {
        // The Space Traders `get-cooldown` 204 declares
        // `content: application/json` with an empty (description-only)
        // schema as a workaround for tooling that requires content. The
        // schema parses as RenderUnknown, so the wrapper holds a
        // `dynamic` value rather than collapsing to no-body. Specs that
        // really mean "no body" should omit `content:` entirely (which
        // resolves to RenderVoid → null arm — see the next test).
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
          contains(
            '        return switch (response.statusCode) {\n'
            '            200 => UsersResponse200(jsonDecode(response.body) as bool),\n'
            '            204 => UsersResponse204(jsonDecode(response.body)),\n'
            '            _ => throw ApiException<Object?>.unhandled(response.statusCode),\n'
            '        };\n',
          ),
        );
        expect(
          result,
          contains(
            '@immutable\n'
            'final class UsersResponse204 extends UsersResponse {\n'
            '    const UsersResponse204(this.value);\n'
            '\n'
            '    final dynamic value;\n',
          ),
        );
      },
    );

    test('204 without content emits a no-value wrapper arm', () {
      // The well-formed way to declare "no body": 204 carries only a
      // description, no `content:`. Resolves to RenderVoid → null in
      // bodyByStatus → empty wrapper subclass with no `value` field.
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
          '204': {'description': 'No content'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        contains(
          '        return switch (response.statusCode) {\n'
          '            200 => UsersResponse200(jsonDecode(response.body) as bool),\n'
          '            204 => const UsersResponse204(),\n'
          '            _ => throw ApiException<Object?>.unhandled(response.statusCode),\n'
          '        };\n',
        ),
      );
      expect(
        result,
        contains(
          '@immutable\n'
          'final class UsersResponse204 extends UsersResponse {\n'
          '    const UsersResponse204();\n'
          '\n'
          '    @override\n'
          '    int get hashCode => 204;\n',
        ),
      );
    });

    test('mixed content types: each switch arm decodes per its own type', () {
      // 200 returns text/plain (raw `response.body`), 201 returns
      // JSON (`jsonDecode(response.body)`). Pre-fix, every arm would
      // jsonDecode and crash at runtime on the text/plain status.
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'text/plain': {
                'schema': {'type': 'string'},
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
        contains(
          '        return switch (response.statusCode) {\n'
          '            200 => UsersResponse200(response.body as String),\n'
          '            201 => UsersResponse201(jsonDecode(response.body) as bool),\n'
          '            _ => throw ApiException<Object?>.unhandled(response.statusCode),\n'
          '        };\n',
        ),
      );
    });

    test('2XX range mixed with explicit 2xx falls back to legacy oneOf', () {
      // Status-code dispatch only kicks in when every successful
      // response has an explicit code — `2XX` ranges can't be
      // enumerated, and the wrapper subclasses are named per code. This
      // case keeps the legacy stub until either #144 covers ranges or
      // the spec is rewritten to enumerate codes.
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
          '2XX': {
            'description': 'Other success',
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
      expect(result, isNot(contains('switch (response.statusCode)')));
      expect(result, isNot(contains('sealed class UsersResponse {')));
      expect(result, contains('UsersResponse.fromJson'));
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
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });
  });

  group('parameters', () {
    test('parameter `example` surfaces in the endpoint doc comment', () {
      // Real-world driver: github's `git-ref-only` parameter declares
      // `example: 'heads/feature-a'`. Before, that was dropped on the
      // floor (`Ignoring: example`); now it should land in the
      // endpoint's doc comment, scoped to the parameter via `[name]`.
      final json = {
        'summary': 'Get a ref',
        'parameters': [
          {
            'name': 'ref',
            'in': 'query',
            'required': true,
            'schema': {'type': 'string'},
            'example': 'heads/feature-a',
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/refs',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(result, contains('/// Get a ref'));
      expect(result, contains("/// [ref] example: `'heads/feature-a'`"));
    });

    test(
      'parameter `examples` (OAS 3 plural map) surfaces every value in the '
      'endpoint doc comment',
      () {
        // OpenAPI 3 `examples` is a map of named Example objects; each
        // entry has its own `value`. We surface every one, in
        // declaration order, so the doc is faithful to the spec.
        // Sibling `summary`/`description`/`externalValue` fields go
        // through `_ignored`, which needs a logger scope.
        final json = {
          'parameters': [
            {
              'name': 'installation_id',
              'in': 'query',
              'required': true,
              'schema': {'type': 'integer'},
              'examples': {
                'first': {'value': 1, 'summary': 'first'},
                'second': {'value': 42},
              },
            },
          ],
          'responses': {
            '200': {'description': 'OK'},
          },
        };
        final result = runWithLogger(
          _MockLogger(),
          () => renderTestOperation(
            path: '/installs',
            operationJson: json,
            serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
          ),
        );
        expect(result, contains('/// [installationId] example: `1`'));
        expect(result, contains('/// [installationId] example: `42`'));
      },
    );

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
        "                if (foo != null) 'foo': [foo],\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });
    test('openapi list-default quirk does not apply to query params', () {
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
        // `allListsDefaultToEmpty` fakes an empty-list default for
        // response-model fields (never null); a query param is an input, so
        // it keeps its real null default rather than a no-op `= const []`
        // that the `if (foo != null)` guard would always pass. See #137.
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '        { List<String>? foo, }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users',\n"
        '            queryParameters: {\n'
        "                if (foo != null) 'foo': foo,\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });

    test('query array with explode: false comma-joins into one value', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
            'required': true,
            'explode': false,
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
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      // explode: false → one comma-joined value, not repeated keys. The joined
      // string is wrapped in a 1-element list for the Map<String, List<String>>.
      // The elements are already `String`, so they join directly — no
      // intervening identity `.map`.
      expect(
        result,
        contains("'foo': [foo.join(',')],"),
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
        "                if (page != null) 'page': [page.toString()],\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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
        "        foo?.validatePattern('^[a-z]+\\\$');\n"
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
        "                if (foo != null) 'foo': [foo],\n"
        "                if (bar != null) 'bar': [bar.toString()],\n"
        "                if (baz != null) 'baz': [baz.toString()],\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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
          "                if (foo != null) 'foo': [foo.toJson().toString()],\n"
          '            },\n'
          '        );\n'
          '\n'
          '        if (response.statusCode >= HttpStatus.badRequest) {\n'
          '            throw ApiException<Object?>(response.statusCode, response.body);\n'
          '        }\n'
          '    }\n'
          '}\n',
        );
      });

      test('string or array of string switches on the variant', () {
        // github's `cwes` / `affects`: a union mixing a single value with an
        // array of them. The union's `toJson()` is `dynamic`, so the scalar
        // path would stringify the list variant to `"[a, b]"` instead of
        // repeating the key. Each arm must contribute its own wire shape.
        final json = {
          'summary': 'Get user',
          'parameters': [
            {
              'name': 'cwes',
              'in': 'query',
              'schema': {
                'oneOf': [
                  {'type': 'string'},
                  {
                    'type': 'array',
                    'items': {'type': 'string'},
                  },
                ],
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
          contains(
            "if (cwes != null) 'cwes': switch (cwes) { "
            'UsersParameter0String(:final value) => [value], '
            'UsersParameter0List(:final value) => value, }',
          ),
        );
      });

      test('union with a smooshed object variant stays on the direct path', () {
        // An object variant is smooshed — it extends the sealed parent
        // directly and carries its own fields, so there is no `value` to
        // destructure and a switch arm written against it would not
        // compile. The union has an array variant, so only the
        // missing-wrapper guard keeps this off the switch path.
        final json = {
          'summary': 'Get user',
          'parameters': [
            {
              'name': 'filter',
              'in': 'query',
              'schema': {
                'oneOf': [
                  {
                    'type': 'object',
                    'properties': {
                      'a': {'type': 'string'},
                    },
                  },
                  {
                    'type': 'array',
                    'items': {'type': 'string'},
                  },
                ],
              },
            },
          ],
          'responses': {
            '200': {'description': 'OK'},
          },
        };
        // The object variant also makes this a shape the resolver warns
        // about, so it needs a logger scope.
        final result = runWithLogger(
          _MockLogger(),
          () => renderTestOperation(
            path: '/users',
            operationJson: json,
            serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
          ),
        );
        expect(result, isNot(contains('switch (filter)')));
        expect(
          result,
          contains(
            "if (filter != null) 'filter': [filter.toJson().toString()]",
          ),
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
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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
      // returns the literal string "null". Now wraps in
      // `if (flag != null) 'flag': [flag.toString()]` — the conditional
      // map entry suppresses the pair entirely when the value is null.
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
      expect(result, contains('if (flag != null)'));
      expect(result, contains('[flag.toString()]'));
      // The buggy variants must stay gone.
      expect(result, isNot(contains('?flag.toString()')));
      expect(result, isNot(contains("'flag': ?flag.toString()")));
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
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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
        "            authRequest: const ApiKeyAuth(name: 'apiKey', secretName: 'apiKey', sendIn: ApiKeyLocation.header),\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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
        // One `const`, at the outermost const-able point: the nested
        // AllOfAuth / ApiKeyAuth / NoAuth sit in a constant context already,
        // so repeating it would be `unnecessary_const`. `dart format` owns
        // the wrapping, which is why this is emitted on one line.
        "            authRequest: const OneOfAuth([AllOfAuth([ApiKeyAuth(name: 'apiKey', secretName: 'apiKey', sendIn: ApiKeyLocation.header), HttpAuth(scheme: 'Bearer', secretName: 'http')]), ApiKeyAuth(name: 'apiKey', secretName: 'apiKey', sendIn: ApiKeyLocation.header), NoAuth()]),\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body);\n'
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

    test('oauth2 scheme emits bearer pass-through', () {
      // oauth2 schemes deliver a bearer token at the wire level. We
      // generate the same `HttpAuth(scheme: 'bearer', ...)` plumbing
      // as `http` + `bearer` so callers can supply the token through
      // the standard `readSecret` callback. Token acquisition (OAuth2
      // grants, refresh) is the caller's problem — we don't generate
      // any flow logic.
      final json = {
        'description': 'Get a user',
        'operationId': 'usersGet',
        'tags': ['users'],
        'security': [
          {
            'oauth2': <String>['read'],
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final componentsJson = {
        'securitySchemes': {
          'oauth2': {
            'type': 'oauth2',
            'flows': {
              'implicit': {
                'authorizationUrl': 'https://example.com/auth',
                'scopes': {'read': 'Read access'},
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        componentsJson: componentsJson,
        serverUrl: Uri.parse('https://example.com'),
      );
      expect(
        result,
        contains(
          "authRequest: const HttpAuth(scheme: 'bearer', secretName: 'oauth2'),",
        ),
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
        '                response.body,\n'
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
            'response.body);',
          ),
        );
      },
    );
  });
}
