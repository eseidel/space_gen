import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/spec.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('determinePodType', () {
    test('fromJson', () {
      final logger = _MockLogger();
      PodType? parse(String type, {bool expectLogs = false, String? format}) {
        reset(logger);
        final json = {'type': type, 'format': format};
        // Only wrap with logger if we expect logs, that way it will fail if
        // we do log but don't expect it.
        if (expectLogs) {
          return runWithLogger(
            logger,
            () => determinePodType(MapContext.initial(json)),
          );
        }
        return determinePodType(MapContext.initial(json));
      }

      expect(parse('string'), PodType.string);
      expect(parse('string', format: 'binary'), isNull);
      expect(parse('string', format: 'date-time'), PodType.dateTime);
      expect(parse('string', format: 'foo', expectLogs: true), PodType.string);
      verify(() => logger.warn('Unknown string format: foo in #/')).called(1);
      expect(parse('number'), PodType.number);
      expect(parse('integer'), PodType.integer);
      expect(parse('boolean'), PodType.boolean);
      expect(parse('array'), isNull);
      expect(parse('object'), isNull);
      expect(
        () => parse('unknown'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Unknown pod type: unknown in #/'),
          ),
        ),
      );
      expect(
        () => parse('invalid'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Unknown pod type: invalid in #/'),
          ),
        ),
      );
    });
  });

  group('parser', () {
    OpenApi parseTestSpec(Map<String, dynamic> json) {
      return parseOpenApi(json);
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
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
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
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseTestSpec(specJson));
      expect(spec.serverUrl, Uri.parse('https://api.spacetraders.io/v2'));
      expect(spec.paths.keys.first, '/users');
    });

    test('parse with invalid enum', () {
      final json = {
        'NumberEnum': {
          // This is valid according to the spec, but we don't support it.
          'type': 'number',
          'enum': [1, 2, 3],
        },
      };
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseTestSchemas(json)),
        throwsA(
          isA<UnimplementedError>().having(
            (e) => e.message,
            'message',
            equals(
              'enumValues for type=number not supported in '
              'MapContext(#/components/schemas/NumberEnum, '
              '{type: number, enum: [1, 2, 3]})',
            ),
          ),
        ),
      );
    });
    test('enum values must match type', () {
      final json = {
        'Enum': {
          'type': 'string',
          'enum': ['foo', 1],
        },
      };
      final logger = _MockLogger();
      expect(
        () => runWithLogger(logger, () => parseTestSchemas(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'enumValues must be a list of strings: [foo, 1] '
              'in #/components/schemas/Enum',
            ),
          ),
        ),
      );
    });
    test('infer enum type', () {
      final json = {
        'Enum': {
          'enum': ['foo', 'bar', 'baz'],
        },
      };
      final logger = _MockLogger();
      final schemas = runWithLogger(logger, () => parseTestSchemas(json));
      expect(schemas['Enum'], isA<SchemaEnum>());
    });

    test('OpenApi equals', () {
      final jsonOne = {
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
                  'in': 'query',
                  'required': true,
                  'schema': {'type': 'string'},
                },
              ],
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {'type': 'object'},
                    },
                  },
                  'headers': {
                    'X-Foo': {
                      'description': 'Foo',
                      'schema': {'type': 'string'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Foo': {'type': 'object'},
            'Bar': {
              'anyOf': [
                {'type': 'boolean'},
                {'type': 'string'},
              ],
            },
            'Baz': {
              'allOf': [
                {'type': 'boolean'},
                {'type': 'string'},
              ],
            },
            'Qux': {
              'oneOf': [
                {'type': 'boolean'},
                {'type': 'string'},
              ],
            },
            'Map': {
              'type': 'object',
              'additionalProperties': {'type': 'string'},
            },
            'Enum': {
              'type': 'string',
              'enum': ['foo', 'bar', 'baz'],
            },
            'Array': {
              'type': 'array',
              'items': {'type': 'string'},
            },
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
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      final specOne = runWithLogger(logger, () => parseTestSpec(jsonOne));
      final specTwo = runWithLogger(logger, () => parseTestSpec(jsonOne));
      final specThree = runWithLogger(logger, () => parseTestSpec(jsonTwo));
      expect(specOne, specTwo);
      expect(specOne, isNot(specThree));
      expect(specOne.hashCode, specTwo.hashCode);
      expect(specOne.hashCode, isNot(specThree.hashCode));
    });

    test('allOf with multiple items', () {
      final json = {
        'User': {
          'allOf': [
            {'type': 'boolean'},
            {'type': 'string'},
          ],
        },
      };
      final logger = _MockLogger();
      final schemas = runWithLogger(logger, () => parseTestSchemas(json));
      expect(schemas['User'], isA<SchemaAllOf>());
    });

    test('oneOf not supported', () {
      final json = {
        'User': {
          'oneOf': [
            {'type': 'boolean'},
          ],
        },
      };
      final logger = _MockLogger();
      final schemas = runWithLogger(logger, () => parseTestSchemas(json));
      expect(schemas['User'], isA<SchemaOneOf>());
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
      final logger = _MockLogger();
      final schemas = runWithLogger(logger, () => parseTestSchemas(json));
      final schema = schemas['User']! as SchemaObject;
      expect(schema, isA<SchemaObject>());
      expect(schema.properties['value']!.ref, '#/components/schemas/Value');

      // Just not as a direct alias/redirect
      final json2 = {
        'User': {r'$ref': '#/components/schemas/Value'},
        'Value': {'type': 'boolean'},
      };
      expect(
        () => runWithLogger(logger, () => parseTestSchemas(json2)),
        throwsA(
          isA<UnimplementedError>().having(
            (e) => e.message,
            'message',
            equals(
              r'$ref not supported in '
              'MapContext(#/components/schemas/User, '
              r'{$ref: #/components/schemas/Value})',
            ),
          ),
        ),
      );
    });

    test('components not supported keys', () {
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
                  'headers': {
                    'X-Foo': {r'$ref': '#/components/headers/X-Foo'},
                  },
                },
              },
            },
          },
        },
        'components': {
          'headers': {
            'X-Foo': {
              'description': 'Foo',
              'schema': {'type': 'string'},
            },
          },
        },
      };
      final spec = parseTestSpec(json);
      expect(spec.components.headers['X-Foo']!.schema, isA<SchemaRef>());
      final response =
          spec.paths['/users'].operations[Method.get]!.responses[200]!.object!;
      expect(response.headers, isNotNull);
      expect(response.headers?['X-Foo'], isA<RefOr<Header>>());
      expect(response.headers?['X-Foo']!.ref, '#/components/headers/X-Foo');
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
              'responses': {
                '200': {'description': 'OK'},
              },
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
              'responses': {
                '200': {'description': 'OK'},
              },
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

    test('content is not supported', () {
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
                  'in': 'query',
                  'content': {
                    'application/json': {
                      'schema': {'type': 'boolean'},
                    },
                  },
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
        () => runWithLogger(logger, () => parseTestSpec(json)),
        throwsA(
          isA<UnimplementedError>().having(
            (e) => e.message,
            'message',
            equals(
              "'content' not supported in "
              'MapContext(#/paths//users/get/parameters/0, {name: foo, '
              'in: query, content: {application/json: '
              '{schema: {type: boolean}}}})',
            ),
          ),
        ),
      );
    });

    test('warn on version below 3.0.0', () {
      final json = {
        'openapi': '2.9.9',
        'info': {'title': 'Space Traders API', 'version': '1.0.0.a.b.c'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };

      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseTestSpec(json));
      verify(
        () => logger.warn(
          '2.9.9 < 3.0.0, the lowest known supported version. in #/',
        ),
      ).called(1);
      expect(spec.version, Version.parse('2.9.9'));
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
              "'responses' is not of type Map<String, dynamic>: true in #/paths//users/get",
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
            equals('Path cannot be empty in #/paths/'),
          ),
        ),
      );
    });

    test('info is required', () {
      final json = {
        'openapi': '3.1.0',
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Key info is required in #/'),
          ),
        ),
      );
    });
    test('servers is required', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Key servers is required in #/'),
          ),
        ),
      );
    });

    test('path parameters must be required', () {
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
                  'schema': {'type': 'string'},
                  // required is missing and defaults to false.
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
        () => runWithLogger(logger, () => parseTestSpec(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Path parameters must be required in #/paths//users/get/parameters/0',
            ),
          ),
        ),
      );
    });

    test('only integers and default are supported as response codes', () {
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
                'barf': {'description': 'Barf'},
              },
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
            equals(
              'Invalid response code: barf in #/paths//users/get/responses',
            ),
          ),
        ),
      );
    });
    test('default response is not supported', () {
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
                'default': {'description': 'Default'},
                '201': {'description': 'Created'},
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseTestSpec(json));
      expect(
        spec.paths['/users'].operations[Method.get]!.responses[200],
        isNull,
      );
    });

    test('responses are required', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'responses': <String, dynamic>{}},
          },
        },
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Responses are required in #/paths//users/get'),
          ),
        ),
      );
    });

    test('request body with empty content is not supported', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'post': {
              'summary': 'Post user',
              'responses': {
                '200': {'description': 'OK'},
              },
              'requestBody': {'content': <String, dynamic>{}},
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
            equals('Empty content in #/paths//users/post/requestBody/content'),
          ),
        ),
      );
    });

    // This is a hack to make petstore work enough for now.
    test('default to first media type if no application/json', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'post': {
              'summary': 'Post user',
              'responses': {
                '200': {'description': 'OK'},
              },
              'requestBody': {
                'content': {
                  'application/xml': {
                    'schema': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
      };
      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseTestSpec(json));
      expect(
        spec
            .paths['/users']
            .operations[Method.post]!
            .requestBody
            ?.object
            ?.content,
        isNotNull,
      );
      expect(
        spec
            .paths['/users']
            .operations[Method.post]!
            .requestBody
            ?.object
            ?.content
            .keys
            .first,
        'application/xml',
      );
    });

    test('parameters can be refs', () {
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
                {r'$ref': '#/components/parameters/foo'},
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
        'components': {
          'parameters': {
            'foo': {
              'name': 'foo',
              'in': 'query',
              'schema': {'type': 'string'},
            },
          },
        },
      };
      final logger = _MockLogger();
      final spec = runWithLogger(logger, () => parseTestSpec(json));
      expect(spec.paths['/users'].operations[Method.get]!.parameters, [
        isA<RefOr<Parameter>>().having(
          (p) => p.ref,
          'ref',
          equals('#/components/parameters/foo'),
        ),
      ]);
    });

    test('ignores securitySchemes', () {
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
        'components': {
          'securitySchemes': {
            'foo': {'type': 'http'},
          },
        },
      };
      final logger = _MockLogger();
      runWithLogger(logger, () => parseTestSpec(json));
      verify(
        () => logger.warn('Ignoring securitySchemes in #/components'),
      ).called(1);
    });

    test('ref is not allowed everywhere', () {
      final json = {
        r'$ref': '#/components/schemas/User',
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
      };
      expect(
        () => parseTestSpec(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(r'$ref not expected in #/'),
          ),
        ),
      );
    });
    test('response can be ref', () {
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
                '200': {r'$ref': '#/components/responses/User'},
              },
            },
          },
        },
        'components': {
          'responses': {
            'User': {'description': 'User'},
          },
        },
      };
      final spec = parseTestSpec(json);
      expect(
        spec.paths['/users'].operations[Method.get]!.responses[200]!.ref,
        equals('#/components/responses/User'),
      );
    });
    test('empty links are ignored', () {
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
        'components': {
          'links': <String, dynamic>{},
          'callbacks': <String, dynamic>{},
        },
      };
      final logger = _MockLogger();
      runWithLogger(logger, () => parseTestSpec(json));
      verify(
        () => logger.detail(
          'Ignoring key: links (Map<String, dynamic>) in #/components',
        ),
      ).called(1);
      verify(
        () => logger.detail(
          'Ignoring key: callbacks (Map<String, dynamic>) in #/components',
        ),
      ).called(1);
    });
    test('additionalProperties=true is treated as unknown', () {
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
                      'schema': {
                        'type': 'object',
                        'additionalProperties': true,
                      },
                    },
                  },
                },
              },
            },
          },
        },
      };
      final spec = parseTestSpec(json);
      final schema = spec
          .paths['/users']
          .operations[Method.get]!
          .responses[200]!
          .object!
          .content!['application/json']!
          .schema
          .object!;
      expect(schema, isA<SchemaMap>());
      final map = schema as SchemaMap;
      expect(map.valueSchema.object, isA<SchemaUnknown>());
    });
    test('additionalProperties must be a boolean or a map', () {
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
                      'schema': {
                        'type': 'object',
                        'additionalProperties': 'foo',
                      },
                    },
                  },
                },
              },
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
            equals(
              'additionalProperties must be a boolean or a map in #/paths//users/get/responses/200/content/application/json/schema',
            ),
          ),
        ),
      );
    });
    test('operationId with camelCase names', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'operationId': 'findPetsByStatus',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final spec = parseTestSpec(json);
      expect(
        spec.paths['/users'].operations[Method.get]!.snakeName,
        equals('find_pets_by_status'),
      );
    });

    group('enums', () {
      test('ignore boolean enums', () {
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
                        'schema': {
                          'type': 'boolean',
                          'enum': [true],
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        };
        final logger = _MockLogger();
        final spec = runWithLogger(logger, () => parseTestSpec(json));
        expect(
          spec
              .paths['/users']
              .operations[Method.get]!
              .responses[200]!
              .object!
              .content!['application/json']!
              .schema
              .object,
          isA<SchemaPod>().having(
            (s) => s.type,
            'type',
            equals(PodType.boolean),
          ),
        );
        verify(
          () => logger.detail(
            'Ignoring key: type (String) in '
            '#/paths//users/get/responses/200/content/application/json/schema',
          ),
        ).called(1);
      });

      test('defaultValue for enum is valid value when converted to string', () {
        final json = {
          'make_latest': {
            'type': 'string',
            'enum': ['true', 'false', 'legacy'],
            'default': true,
          },
        };
        final logger = _MockLogger();
        final schemas = runWithLogger(logger, () => parseTestSchemas(json));
        expect(
          schemas['make_latest'],
          isA<SchemaEnum>().having(
            (e) => e.defaultValue,
            'defaultValue',
            equals('true'),
          ),
        );
      });

      test('null is valid for nullable enum', () {
        final json = {
          'conclusion': {
            'type': 'string',
            'enum': ['success', 'failure', null],
            'nullable': true,
          },
        };
        final logger = _MockLogger();
        final schemas = runWithLogger(logger, () => parseTestSchemas(json));
        expect(
          schemas['conclusion'],
          isA<SchemaEnum>().having(
            (e) => e.enumValues,
            'enumValues',
            equals(['success', 'failure']),
          ),
        );
      });

      test('defaultValue must be a valid enum value', () {
        final json = {
          'conclusion': {
            'type': 'string',
            'enum': ['success', 'failure'],
            'default': 'neutral',
          },
        };
        expect(
          () => parseTestSchemas(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals(
                'defaultValue must be one of the enum values: neutral in #/components/schemas/conclusion',
              ),
            ),
          ),
        );
      });
    });

    test('tags must be a list of strings', () {
      final json = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'tags': [1, 2],
              'responses': {
                '200': {'description': 'OK'},
              },
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
            equals(
              "'tags' is not a list of String: [1, 2] in #/paths//users/get",
            ),
          ),
        ),
      );
    });
  });

  group('ParseContext', () {
    test('MapContext.childAsMap throws on missing child', () {
      final context = MapContext.initial({
        'foo': {'bar': 'baz'},
      });
      expect(context.pointer, const JsonPointer.fromParts([]));
      expect(context.childAsMap('foo'), isA<MapContext>());
      expect(
        () => context.childAsList('foo'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals("'foo' is not of type List<dynamic>: {bar: baz} in #/"),
          ),
        ),
      );
      expect(
        () => context.childAsMap('bar'),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            equals('Key not found: bar in #/'),
          ),
        ),
      );
    });

    test('MapContext.childAsList throws on missing child', () {
      final context = MapContext.initial({
        'foo': ['bar'],
      });
      expect(context.pointer, const JsonPointer.fromParts([]));
      expect(context.childAsList('foo'), isA<ListContext>());
      expect(
        () => context.childAsMap('foo'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals("'foo' is not of type Map<String, dynamic>: [bar] in #/"),
          ),
        ),
      );
      expect(
        () => context.childAsMap('bar'),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            equals('Key not found: bar in #/'),
          ),
        ),
      );
    });

    test('ListContext.indexAsMap throws on missing child', () {
      final context = ListContext(
        pointerParts: const ['root'],
        snakeNameStack: const [],
        json: [
          {'foo': 'bar'},
          'baz',
        ],
      );
      expect(context.pointer, const JsonPointer.fromParts(['root']));
      expect(context.indexAsMap(0), isA<MapContext>());
      expect(
        () => context.indexAsMap(1),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Index 1 is not of type Map<String, dynamic>: baz in #/root',
            ),
          ),
        ),
      );
      expect(
        () => context.indexAsMap(2),
        throwsA(
          isA<RangeError>().having(
            (e) => e.message,
            'message',
            equals('Invalid value'),
          ),
        ),
      );
    });
  });

  group('JsonPointer', () {
    test('equality', () {
      const pointerOne = JsonPointer.fromParts(['foo', 'bar']);
      const pointerTwo = JsonPointer.fromParts(['foo', 'bar']);
      const pointerThree = JsonPointer.fromParts(['foo', 'baz']);
      expect(pointerOne, pointerTwo);
      expect(pointerOne.hashCode, pointerTwo.hashCode);
      expect(pointerOne, isNot(pointerThree));
      expect(pointerOne.hashCode, isNot(pointerThree.hashCode));
    });
  });
}
