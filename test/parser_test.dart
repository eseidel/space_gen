import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/spec.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('OpenApi', () {
    OpenApi parseTestSpec(Map<String, dynamic> json) {
      return parseOpenApi(
        json,
        ParseContext.initial(Uri.parse('file:///foo.json')),
      );
    }

    Map<String, Schema> parseTestSchemas(Map<String, dynamic> schemasJson) {
      final specJson = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
          },
        },
        'components': {'schemas': schemasJson},
      };
      final spec = parseTestSpec(specJson);
      return spec.components.schemas;
    }

    test('parse', () {
      final specJson = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
          },
        },
      };
      final spec = parseTestSpec(specJson);
      expect(spec.serverUrl, Uri.parse('https://api.spacetraders.io/v2'));
      expect(spec.endpoints.first.path, '/users');
    });

    test('parse with invalid enum', () {
      final json = {
        'NumberEnum': {
          // This is valid according to the spec, but we don't support it.
          'type': 'number',
          'enum': [1, 2, 3],
        },
      };
      expect(() => parseTestSchemas(json), throwsA(isA<UnimplementedError>()));
    });

    test('equals', () {
      final jsonOne = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
            'parameters': [
              {'name': 'foo', 'in': 'query', 'required': true},
            ],
            'responses': {
              '200': {
                'description': 'OK',
                'content': {
                  'application/json': {
                    'schema': {'type': 'object'},
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Foo': {'type': 'object'},
          },
        },
      };
      final jsonTwo = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
          },
        },
      };
      final specOne = parseTestSpec(jsonOne);
      final specTwo = parseTestSpec(jsonOne);
      final specThree = parseTestSpec(jsonTwo);
      expect(specOne, specTwo);
      expect(specOne, isNot(specThree));
      expect(specOne.hashCode, specTwo.hashCode);
      expect(specOne.hashCode, isNot(specThree.hashCode));
    });

    test('anyOf nullable hack', () {
      final json = {
        'User': {
          'anyOf': [
            {'type': 'boolean'},
            {'type': 'null'},
          ],
        },
      };
      final schemas = parseTestSchemas(json);
      expect(schemas['User']!.type, SchemaType.boolean);
    });

    test('anyOf array hack', () {
      final json = {
        'User': {
          'anyOf': [
            {
              'type': 'array',
              'items': {r'$ref': '#/components/schemas/Value'},
            },
            {r'$ref': '#/components/schemas/Value'},
          ],
        },
        'Value': {'type': 'boolean'},
      };
      final schemas = parseTestSchemas(json);
      final schema = schemas['User']!;
      expect(schema.type, SchemaType.array);
      expect(schema.items!.ref, '#/components/schemas/Value');
    });

    test('anyOf with one value', () {
      final json = {
        'User': {
          'anyOf': [
            {'type': 'boolean'},
          ],
        },
      };
      final schemas = parseTestSchemas(json);
      expect(schemas['User']!.type, SchemaType.boolean);
    });

    test('anyOf not generally supported', () {
      final json = {
        'User': {
          'anyOf': [
            {'type': 'boolean'},
            {'type': 'string'},
          ],
        },
      };
      expect(() => parseTestSchemas(json), throwsA(isA<UnimplementedError>()));
    });

    test('components schemas as ref not supported', () {
      // Refs are generally fine.
      final json = {
        'User': {
          'type': 'object',
          'properties': {
            'value': {r'$ref': '#/components/schemas/Value'},
          },
        },
        'Value': {'type': 'boolean'},
      };
      final schemas = parseTestSchemas(json);
      final schema = schemas['User']!;
      expect(schema.type, SchemaType.object);
      expect(schema.properties['value']!.ref, '#/components/schemas/Value');

      // Just not as a direct alias/redirect
      final json2 = {
        'User': {r'$ref': '#/components/schemas/Value'},
        'Value': {'type': 'boolean'},
      };
      expect(() => parseTestSchemas(json2), throwsUnimplementedError);
    });

    test('parameter with schema and content', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'parameters': [
                {
                  'name': 'foo',
                  'in': 'query',
                  // Both schema and content are not allowed at the same time.
                  'schema': {'type': 'boolean'},
                  'content': {
                    'application/json': {
                      'schema': {'type': 'boolean'},
                    },
                  },
                },
              ],
            },
          },
        },
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('schema and content'),
          ),
        ),
      );
    });

    test('parameter with no schema or content', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'parameters': [
                {'name': 'foo', 'in': 'query'},
              ],
            },
          },
        },
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('schema or content'),
          ),
        ),
      );
    });
    test('warn on version below 3.1.0', () {
      final json = {
        'openapi': '3.0.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0.a.b.c'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
          },
        },
      };

      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseTestSpec(json));
      verify(
        () => logger.warn(
          '3.0.0 may not be supported, only tested with 3.1.0 in /',
        ),
      ).called(1);
      expect(spec.version, Version.parse('3.0.0'));
      // Info.version is the version of the spec, not the version of the OpenAPI
      // schema used to generate it and can be an arbitrary string.
      expect(spec.info.version, '1.0.0.a.b.c');
    });

    test('wrong type for responses', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            // This should throw a FormatException for having an optional
            // key of the wrong type.
            'get': {'responses': true},
          },
        },
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Key responses is not of type Map<String, dynamic>: true (in /paths//users/get)',
            ),
          ),
        ),
      );
    });

    test('empty paths', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {'': <String, dynamic>{}},
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Path cannot be empty in /paths/'),
          ),
        ),
      );
    });
  });

  group('JsonPointer', () {
    test('equality', () {
      const pointerOne = JsonPointer(['foo', 'bar']);
      const pointerTwo = JsonPointer(['foo', 'bar']);
      const pointerThree = JsonPointer(['foo', 'baz']);
      expect(pointerOne, pointerTwo);
      expect(pointerOne.hashCode, pointerTwo.hashCode);
      expect(pointerOne, isNot(pointerThree));
      expect(pointerOne.hashCode, isNot(pointerThree.hashCode));
    });
  });
}
