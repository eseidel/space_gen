import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart' show StatusCodeRange;
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('resolver', () {
    ResolvedSpec parseAndResolveTestSpec(
      Map<String, dynamic> json, {
      bool logSchemas = false,
    }) {
      final spec = parseOpenApi(json);
      final specUrl = Uri.parse('file:///spec.yaml');
      return resolveSpec(spec, specUrl: specUrl, logSchemas: logSchemas);
    }

    ResolvedSchema parseAndResolveTestSchema(
      Map<String, dynamic> schemaJson, {
      bool logSchemas = false,
    }) {
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
      final spec = parseAndResolveTestSpec(specJson, logSchemas: logSchemas);
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
      expect(
        () => parseAndResolveTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Path parameters must be strings or integers in #/paths/~1users/get/parameters/0',
            ),
          ),
        ),
      );
    });

    test('path parameters can be pod types (uuid/date/date-time/etc)', () {
      // Repro for the watchcrunch spec: a `/resource/{id}` path where `id` is
      // declared as `type: string, format: uuid`. Previously this crashed
      // the resolver ("Path parameters must be strings or integers") because
      // pod types aren't `ResolvedString`.
      Map<String, dynamic> specWithPodPathParam(String format) => {
        'openapi': '3.1.0',
        'info': {'title': 'T', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/things/{id}': {
            'get': {
              'summary': 'Get thing',
              'parameters': [
                {
                  'name': 'id',
                  'in': 'path',
                  'required': true,
                  'schema': {'type': 'string', 'format': format},
                },
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };

      for (final format in [
        'uuid',
        'date',
        'date-time',
        'email',
        'uri',
        'uri-template',
      ]) {
        final spec = parseAndResolveTestSpec(specWithPodPathParam(format));
        final param = spec.paths.first.operations.first.parameters.first;
        expect(
          param.schema,
          isA<ResolvedPod>(),
          reason: 'format: $format should resolve to a ResolvedPod',
        );
      }
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
      final spec = parseAndResolveTestSpec(json);
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
      final spec = parseAndResolveTestSpec(json);
      expect(
        spec.paths.first.operations.first.parameters.first.schema,
        isA<ResolvedEnum>().having(
          (e) => e.values,
          'values',
          equals(['bar', 'baz']),
        ),
      );
    });

    test('path-item-level parameters apply to every operation', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users/{id}': {
            'parameters': [
              {
                'name': 'id',
                'in': 'path',
                'schema': {'type': 'string'},
                'required': true,
              },
            ],
            'get': {
              'operationId': 'getUser',
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
            'delete': {
              'operationId': 'deleteUser',
              'summary': 'Delete user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final spec = parseAndResolveTestSpec(json);
      final operations = spec.paths.first.operations;
      expect(operations, hasLength(2));
      for (final op in operations) {
        expect(op.parameters, hasLength(1));
        expect(op.parameters.first.name, 'id');
        expect(op.parameters.first.inLocation, ParameterLocation.path);
      }
    });

    test('operation parameter overrides path-item parameter with same '
        '(name, in)', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users/{id}': {
            'parameters': [
              {
                'name': 'id',
                'in': 'path',
                'description': 'shared id',
                'schema': {'type': 'string'},
                'required': true,
              },
            ],
            'get': {
              'summary': 'Get user',
              'parameters': [
                {
                  'name': 'id',
                  'in': 'path',
                  'description': 'get-specific id',
                  'schema': {'type': 'integer'},
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
      final spec = parseAndResolveTestSpec(json);
      final params = spec.paths.first.operations.first.parameters;
      expect(params, hasLength(1));
      expect(params.first.description, 'get-specific id');
      expect(params.first.schema, isA<ResolvedInteger>());
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
              'ResolvedString(snakeName: users200_response_all_of_0, pointer: '
              '#/paths/~1users/get/responses/200/content/application~1json/schema/allOf/0) '
              'in #/paths/~1users/get/responses/200/content/application~1json/schema',
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

      final spec = parseAndResolveTestSpec(json);
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
    test('omitting items is the same as an empty object for type=array', () {
      final json = {'type': 'array'};
      final logger = _MockLogger();
      final schema = runWithLogger(
        logger,
        () => parseAndResolveTestSchema(json),
      );
      expect(
        schema,
        isA<ResolvedArray>().having(
          (e) => e.items,
          'items',
          isA<ResolvedUnknown>(),
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
              "'items' is not of type Map<String, dynamic>: true in "
              '#/paths/~1users/get/responses/200/content/application~1json/schema',
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
      expect(
        () => parseAndResolveTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Schema not found: file:///spec.yaml#/components/schemas/Missing',
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
            contains('Expected Schema, got RequestBody'),
          ),
        ),
      );
      verify(
        () => logger.detail(
          'Unused: type=object in #/components/requestBodies/RequestBody',
        ),
      ).called(1);
    });

    test('security scheme not found', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
        'security': [
          {
            'apiKey': ['scope1', 'scope2'],
          },
        ],
      };
      expect(
        () => parseAndResolveTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('Security scheme not found with name "apiKey"'),
          ),
        ),
      );
    });

    test('operation security overrides global security', () {
      // Three operations with distinct security states, under a spec that
      // declares a global apiKey requirement.
      //   - /inherit: no `security` key -> must inherit the global apiKey.
      //   - /override: non-empty `security` -> must use what it specifies.
      //   - /public: `security: []` -> must override global to no auth.
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'security': [
          {'apiKey': <String>[]},
        ],
        'paths': {
          '/inherit': {
            'get': {
              'operationId': 'getInherit',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
          '/override': {
            'get': {
              'operationId': 'getOverride',
              'security': [
                {'bearer': <String>[]},
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
          '/public': {
            'get': {
              'operationId': 'getPublic',
              'security': <Map<String, List<String>>>[],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
        'components': {
          'securitySchemes': {
            'apiKey': {'type': 'apiKey', 'name': 'apiKey', 'in': 'header'},
            'bearer': {'type': 'http', 'scheme': 'bearer'},
          },
        },
      };
      final spec = parseAndResolveTestSpec(json);
      final operations = {
        for (final op in spec.paths.expand((p) => p.operations))
          op.snakeName: op,
      };

      // Inherits: one condition referencing the global apiKey scheme.
      final inherited = operations['get_inherit']!.securityRequirements;
      expect(inherited, hasLength(1));
      expect(
        inherited.single.conditions.keys.single.name,
        'apiKey',
      );

      // Override: one condition referencing bearer (not apiKey).
      final overridden = operations['get_override']!.securityRequirements;
      expect(overridden, hasLength(1));
      expect(
        overridden.single.conditions.keys.single.name,
        'bearer',
      );

      // Public: empty list, meaning no auth (overrides global apiKey).
      // Before the nullable-securityRequirements fix, this incorrectly fell
      // back to the global requirement.
      expect(operations['get_public']!.securityRequirements, isEmpty);
    });

    test('recursion', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Node'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Node': {
              'type': 'object',
              'properties': {
                'left': {r'$ref': '#/components/schemas/Node'},
                'right': {r'$ref': '#/components/schemas/Node'},
              },
            },
          },
        },
      };
      // Recursive type references are valid and should be allowed.
      // Node resolves inline as a ResolvedObject; its `left`/`right` are
      // ResolvedRecursiveRef cycle-break markers pointing back to Node.
      final spec = parseAndResolveTestSpec(json);
      final content = spec.paths.first.operations.first.responses.first.content;
      expect(
        content,
        isA<ResolvedObject>().having(
          (e) => e.snakeName,
          'snakeName',
          equals('node'),
        ),
      );
      final node = content as ResolvedObject;
      expect(node.properties.keys, equals(['left', 'right']));
      expect(node.properties['left'], isA<ResolvedRecursiveRef>());
      expect(node.properties['right'], isA<ResolvedRecursiveRef>());
      final left = node.properties['left']! as ResolvedRecursiveRef;
      expect(
        left.targetPointer.toString(),
        equals('#/components/schemas/Node'),
      );
    });

    test('NXX range responses are resolved', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Range', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/widgets': {
            'get': {
              'operationId': 'getWidget',
              'responses': {
                '2XX': {
                  'description': 'Success',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Widget'},
                    },
                  },
                },
                '5XX': {
                  'description': 'Server error',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Error'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Widget': {'type': 'object'},
            'Error': {'type': 'object'},
          },
        },
      };
      final spec = parseAndResolveTestSpec(json);
      final op = spec.paths.first.operations.first;
      expect(op.rangeResponses, hasLength(2));
      final byRange = {for (final r in op.rangeResponses) r.range: r};
      expect(
        byRange[StatusCodeRange.success],
        isA<ResolvedRangeResponse>().having(
          (r) => r.description,
          'description',
          'Success',
        ),
      );
      expect(
        byRange[StatusCodeRange.serverError],
        isA<ResolvedRangeResponse>().having(
          (r) => r.description,
          'description',
          'Server error',
        ),
      );
    });

    test('default response is resolved and referenced schema is emitted', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Default', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/widgets': {
            'get': {
              'operationId': 'getWidget',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Widget'},
                    },
                  },
                },
                'default': {
                  'description': 'Error',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Error'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Widget': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
            },
            'Error': {
              'type': 'object',
              'properties': {
                'message': {'type': 'string'},
              },
            },
          },
        },
      };
      final spec = parseAndResolveTestSpec(json);
      final op = spec.paths.first.operations.first;
      final defaultResponse = op.defaultResponse;
      expect(defaultResponse, isNotNull);
      expect(defaultResponse!.description, 'Error');
      expect(defaultResponse.content, isA<ResolvedObject>());
    });

    test('mutual recursion: A -> b: B -> a: A', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Mutual', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/root': {
            'get': {
              'operationId': 'getRoot',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Foo'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Foo': {
              'type': 'object',
              'properties': {
                'bar': {r'$ref': '#/components/schemas/Bar'},
              },
            },
            'Bar': {
              'type': 'object',
              'properties': {
                'foo': {r'$ref': '#/components/schemas/Foo'},
              },
            },
          },
        },
      };
      // Foo resolves inline; its `bar` is Bar inline; Bar's `foo` is a
      // ResolvedRecursiveRef back to Foo (cycle break). Resolution terminates.
      final spec = parseAndResolveTestSpec(json);
      final foo = spec.paths.first.operations.first.responses.first.content;
      expect(foo, isA<ResolvedObject>());
      final bar = (foo as ResolvedObject).properties['bar'];
      expect(bar, isA<ResolvedObject>());
      final fooRef = (bar! as ResolvedObject).properties['foo'];
      expect(fooRef, isA<ResolvedRecursiveRef>());
      expect(
        (fooRef! as ResolvedRecursiveRef).targetPointer.toString(),
        equals('#/components/schemas/Foo'),
      );
    });

    group('request body content type selection', () {
      Map<String, dynamic> specWith(Map<String, dynamic> content) => {
        'openapi': '3.1.0',
        'info': {'title': 'T', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/u': {
            'post': {
              'responses': {
                '200': {'description': 'OK'},
              },
              'requestBody': {'content': content},
            },
          },
        },
      };

      test('JSON wins when both JSON and multipart are offered', () {
        final spec = parseAndResolveTestSpec(
          specWith({
            'application/json': {
              'schema': {'type': 'string'},
            },
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'properties': {
                  'file': {'type': 'string', 'format': 'binary'},
                },
              },
            },
          }),
        );
        final body = spec.paths.first.operations.first.requestBody!;
        expect(body.mimeType, MimeType.applicationJson);
      });

      test('multipart is selected when it is the only offered type', () {
        final spec = parseAndResolveTestSpec(
          specWith({
            'multipart/form-data': {
              'schema': {
                'type': 'object',
                'properties': {
                  'file': {'type': 'string', 'format': 'binary'},
                },
              },
            },
          }),
        );
        final body = spec.paths.first.operations.first.requestBody!;
        expect(body.mimeType, MimeType.multipartFormData);
      });

      test(
        'unsupported content type errors with all supported types listed',
        () {
          expect(
            () => parseAndResolveTestSpec(
              specWith({
                'application/xml': {
                  'schema': {'type': 'string'},
                },
              }),
            ),
            throwsA(
              isA<FormatException>().having(
                (e) => e.message,
                'message',
                allOf(
                  contains('application/json'),
                  contains('multipart/form-data'),
                  contains('application/octet-stream'),
                  contains('text/plain'),
                ),
              ),
            ),
          );
        },
      );
    });
  });

  group('ResolvedSchema', () {
    group('equality', () {
      test('RenderObject', () {
        final schema1 = ResolvedObject(
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          properties: const {},
          additionalProperties: null,
          requiredProperties: const [],
        );
        final schema2 = ResolvedObject(
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/201/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          properties: const {},
          additionalProperties: null,
          requiredProperties: const [],
        );
        expect(schema1, equals(schema1));
        // Different pointer.
        expect(schema1, isNot(equals(schema2)));
      });
      test('RenderArray', () {
        final pointer200 = JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        );
        final pointer201 = JsonPointer.parse(
          '#/paths//users/get/responses/201/content/application/json/schema',
        );
        final schema1 = ResolvedArray(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: pointer200,
            description: 'Foo',
          ),
          items: ResolvedPod(
            createsNewType: false,
            common: CommonProperties.test(
              snakeName: 'Foo',
              pointer: pointer200,
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
        );
        final schema2 = ResolvedArray(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: pointer201,
            description: 'Foo',
          ),
          items: ResolvedPod(
            createsNewType: false,
            common: CommonProperties.test(
              snakeName: 'Foo',
              pointer: pointer200,
              description: 'Foo',
            ),
            type: PodType.boolean,
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
                createsNewType: false,
                common: CommonProperties.test(
                  snakeName: 'Foo',
                  pointer: pointer200,
                  description: 'Foo',
                ),
                items: ResolvedInteger(
                  createsNewType: false,
                  common: CommonProperties.test(
                    snakeName: 'Foo',
                    pointer: pointer200,
                    description: 'Foo',
                  ),
                ),
              ),
            ),
          ),
        );
      });
      test('RenderString', () {
        final schema1 = ResolvedString(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          defaultValue: 'foo',
          maxLength: 10,
          minLength: 1,
        );
        final schema2 = ResolvedString(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          defaultValue: 'foo',
        );
        expect(schema1, equals(schema1));
        // Different values.
        expect(schema1, isNot(equals(schema2)));
      });

      test('ResolvedEnum', () {
        final schema1 = ResolvedEnum(
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          values: const ['bar', 'baz'],
          defaultValue: null,
          descriptions: null,
        );
        final schema2 = ResolvedEnum(
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          values: const ['bar', 'qux'],
          defaultValue: null,
          descriptions: null,
        );
        expect(schema1, equals(schema1));
        // Different values.
        expect(schema1, isNot(equals(schema2)));
      });
      test('ResolvedAnyOf', () {
        final pointer200 = JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        );
        final schema1 = ResolvedAnyOf(
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: pointer200,
            description: 'Foo',
          ),
          schemas: [
            ResolvedPod(
              createsNewType: false,
              common: CommonProperties.test(
                snakeName: 'Foo',
                pointer: pointer200,
                description: 'Foo',
              ),
              type: PodType.boolean,
            ),
          ],
        );
        final schema2 = ResolvedAnyOf(
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: pointer200,
            description: 'Foo',
          ),
          schemas: [
            ResolvedPod(
              createsNewType: false,
              common: CommonProperties.test(
                snakeName: 'Foo',
                pointer: pointer200,
                description: 'Foo',
              ),
              type: PodType.boolean,
            ),
          ],
        );
        expect(schema1, equals(schema1));
        // Same schemas.
        expect(schema1, equals(schema2));
      });
      test('ResolvedNumber', () {
        final schema1 = ResolvedNumber(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
        );
        // Same schema.
        expect(schema1, equals(schema1));
        final schema2 = ResolvedNumber(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          maximum: 10,
        );
        // Different schema.
        expect(schema1, isNot(equals(schema2)));
      });
      test('ResolvedInteger', () {
        final schema1 = ResolvedInteger(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
        );
        // Same schema.
        expect(schema1, equals(schema1));
        final schema2 = ResolvedInteger(
          createsNewType: false,
          common: CommonProperties.test(
            snakeName: 'Foo',
            pointer: JsonPointer.parse(
              '#/paths//users/get/responses/200/content/application/json/schema',
            ),
            description: 'Foo',
          ),
          maximum: 10,
        );
        // Different schema.
        expect(schema1, isNot(equals(schema2)));
      });
    });

    group('copyWith', () {
      final beforeCommon = CommonProperties.test(
        snakeName: 'Foo',
        pointer: JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        ),
        description: 'Foo',
      );
      final afterCommon = CommonProperties.test(
        snakeName: 'Bar',
        pointer: JsonPointer.parse(
          '#/paths//users/get/responses/200/content/application/json/schema',
        ),
        description: 'Bar',
      );
      void testCopyWith<T extends ResolvedSchema>(
        T schema, [
        void Function(T, T)? checkProperties,
      ]) {
        final copy = schema.copyWith(common: afterCommon) as T;
        expect(copy, isNot(equals(schema)));
        expect(copy.common, equals(afterCommon));
        if (checkProperties != null) {
          checkProperties(schema, copy);
        }
        final noChange = schema.copyWith();
        expect(noChange, equals(schema));
      }

      test('ResolvedObject', () {
        final schema = ResolvedObject(
          common: beforeCommon,
          properties: const {},
          additionalProperties: null,
          requiredProperties: const [],
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.properties, equals(schema.properties));
          expect(
            copy.additionalProperties,
            equals(schema.additionalProperties),
          );
          expect(copy.requiredProperties, equals(schema.requiredProperties));
        });
      });
      test('ResolvedEnum', () {
        final schema = ResolvedEnum(
          common: beforeCommon,
          values: const ['bar', 'baz'],
          defaultValue: null,
          descriptions: null,
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.values, equals(schema.values));
          expect(copy.defaultValue, equals(schema.defaultValue));
        });
      });
      test('ResolvedAnyOf', () {
        final schema = ResolvedAnyOf(
          common: beforeCommon,
          schemas: [
            ResolvedPod(
              createsNewType: false,
              common: beforeCommon,
              type: PodType.boolean,
            ),
          ],
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.schemas, equals(schema.schemas));
        });
      });
      test('ResolvedAllOf', () {
        final schema = ResolvedAllOf(
          common: beforeCommon,
          schemas: [
            ResolvedPod(
              createsNewType: false,
              common: beforeCommon,
              type: PodType.boolean,
            ),
          ],
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.schemas, equals(schema.schemas));
        });
      });
      test('ResolvedOneOf', () {
        final schema = ResolvedOneOf(
          common: beforeCommon,
          schemas: [
            ResolvedPod(
              createsNewType: false,
              common: beforeCommon,
              type: PodType.boolean,
            ),
          ],
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.schemas, equals(schema.schemas));
        });
      });
      test('ResolvedArray', () {
        final schema = ResolvedArray(
          createsNewType: false,
          common: beforeCommon,
          items: ResolvedPod(
            createsNewType: false,
            common: beforeCommon,
            type: PodType.boolean,
          ),
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.items, equals(schema.items));
        });
      });
      test('ResolvedNumber', () {
        final schema = ResolvedNumber(
          createsNewType: false,
          common: beforeCommon,
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.maximum, equals(schema.maximum));
          expect(copy.minimum, equals(schema.minimum));
          expect(copy.multipleOf, equals(schema.multipleOf));
        });
      });
      test('ResolvedInteger', () {
        final schema = ResolvedInteger(
          createsNewType: false,
          common: beforeCommon,
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.maximum, equals(schema.maximum));
          expect(copy.minimum, equals(schema.minimum));
          expect(copy.multipleOf, equals(schema.multipleOf));
        });
      });
      test('ResolvedString', () {
        final schema = ResolvedString(
          createsNewType: false,
          common: beforeCommon,
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.defaultValue, equals(schema.defaultValue));
          expect(copy.maxLength, equals(schema.maxLength));
          expect(copy.minLength, equals(schema.minLength));
        });
      });
      test('ResolvedPod', () {
        final schema = ResolvedPod(
          createsNewType: false,
          common: beforeCommon,
          type: PodType.boolean,
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.type, equals(schema.type));
        });
      });
      test('ResolvedMap', () {
        final schema = ResolvedMap(
          createsNewType: false,
          common: beforeCommon,
          valueSchema: ResolvedPod(
            createsNewType: false,
            common: beforeCommon,
            type: PodType.boolean,
          ),
          keySchema: null,
        );
        testCopyWith(schema, (schema, copy) {
          expect(copy.valueSchema, equals(schema.valueSchema));
        });
      });
      test('ResolvedBinary', () {
        final schema = ResolvedBinary(
          createsNewType: false,
          common: beforeCommon,
        );
        testCopyWith(schema);
      });
      test('ResolvedUnknown', () {
        testCopyWith(
          ResolvedUnknown(createsNewType: false, common: beforeCommon),
        );
      });
      test('ResolvedNull', () {
        testCopyWith(ResolvedNull(common: beforeCommon));
      });
      test('ResolvedVoid', () {
        testCopyWith(ResolvedVoid(common: beforeCommon));
      });
      test('ResolvedEmptyObject', () {
        testCopyWith(ResolvedEmptyObject(common: beforeCommon));
      });
      test('ResolvedRecursiveRef', () {
        testCopyWith(
          ResolvedRecursiveRef(
            common: beforeCommon,
            targetPointer: JsonPointer.parse('#/components/schemas/Node'),
          ),
        );
      });
    });
  });
}
