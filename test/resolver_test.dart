import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('resolver', () {
    ResolvedSpec parseAndResolveTestSpec(Map<String, dynamic> json) {
      final spec = parseOpenApi(json);
      return resolveSpec(spec);
    }

    ResolvedSchema parseAndResolveTestSchema(Map<String, dynamic> schemaJson) {
      final specJson = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {'schema': schemaJson},
                  },
                },
              },
            },
          },
        },
      };
      final spec = parseAndResolveTestSpec(specJson);
      return spec.paths.first.operations.first.responses.first.content;
    }

    test('path parameters must be strings or integers', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'parameters': [
                {
                  'name': 'foo',
                  'in': 'path',
                  'schema': {'type': 'number'},
                  'required': true,
                },
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseAndResolveTestSpec(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Path parameters must be strings or integers in #/paths//users/get/parameters/0',
            ),
          ),
        ),
      );
    });

    test('path parameters can be oneOf of strings or integers', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'parameters': [
                {
                  'name': 'foo',
                  'in': 'path',
                  'schema': {
                    'oneOf': [
                      {'type': 'string'},
                      {'type': 'integer'},
                    ],
                  },
                  'required': true,
                },
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseAndResolveTestSpec(json));
      expect(
        spec.paths.first.operations.first.parameters.first.schema,
        isA<ResolvedOneOf>().having(
          (e) => e.schemas.length,
          'schemas',
          equals(2),
        ),
      );
    });

    test('path parameters can be enum', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'parameters': [
                {
                  'name': 'foo',
                  'in': 'path',
                  'schema': {
                    'type': 'string',
                    'enum': ['bar', 'baz'],
                  },
                  'required': true,
                },
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseAndResolveTestSpec(json));
      expect(
        spec.paths.first.operations.first.parameters.first.schema,
        isA<ResolvedEnum>().having(
          (e) => e.values,
          'values',
          equals(['bar', 'baz']),
        ),
      );
    });

    test('allOf only supports objects', () {
      final json = {
        'allOf': [
          {'type': 'string'},
          {'type': 'integer'},
        ],
      };
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseAndResolveTestSchema(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'allOf only supports objects: '
              'ResolvedPod(snakeName: users200_response_all_of_0, pointer: '
              '#/paths//users/get/responses/200/content/application/json/schema/allOf/0) '
              'in #/paths//users/get/responses/200/content/application/json/schema',
            ),
          ),
        ),
      );
    });

    test('allOf with objects', () {
      final json = {
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
              'bar': {'type': 'integer'},
            },
          },
        ],
      };
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedAllOf>().having(
          (e) => e.schemas.length,
          'schemas',
          equals(2),
        ),
      );
    });

    test('resolve anyOf', () {
      final json = {
        'anyOf': [
          {'type': 'string'},
          {'type': 'integer'},
        ],
      };
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedAnyOf>().having(
          (e) => e.schemas.length,
          'schemas',
          equals(2),
        ),
      );
    });

    test('anyOf nullable hack', () {
      final json = {
        'anyOf': [
          {'type': 'boolean'},
          {'type': 'null'},
        ],
      };
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedPod>().having(
          (e) => e.type,
          'type',
          equals(PodType.boolean),
        ),
      );
    });

    test('uses array instead of anyOf when possible', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/User'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
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
          },
        },
      };

      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseAndResolveTestSpec(json));
      expect(
        spec.paths.first.operations.first.responses.first.content,
        isA<ResolvedArray>().having(
          (e) => e.items,
          'items',
          isA<ResolvedPod>().having(
            (e) => e.type,
            'type',
            equals(PodType.boolean),
          ),
        ),
      );
    });

    test('anyOf with one value', () {
      final json = {
        'anyOf': [
          {'type': 'boolean'},
        ],
      };
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedPod>().having(
          (e) => e.type,
          'type',
          equals(PodType.boolean),
        ),
      );
    });

    test('anyOf parses as SchemaAnyOf', () {
      final json = {
        'anyOf': [
          {'type': 'boolean'},
          {'type': 'string'},
        ],
      };
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedAnyOf>().having(
          (e) => e.schemas.length,
          'schemas',
          equals(2),
        ),
      );
    });

    test('allOf with one item', () {
      final json = {
        'allOf': [
          {'type': 'boolean'},
        ],
      };
      // allOf with just one item essentially copies the schema to a new name
      // for objects.  For pod types, it just returns the pod type.
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedPod>().having(
          (e) => e.type,
          'type',
          equals(PodType.boolean),
        ),
      );
    });
    test('items is required for type=array', () {
      final json = {'type': 'array'};
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseAndResolveTestSchema(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'items is required for type=array in #/paths//users/get/responses/200/content/application/json/schema',
            ),
          ),
        ),
      );
    });
    test('items must be an schema for type=array', () {
      final json = {'type': 'array', 'items': true};
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseAndResolveTestSchema(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              "'items' is not of type Map<String, dynamic>: true in #/paths//users/get/responses/200/content/application/json/schema",
            ),
          ),
        ),
      );
    });
    test('schema not found', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Missing'},
                    },
                  },
                },
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseAndResolveTestSpec(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Schema? not found: '
              'https://api.spacetraders.io/v2#/components/schemas/Missing',
            ),
          ),
        ),
      );
    });
    test('schema ref to wrong object type', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        r'$ref': '#/components/requestBodies/RequestBody',
                      },
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'requestBodies': {
            'RequestBody': {
              'type': 'object',
              'content': {
                'application/json': {
                  'schema': {'type': 'string'},
                },
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseAndResolveTestSpec(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Expected Schema?, got '
              'RequestBody(#/components/requestBodies/RequestBody, null, '
              '{application/json: MediaType(SchemaRef(null, '
              'SchemaPod([#/components/requestBodies/RequestBody/content/application/json/schema, '
              'request_body, null], PodType.string, null)))}, false)',
            ),
          ),
        ),
      );
    });
  });

  group('ResolvedSchema', () {
    test('RenderObject equality', () {
      final schema1 = ResolvedObject(
        snakeName: 'Foo',
        pointer: JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        ),
        description: 'Foo',
        properties: const {},
        additionalProperties: null,
        requiredProperties: const [],
      );
      final schema2 = ResolvedObject(
        snakeName: 'Foo',
        pointer: JsonPointer.parse(
          '#/paths//users/get/responses/201/content/application/json/schema',
        ),
        description: 'Foo',
        properties: const {},
        additionalProperties: null,
        requiredProperties: const [],
      );
      expect(schema1, equals(schema1));
      // Different pointer.
      expect(schema1, isNot(equals(schema2)));
    });
    test('RenderArray equality', () {
      final pointer200 = JsonPointer.parse(
        '#/paths//users/get/responses/200/content/application/json/schema',
      );
      final pointer201 = JsonPointer.parse(
        '#/paths//users/get/responses/201/content/application/json/schema',
      );
      final schema1 = ResolvedArray(
        snakeName: 'Foo',
        pointer: pointer200,
        description: 'Foo',
        items: ResolvedPod(
          type: PodType.string,
          pointer: pointer200,
          snakeName: 'Foo',
          description: 'Foo',
        ),
      );
      final schema2 = ResolvedArray(
        snakeName: 'Foo',
        pointer: pointer201,
        description: 'Foo',
        items: ResolvedPod(
          type: PodType.string,
          pointer: pointer200,
          snakeName: 'Foo',
          description: 'Foo',
        ),
      );
      expect(schema1, equals(schema1));
      // Different pointer.
      expect(schema1, isNot(equals(schema2)));
      // Different items.
      expect(
        schema1,
        isNot(
          equals(
            ResolvedArray(
              snakeName: 'Foo',
              pointer: pointer200,
              description: 'Foo',
              items: ResolvedInteger(
                pointer: pointer200,
                snakeName: 'Foo',
                description: 'Foo',
              ),
            ),
          ),
        ),
      );
    });
    test('ResolvedEnum equality', () {
      final schema1 = ResolvedEnum(
        snakeName: 'Foo',
        pointer: JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        ),
        description: 'Foo',
        values: const ['bar', 'baz'],
        defaultValue: null,
      );
      final schema2 = ResolvedEnum(
        snakeName: 'Foo',
        pointer: JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        ),
        description: 'Foo',
        values: const ['bar', 'qux'],
        defaultValue: null,
      );
      expect(schema1, equals(schema1));
      // Different values.
      expect(schema1, isNot(equals(schema2)));
    });
    test('ResolvedAnyOf equality', () {
      final pointer200 = JsonPointer.parse(
        '#/paths//users/get/responses/200/content/application/json/schema',
      );
      final schema1 = ResolvedAnyOf(
        snakeName: 'Foo',
        pointer: pointer200,
        description: 'Foo',
        schemas: [
          ResolvedPod(
            type: PodType.string,
            pointer: pointer200,
            snakeName: 'Foo',
            description: 'Foo',
          ),
        ],
      );
      final schema2 = ResolvedAnyOf(
        snakeName: 'Foo',
        pointer: pointer200,
        description: 'Foo',
        schemas: [
          ResolvedPod(
            type: PodType.string,
            pointer: pointer200,
            snakeName: 'Foo',
            description: 'Foo',
          ),
        ],
      );
      expect(schema1, equals(schema1));
      // Same schemas.
      expect(schema1, equals(schema2));
    });
  });
}
