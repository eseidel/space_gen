import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parser.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('parseTypeAndFormat', () {
    test('single types', () {
      final logger = _MockLogger();
      PodType? parse(String type, {bool expectLogs = false, String? format}) {
        reset(logger);
        final json = {'type': type, 'format': ?format};
        // Only wrap with logger if we expect logs, that way it will fail if
        // we do log but don't expect it.
        TypeAndFormat? typeAndFormat;
        if (expectLogs) {
          typeAndFormat = runWithLogger(
            logger,
            () => parseTypeAndFormat(MapContext.initial(json)),
          );
        } else {
          typeAndFormat = parseTypeAndFormat(MapContext.initial(json));
        }
        return typeAndFormat?.podType;
      }

      expect(parse('string'), isNull);
      expect(parse('string', format: 'binary'), isNull);
      expect(parse('string', format: 'date-time'), PodType.dateTime);
      expect(parse('string', format: 'uri'), PodType.uri);
      expect(parse('string', format: 'uri-template'), PodType.uriTemplate);
      expect(parse('string', format: 'email'), PodType.email);
      expect(parse('string', format: 'uuid'), PodType.uuid);
      expect(parse('string', format: 'date'), PodType.date);
      // 'time' is accepted (no warning) but has no Dart equivalent, so
      // it falls through to SchemaString.
      expect(parse('string', format: 'time'), isNull);
      expect(parse('string', format: 'foo', expectLogs: true), isNull);
      // Unknown formats are detail-logged (the generator falls back to
      // the plain base type, which is correct for the vast majority of
      // non-standard format names ship in real specs).
      verify(
        () => logger.detail('Ignoring unknown string format: foo in #/'),
      ).called(1);
      expect(parse('number'), isNull);
      expect(parse('integer'), isNull);
      expect(parse('boolean'), PodType.boolean);
      expect(parse('array'), isNull);
      expect(parse('object'), isNull);
      expect(
        () => parse('unknown'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Unknown type: unknown in #/'),
          ),
        ),
      );
      expect(
        () => parse('invalid'),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Unknown type: invalid in #/'),
          ),
        ),
      );
    });
    test('array types', () {
      final logger = _MockLogger();
      TypeAndFormat parse(
        List<dynamic> types, {
        bool expectLogs = false,
        String? format,
      }) {
        reset(logger);
        final json = {'type': types, 'format': ?format};
        // Only wrap with logger if we expect logs, that way it will fail if
        // we do log but don't expect it.
        TypeAndFormat typeAndFormat;
        if (expectLogs) {
          typeAndFormat = runWithLogger(
            logger,
            () => parseTypeAndFormat(MapContext.initial(json)),
          );
        } else {
          typeAndFormat = parseTypeAndFormat(MapContext.initial(json));
        }
        return typeAndFormat;
      }

      expect(parse(['string']).type, 'string');
      final ignoresDuplicates = parse(['string', 'string']);
      expect(ignoresDuplicates.type, 'string');
      final nullableString = parse(['string', 'null']);
      expect(nullableString.type, 'string');
      expect(nullableString.isNullable, true);
      final nullableDateTime = parse(['null', 'string'], format: 'date-time');
      expect(nullableDateTime.type, 'string');
      expect(nullableDateTime.podType, PodType.dateTime);
      expect(nullableDateTime.isNullable, true);
      final multipleTypes = parse(['string', 'number']);
      expect(multipleTypes.type, isNull);
      expect(multipleTypes.types, ['string', 'number']);
      expect(multipleTypes.isNullable, false);
      final multipleTypesWithNull = parse(['string', 'null', 'number']);
      expect(multipleTypesWithNull.type, isNull);
      expect(multipleTypesWithNull.types, ['string', 'number']);
      expect(multipleTypesWithNull.isNullable, true);

      expect(
        () => parse([1, 'number']),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('type array must contain only strings: [1, number] in #/'),
          ),
        ),
      );
      expect(
        () => parse([null, 'number']),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'type array must contain only strings: [null, number] in #/',
            ),
          ),
        ),
      );
    });
    test('invalid type', () {
      final json = {'type': 1};
      expect(
        () => parseTypeAndFormat(MapContext.initial(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('type must be a string or array: 1 in #/'),
          ),
        ),
      );
    });
  });

  group('Schema equality', () {
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
      final specOne = runWithLogger(logger, () => parseOpenApi(jsonOne));
      final specTwo = runWithLogger(logger, () => parseOpenApi(jsonOne));
      final specThree = runWithLogger(logger, () => parseOpenApi(jsonTwo));
      expect(specOne, specTwo);
      expect(specOne, isNot(specThree));
      expect(specOne.hashCode, specTwo.hashCode);
      expect(specOne.hashCode, isNot(specThree.hashCode));
    });
  });

  group('parser', () {
    Map<String, SchemaRef> parseTestSchemas(Map<String, dynamic> schemasJson) {
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
      final spec = parseOpenApi(specJson);
      return spec.components.schemas;
    }

    Schema parseTestSchema(Map<String, dynamic> schemaJson) {
      final schemas = parseTestSchemas({'Test': schemaJson});
      expect(schemas.length, 1);
      return schemas['Test']!.object!;
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
      final spec = runWithLogger(logger, () => parseOpenApi(specJson));
      expect(spec.serverUrl, Uri.parse('https://api.spacetraders.io/v2'));
      expect(spec.paths.keys.first, '/users');
    });
    test('allOf with multiple items', () {
      final json = {
        'allOf': [
          {'type': 'boolean'},
          {'type': 'string'},
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaAllOf>());
    });

    test('oneOf with one item', () {
      final json = {
        'oneOf': [
          {'type': 'boolean'},
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaOneOf>());
    });

    test('oneOf with discriminator + mapping', () {
      final json = {
        'oneOf': [
          {r'$ref': '#/components/schemas/Cat'},
          {r'$ref': '#/components/schemas/Dog'},
        ],
        'discriminator': {
          'propertyName': 'pet_type',
          'mapping': {
            'cat': '#/components/schemas/Cat',
            // Bare-name form is normalized to a full ref.
            'dog': 'Dog',
          },
        },
      };
      final schemas = parseTestSchemas({
        'Test': json,
        'Cat': {'type': 'object'},
        'Dog': {'type': 'object'},
      });
      final object = schemas['Test']?.object;
      if (object is! SchemaOneOf) {
        fail('Expected SchemaOneOf, got ${object.runtimeType}');
      }
      final discriminator = object.discriminator;
      if (discriminator == null) fail('discriminator unexpectedly null');
      expect(discriminator.propertyName, 'pet_type');
      final mapping = discriminator.mapping;
      if (mapping == null) fail('mapping unexpectedly null');
      expect(
        mapping['cat']?.ref?.uri,
        Uri.parse('#/components/schemas/Cat'),
      );
      expect(
        mapping['dog']?.ref?.uri,
        Uri.parse('#/components/schemas/Dog'),
      );
    });

    test('oneOf without discriminator', () {
      final json = {
        'oneOf': [
          {'type': 'string'},
          {'type': 'integer'},
        ],
      };
      final oneOf = parseTestSchema(json) as SchemaOneOf;
      expect(oneOf.discriminator, isNull);
    });

    test('object with required-only oneOf constraint parses as object', () {
      // Github's `pulls/request-reviewers` request body shape: a
      // single object with two optional list properties, plus an
      // anyOf saying "exactly one of `reviewers` or `team_reviewers`
      // must be present". The constraint is a runtime-only thing
      // (clients enforce it; servers should send valid responses) —
      // the right Dart shape is the object, not a polymorphic wrapper.
      final json = {
        'type': 'object',
        'properties': {
          'reviewers': {
            'type': 'array',
            'items': {'type': 'string'},
          },
          'team_reviewers': {
            'type': 'array',
            'items': {'type': 'string'},
          },
        },
        'anyOf': [
          {
            'required': ['reviewers'],
          },
          {
            'required': ['team_reviewers'],
          },
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaObject>());
      final obj = schema as SchemaObject;
      expect(obj.properties.keys, ['reviewers', 'team_reviewers']);
    });

    test('oneOf with required-only constraint variants is also an object', () {
      // Same shape as the anyOf case above, with `oneOf` instead of
      // `anyOf` — the github `code-scanning/create-variant-analysis`
      // request body. Either constraint kind drops out at parse time.
      final json = {
        'type': 'object',
        'properties': {
          'a': {'type': 'string'},
          'b': {'type': 'string'},
          'c': {'type': 'string'},
        },
        'required': ['a'],
        'oneOf': [
          {
            'required': ['b'],
          },
          {
            'required': ['c'],
          },
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaObject>());
      final obj = schema as SchemaObject;
      expect(obj.properties.keys, ['a', 'b', 'c']);
      expect(obj.requiredProperties, ['a']);
    });

    test('oneOf with a real polymorphic variant stays a oneOf', () {
      // A oneOf where any variant brings its own shape (here, a
      // `type: string` variant) is a real polymorphic schema — the
      // constraint-only short-circuit must not fire. The
      // `required: [x]` sibling has no other keys and triggers
      // `_warnUnused` during normal parse, which needs a logger
      // scope.
      final json = {
        'type': 'object',
        'properties': {
          'x': {'type': 'string'},
        },
        'oneOf': [
          {'type': 'string'},
          {
            'required': ['x'],
          },
        ],
      };
      final logger = _MockLogger();
      final schema = runWithLogger(logger, () => parseTestSchema(json));
      expect(schema, isA<SchemaOneOf>());
    });

    group('spec-author quirks', () {
      // These specs are technically valid OpenAPI but place a key
      // somewhere the parser's chosen schema shape can't act on it.
      // We don't enforce the constraint anyway. Vendor extensions
      // (`x-*`) are silently dropped per the OpenAPI spec; everything
      // else is detail-logged so the verbose-log mining workflow can
      // surface the misplacement.

      test('vendor extensions (x-*) flow through Unused: at -v', () {
        // Per OpenAPI 3.x, `x-` prefixed keys are vendor extensions:
        // generators that don't recognize them ignore them ("don't
        // fail"), but they still surface in the unused tally at -v
        // so the verbose-log mining workflow can spot extensions
        // worth adding support for. We already act on
        // `x-enum-descriptions`; future candidates include
        // `x-enum-varnames` and `x-internal`.
        final json = {
          'type': 'string',
          'x-github': {'foo': 'bar'},
          'x-multi-segment': true,
        };
        final logger = _MockLogger();
        final schema = runWithLogger(logger, () => parseTestSchema(json));
        expect(schema, isA<SchemaString>());
        verify(
          () => logger.detail(any(that: contains('Unused: x-github'))),
        ).called(1);
        verifyNever(() => logger.warn(any()));
      });

      test('required on an array property is detail-logged', () {
        // github's `dependency-graph-spdx-sbom.sbom.{packages,
        // relationships}` put `required: [...]` on an array schema.
        // `required` is an object-level keyword; on an array it does
        // nothing. Detail-log so a curious `-v` reader can find it.
        final json = {
          'type': 'array',
          'items': {'type': 'string'},
          'required': ['name'],
        };
        final logger = _MockLogger();
        final schema = runWithLogger(logger, () => parseTestSchema(json));
        expect(schema, isA<SchemaArray>());
        verify(
          () => logger.detail(any(that: contains('Ignoring: required'))),
        ).called(1);
      });

      test('maxProperties on an object/map is detail-logged', () {
        // github's `metadata` and `dispatches.inputs` set
        // `maxProperties: N`. We don't validate object size.
        final json = {
          'type': 'object',
          'maxProperties': 10,
          'additionalProperties': true,
        };
        final logger = _MockLogger();
        final schema = runWithLogger(logger, () => parseTestSchema(json));
        expect(schema, isA<SchemaMap>());
        verify(
          () => logger.detail(
            any(that: contains('Ignoring: maxProperties=10')),
          ),
        ).called(1);
      });

      test('minItems inside an items schema is detail-logged', () {
        // github's `webhook-meta-deleted.hook.events.items` has
        // `minItems: 1` on the string-enum items schema. `minItems`
        // belongs on the parent array; on the items schema it does
        // nothing.
        final json = {
          'type': 'array',
          'items': {
            'type': 'string',
            'enum': ['a', 'b'],
            'minItems': 1,
          },
        };
        final logger = _MockLogger();
        final schema = runWithLogger(logger, () => parseTestSchema(json));
        expect(schema, isA<SchemaArray>());
        verify(
          () => logger.detail(any(that: contains('Ignoring: minItems=1'))),
        ).called(1);
      });

      test(
        'additionalProperties: true on a non-object is detail-logged',
        () {
          // github's `hook-delivery.response.payload` sets
          // `additionalProperties: true` on a `type: [string, null]`
          // schema. The flag is meaningless on a string.
          final json = {
            'type': ['string', 'null'],
            'additionalProperties': true,
          };
          final logger = _MockLogger();
          final schema = runWithLogger(logger, () => parseTestSchema(json));
          // type: [string, null] becomes a nullable string.
          expect(schema, isA<SchemaString>());
          verify(
            () => logger.detail(
              any(that: contains('Ignoring: additionalProperties=true')),
            ),
          ).called(1);
        },
      );

      test('top-level webhooks and externalDocs are consumed', () {
        // OpenAPI 3.1 top-level sections we don't generate from.
        final json = {
          'openapi': '3.1.0',
          'info': {'title': 'x', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://example.com'},
          ],
          'paths': {
            '/x': {
              'get': {
                'responses': {
                  '200': {'description': 'OK'},
                },
              },
            },
          },
          'webhooks': {
            'foo': {
              'post': {
                'responses': {
                  '200': {'description': 'OK'},
                },
              },
            },
          },
          'externalDocs': {'url': 'https://example.com/docs'},
        };
        final logger = _MockLogger();
        final spec = runWithLogger(logger, () => parseOpenApi(json));
        expect(spec.serverUrl, Uri.parse('https://example.com'));
        // We don't surface as `Unused: webhooks, externalDocs` — they
        // are explicitly `_ignored` (visible at -v as `Ignoring:`).
        verifyNever(
          () => logger.detail(any(that: contains('Unused'))),
        );
      });

      test(
        'required entries that name no real property are dropped + warned',
        () {
          // github's `package-version-metadata-docker` schema lists
          // `required: [tags]` for a property called `tag` (no s).
          // Honoring the typo would generate a class whose constructor
          // demands a non-existent field. Drop the unknown name from
          // [SchemaObject.requiredProperties] and warn so the spec
          // author can fix the typo.
          final json = {
            'type': 'object',
            'properties': {
              'tag': {'type': 'string'},
            },
            'required': ['tags', 'tag'],
          };
          final logger = _MockLogger();
          final schema = runWithLogger(logger, () => parseTestSchema(json));
          if (schema is! SchemaObject) {
            fail('Expected SchemaObject, got ${schema.runtimeType}');
          }
          // `tag` survives, `tags` is dropped.
          expect(schema.requiredProperties, ['tag']);
          verify(
            () => logger.warn(
              any(that: contains("'required' lists 'tags'")),
            ),
          ).called(1);
        },
      );
    });

    test(
      'oneOf with sibling properties merges parent fields into '
      'each variant',
      () {
        // github `repos/{owner}/{repo}/check-runs` POST shape: the
        // parent declares the full set of fields and the oneOf
        // variants only refine `status` (and conditionally require
        // `conclusion`). Each merged variant needs the parent's
        // `properties` and `required` so the typed surface isn't
        // missing `name`/`head_sha`/etc.
        final json = {
          'type': 'object',
          'required': ['name', 'head_sha'],
          'properties': {
            'name': {'type': 'string'},
            'head_sha': {'type': 'string'},
            'status': {
              'type': 'string',
              'enum': ['queued', 'completed'],
            },
            'conclusion': {
              'type': 'string',
              'enum': ['success', 'failure'],
            },
          },
          'discriminator': {'propertyName': 'status'},
          'oneOf': [
            {
              'properties': {
                'status': {
                  'enum': ['completed'],
                },
              },
              'required': ['status', 'conclusion'],
              'additionalProperties': true,
            },
            {
              'properties': {
                'status': {
                  'enum': ['queued'],
                },
              },
              'additionalProperties': true,
            },
          ],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaOneOf>());
        final oneOf = schema as SchemaOneOf;
        expect(oneOf.schemas, hasLength(2));
        // Discriminator preserved.
        expect(oneOf.discriminator?.propertyName, 'status');

        final variant0 = oneOf.schemas[0].object! as SchemaObject;
        expect(
          variant0.properties.keys,
          containsAll(<String>['name', 'head_sha', 'status', 'conclusion']),
        );
        // Parent + variant required, deduped, parent first.
        expect(variant0.requiredProperties, [
          'name',
          'head_sha',
          'status',
          'conclusion',
        ]);

        final variant1 = oneOf.schemas[1].object! as SchemaObject;
        expect(
          variant1.properties.keys,
          containsAll(<String>['name', 'head_sha', 'status']),
        );
        // Variant 1 only inherits the parent's required set.
        expect(variant1.requiredProperties, ['name', 'head_sha']);
      },
    );

    test(
      'anyOf with sibling properties also merges parent fields into '
      'each variant',
      () {
        // github `repos/{owner}/{repo}/check-runs/{check_run_id}`
        // PATCH shape: `anyOf` instead of `oneOf`, no
        // `discriminator`, but otherwise same parent+refinement
        // pattern as the POST.
        final json = {
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
            'status': {
              'type': 'string',
              'enum': ['queued', 'completed'],
            },
            'conclusion': {
              'type': 'string',
              'enum': ['success', 'failure'],
            },
          },
          'anyOf': [
            {
              'properties': {
                'status': {
                  'enum': ['completed'],
                },
              },
              'required': ['conclusion'],
              'additionalProperties': true,
            },
            {
              'properties': {
                'status': {
                  'enum': ['queued'],
                },
              },
              'additionalProperties': true,
            },
          ],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaAnyOf>());
        final anyOf = schema as SchemaAnyOf;
        expect(anyOf.schemas, hasLength(2));

        final variant0 = anyOf.schemas[0].object! as SchemaObject;
        expect(
          variant0.properties.keys,
          containsAll(<String>['name', 'status', 'conclusion']),
        );
        expect(variant0.requiredProperties, ['conclusion']);

        final variant1 = anyOf.schemas[1].object! as SchemaObject;
        expect(
          variant1.properties.keys,
          containsAll(<String>['name', 'status']),
        );
        expect(variant1.requiredProperties, isEmpty);
      },
    );

    test(
      r'oneOf with a $ref variant does not merge — refs may live in '
      'another schema and are not resolvable at parse time',
      () {
        // A real polymorphic oneOf where one variant is a ref. The
        // merge-into-variants pass leaves this alone (returns null)
        // and the caller falls back to today's behavior.
        final json = {
          'type': 'object',
          'properties': {
            'x': {'type': 'string'},
          },
          'oneOf': [
            {r'$ref': '#/components/schemas/Other'},
          ],
        };
        final logger = _MockLogger();
        final schema = runWithLogger(
          logger,
          () => parseTestSchemas({
            'Test': json,
            'Other': {'type': 'object'},
          }),
        );
        expect(schema['Test']!.object, isA<SchemaOneOf>());
        final oneOf = schema['Test']!.object! as SchemaOneOf;
        // The $ref variant survives unchanged — no merge happened.
        expect(oneOf.schemas.first.ref, isNotNull);
      },
    );

    test('merge bails when a variant declares a non-object type', () {
      // A variant with `type: string` is a real alternative type, not
      // a refinement of the parent object. Fall through to today's
      // behavior — the variants get parsed individually and the
      // parent's properties end up dropped (visible at -v as
      // `Unused: properties`).
      final json = {
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
        },
        'oneOf': [
          {'type': 'string'},
          {
            'properties': {
              'name': {'type': 'string'},
            },
          },
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaOneOf>());
      final oneOf = schema as SchemaOneOf;
      // Variant 0 stays a string (no merge happened).
      expect(oneOf.schemas[0].object, isA<SchemaString>());
    });

    test('merge bails when a variant declares its own oneOf', () {
      // Real polymorphism inside polymorphism — merging would lose
      // the inner branch structure. Fall through.
      final json = {
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
        },
        'oneOf': [
          {
            'oneOf': [
              {'type': 'object'},
            ],
          },
        ],
      };
      final schema = parseTestSchema(json);
      // The inner oneOf survives — variant 0 is itself a oneOf.
      expect(schema, isA<SchemaOneOf>());
      final outer = schema as SchemaOneOf;
      expect(outer.schemas[0].object, isA<SchemaOneOf>());
    });

    test('merge bails when a variant has neither properties nor required', () {
      // An empty variant `{}` carries no refinement — falling through
      // to today's behavior surfaces it in the verbose log instead of
      // silently producing a duplicate of the parent.
      final json = {
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
        },
        'oneOf': [
          <String, dynamic>{},
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaOneOf>());
      final oneOf = schema as SchemaOneOf;
      // Variant 0 has no properties of its own — empty object.
      final variant0 = oneOf.schemas[0].object;
      expect(
        variant0,
        anyOf(isA<SchemaEmptyObject>(), isA<SchemaUnknown>()),
      );
    });

    test(
      'merge carries the parent `additionalProperties` onto each variant',
      () {
        // When the parent declares `additionalProperties`, every
        // merged variant should inherit it (variants can still
        // override). This locks in the parent's schema's open-or-
        // closed shape across the dispatch.
        final json = {
          'type': 'object',
          'additionalProperties': true,
          'properties': {
            'name': {'type': 'string'},
          },
          'oneOf': [
            {
              'properties': {
                'name': {'type': 'string'},
              },
            },
            {
              'properties': {
                'name': {'type': 'string'},
              },
            },
          ],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaOneOf>());
        final oneOf = schema as SchemaOneOf;
        // Both variants got the parent's additionalProperties (the
        // SchemaObject's `additionalProperties` field is non-null).
        for (final ref in oneOf.schemas) {
          final variant = ref.object! as SchemaObject;
          expect(variant.additionalProperties, isNotNull);
        }
      },
    );

    test('merge bails when the parent has no `properties` map', () {
      // Without parent properties to overlay, there's nothing to
      // merge — the oneOf is a normal polymorphic union.
      final json = {
        'type': 'object',
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'a': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'properties': {
              'b': {'type': 'integer'},
            },
          },
        ],
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaOneOf>());
      final oneOf = schema as SchemaOneOf;
      // Variants get their own properties only; no parent-merged
      // fields would have been added.
      final variant0 = oneOf.schemas[0].object! as SchemaObject;
      expect(variant0.properties.keys, ['a']);
    });

    test('anyOf with explicit discriminator + mapping survives parsing', () {
      // OpenAPI permits `discriminator` on `anyOf`, not just `oneOf`.
      // The parser plumbs it through `SchemaAnyOf.discriminator` so
      // downstream stages (resolver, dispatch picker) can use it the
      // same way as on a oneOf.
      final json = {
        'anyOf': [
          {
            'type': 'object',
            'properties': {
              'kind': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'properties': {
              'kind': {'type': 'string'},
            },
          },
        ],
        'discriminator': {
          'propertyName': 'kind',
          'mapping': {
            'cat': '#/components/schemas/Cat',
            'dog': '#/components/schemas/Dog',
          },
        },
      };
      final schema = parseTestSchema(json);
      expect(schema, isA<SchemaAnyOf>());
      final anyOf = schema as SchemaAnyOf;
      expect(anyOf.discriminator, isNotNull);
      expect(anyOf.discriminator!.propertyName, 'kind');
      expect(anyOf.discriminator!.mapping, isNotNull);
      expect(anyOf.discriminator!.mapping!.length, 2);
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
      final schema = schemas['User']!.object! as SchemaObject;
      expect(schema, isA<SchemaObject>());
      expect(
        schema.properties['value']!.ref!.uri,
        Uri.parse('#/components/schemas/Value'),
      );

      // Even at the top level of a component (often used for referencing
      // external schemas)
      final json2 = {
        'User': {r'$ref': '#/components/schemas/Value'},
        'Value': {'type': 'boolean'},
      };
      final schemas2 = parseTestSchemas(json2);
      expect(
        schemas2['User']!.ref!.uri,
        Uri.parse('#/components/schemas/Value'),
      );
      expect(schemas2['Value']!.object, isA<SchemaPod>());
      final pod = schemas2['Value']!.object! as SchemaPod;
      expect(pod.type, PodType.boolean);
      expect(pod.defaultValue, isNull);
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
      final spec = parseOpenApi(json);
      expect(
        spec.components.headers['X-Foo']!.object!.schema,
        isA<SchemaRef>(),
      );
      final response =
          spec.paths['/users'].operations[Method.get]!.responses[200]!.object!;
      expect(response.headers, isNotNull);
      expect(response.headers?['X-Foo'], isA<RefOr<Header>>());
      expect(
        response.headers?['X-Foo']!.ref!.uri,
        Uri.parse('#/components/headers/X-Foo'),
      );
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
        () => parseOpenApi(json),
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
        () => parseOpenApi(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('schema or content'),
          ),
        ),
      );
    });

    test('parameter with unknown location', () {
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
                {'name': 'foo', 'in': 'unknown'},
              ],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      expect(() => parseOpenApi(json), throwsA(isA<FormatException>()));
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
        () => runWithLogger(logger, () => parseOpenApi(json)),
        throwsA(
          isA<UnimplementedError>().having(
            (e) => e.message,
            'message',
            equals(
              "'content' not supported in "
              'MapContext(#/paths/~1users/get/parameters/0, {name: foo, '
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
      final spec = runWithLogger(logger, () => parseOpenApi(json));
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
        () => parseOpenApi(json),
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
        () => parseOpenApi(json),
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
        () => parseOpenApi(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Key servers is required in #/'),
          ),
        ),
      );
    });

    test('path-item-level parameters are parsed', () {
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
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final spec = parseOpenApi(json);
      final pathItem = spec.paths['/users/{id}'];
      expect(pathItem.parameters, hasLength(1));
      final parameter = pathItem.parameters.first.object!;
      expect(parameter.name, 'id');
      expect(parameter.inLocation, ParameterLocation.path);
      expect(parameter.isRequired, isTrue);
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
        () => runWithLogger(logger, () => parseOpenApi(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Path parameters must be required in #/paths/~1users/get/parameters/0',
            ),
          ),
        ),
      );
    });

    group('parameter serialization', () {
      Map<String, dynamic> specWithQueryParam(Map<String, dynamic> extra) {
        return {
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
                    'schema': {'type': 'string'},
                    ...extra,
                  },
                ],
                'responses': {
                  '200': {'description': 'OK'},
                },
              },
            },
          },
        };
      }

      Map<String, dynamic> specWithHeader(Map<String, dynamic> extra) {
        return {
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
                    'headers': {
                      'X-Foo': {
                        'schema': {'type': 'string'},
                        ...extra,
                      },
                    },
                  },
                },
              },
            },
          },
        };
      }

      test('default style and explode on query are silent', () {
        final logger = _MockLogger();
        runWithLogger(
          logger,
          () => parseOpenApi(
            specWithQueryParam({'style': 'form', 'explode': true}),
          ),
        );
        verifyNever(() => logger.warn(any()));
      });

      test('non-default explode on query warns', () {
        final logger = _MockLogger();
        runWithLogger(
          logger,
          () => parseOpenApi(specWithQueryParam({'explode': false})),
        );
        verify(
          () => logger.warn(
            'explode=false is not honored on query parameters; '
            'generator emits the default (explode=true) wire format '
            'in #/paths/~1users/get/parameters/0',
          ),
        ).called(1);
      });

      test('non-default style on query warns', () {
        final logger = _MockLogger();
        runWithLogger(
          logger,
          () => parseOpenApi(specWithQueryParam({'style': 'spaceDelimited'})),
        );
        verify(
          () => logger.warn(
            'style="spaceDelimited" is not honored on query parameters; '
            'generator emits the default (form) wire format '
            'in #/paths/~1users/get/parameters/0',
          ),
        ).called(1);
      });

      test('non-default explode on header warns', () {
        final logger = _MockLogger();
        runWithLogger(
          logger,
          () => parseOpenApi(specWithHeader({'explode': true})),
        );
        verify(
          () => logger.warn(
            'explode=true is not honored on header parameters; '
            'generator emits the default (explode=false) wire format '
            'in #/paths/~1users/get/responses/200/headers/X-Foo',
          ),
        ).called(1);
      });

      test('parameter `example` is captured and `examples` map flattened', () {
        // OpenAPI 3.x lets a parameter declare `example: <scalar>` *or*
        // `examples: { name: { value: <scalar> } }` (the second form is
        // a map of full Example objects). Both should land on the
        // parsed Parameter so render can surface them in the endpoint
        // doc comment instead of dropping them as `Ignoring: example`.
        final logger = _MockLogger();
        final spec = runWithLogger(
          logger,
          () => parseOpenApi(
            specWithQueryParam({
              'example': 'foo',
              'examples': {
                'first': {'value': 'one', 'summary': 'first example'},
                'second': {'value': 'two'},
              },
            }),
          ),
        );
        final operation = spec.paths['/users'].operations[Method.get];
        if (operation == null) fail('expected /users get operation');
        final parameter = operation.parameters.single.object;
        if (parameter == null) fail('expected inline parameter');
        expect(parameter.example, 'foo');
        expect(parameter.examples, ['one', 'two']);
        verifyNever(() => logger.warn(any()));
      });

      test(
        'header `example` and `examples` map are captured (silent — headers '
        'do not yet flow to render but the parser must not warn)',
        () {
          final logger = _MockLogger();
          runWithLogger(
            logger,
            () => parseOpenApi(
              specWithHeader({
                'example': 'https://example.com/x',
                'examples': {
                  'redirect': {'value': 'https://example.com/y'},
                },
              }),
            ),
          );
          verifyNever(() => logger.warn(any()));
        },
      );

      test('allowReserved=true on query warns', () {
        final logger = _MockLogger();
        runWithLogger(
          logger,
          () => parseOpenApi(specWithQueryParam({'allowReserved': true})),
        );
        verify(
          () => logger.warn(
            'allowReserved=true is not honored on query parameters; '
            'generator URL-encodes reserved characters '
            'in #/paths/~1users/get/parameters/0',
          ),
        ).called(1);
      });
    });

    group('responses', () {
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
          () => parseOpenApi(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals(
                "'responses' is not of type Map<String, dynamic>: true in #/paths/~1users/get",
              ),
            ),
          ),
        );
      });
      test('integers, NXX ranges, and default are supported response keys', () {
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
          () => parseOpenApi(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals(
                'Invalid response code: barf in #/paths/~1users/get/responses',
              ),
            ),
          ),
        );
      });
      test('NXX range responses are parsed', () {
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
                  '2XX': {'description': 'Success'},
                  '4XX': {'description': 'Client error'},
                  '5XX': {'description': 'Server error'},
                },
              },
            },
          },
        };
        final spec = parseOpenApi(json);
        final responses =
            spec.paths['/users'].operations[Method.get]!.responses;
        expect(responses[200], isNotNull);
        expect(
          responses.rangeResponses.keys,
          containsAll([
            StatusCodeRange.success,
            StatusCodeRange.clientError,
            StatusCodeRange.serverError,
          ]),
        );
        final byRange = responses.rangeResponses;
        expect(
          byRange[StatusCodeRange.success]!.object!.description,
          'Success',
        );
        expect(
          byRange[StatusCodeRange.clientError]!.object!.description,
          'Client error',
        );
        expect(
          byRange[StatusCodeRange.serverError]!.object!.description,
          'Server error',
        );
      });

      test('default response is parsed', () {
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
        final spec = parseOpenApi(json);
        final responses =
            spec.paths['/users'].operations[Method.get]!.responses;
        expect(responses[201], isNotNull);
        expect(responses.defaultResponse, isNotNull);
        expect(responses.defaultResponse!.object!.description, 'Default');
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
          () => parseOpenApi(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals('Responses are required in #/paths/~1users/get'),
            ),
          ),
        );
      });
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
        () => parseOpenApi(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals('Empty content in #/paths/~1users/post/requestBody/content'),
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
      final spec = runWithLogger(logger, () => parseOpenApi(json));
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

    test('errors on missing bearer scheme', () {
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
      expect(
        () => runWithLogger(logger, () => parseOpenApi(json)),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              'Key scheme is required in #/components/securitySchemes/foo',
            ),
          ),
        ),
      );
    });

    group('refs', () {
      test('ref is not allowed everywhere', () {
        final json = {
          r'$ref': '#/components/schemas/User',
          'openapi': '3.1.0',
          'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        };
        expect(
          () => parseOpenApi(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals(r'$ref not expected in #/'),
            ),
          ),
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
        final spec = runWithLogger(logger, () => parseOpenApi(json));
        expect(spec.paths['/users'].operations[Method.get]!.parameters, [
          isA<RefOr<Parameter>>().having(
            (p) => p.ref!.uri,
            'ref',
            equals(Uri.parse('#/components/parameters/foo')),
          ),
        ]);
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
        final spec = parseOpenApi(json);
        expect(
          spec.paths['/users'].operations[Method.get]!.responses[200]!.ref!.uri,
          equals(Uri.parse('#/components/responses/User')),
        );
      });
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
      runWithLogger(logger, () => parseOpenApi(json));
      verify(
        () => logger.detail(
          'Ignoring: links={} (Map<String, dynamic>) in #/components',
        ),
      ).called(1);
      verify(
        () => logger.detail(
          'Ignoring: callbacks={} (Map<String, dynamic>) in #/components',
        ),
      ).called(1);
    });

    group('additionalProperties', () {
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
        final spec = parseOpenApi(json);
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
          () => parseOpenApi(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals(
                'additionalProperties must be a boolean or a map in '
                '#/paths/~1users/get/responses/200/content/application~1json/schema',
              ),
            ),
          ),
        );
      });
    });

    group('operationId', () {
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
        final spec = parseOpenApi(json);
        expect(
          spec.paths['/users'].operations[Method.get]!.snakeName,
          equals('find_pets_by_status'),
        );
      });

      test('operationId with / in name', () {
        final json = {
          'openapi': '3.1.0',
          'info': {'title': 'Space Traders API', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://api.spacetraders.io/v2'},
          ],
          'paths': {
            '/users/foo/bar': {
              'get': {
                'operationId': 'users/foo/bar',
                'responses': {
                  '200': {'description': 'OK'},
                },
              },
            },
          },
        };
        final spec = parseOpenApi(json);
        expect(
          spec.paths['/users/foo/bar'].operations[Method.get]!.snakeName,
          equals('users_foo_bar'),
        );
      });
    });

    group('enums', () {
      test('parse with invalid enum', () {
        final json = {
          // This is valid according to the spec, but we don't support it.
          'type': 'number',
          'enum': [1, 2, 3],
        };
        expect(
          () => parseTestSchema(json),
          throwsA(
            isA<UnimplementedError>().having(
              (e) => e.message,
              'message',
              contains('enumValues for type=number not supported'),
            ),
          ),
        );
      });
      test('enum values must match type', () {
        final json = {
          'type': 'string',
          'enum': ['foo', 1],
        };
        expect(
          () => parseTestSchema(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              contains('enumValues must be a list of strings: [foo, 1]'),
            ),
          ),
        );
      });
      test('infer enum type', () {
        final json = {
          'enum': ['foo', 'bar', 'baz'],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaEnum>());
      });
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
        final spec = runWithLogger(logger, () => parseOpenApi(json));
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
            'Ignoring: type=boolean (String) in '
            '#/paths/~1users/get/responses/200/content/application~1json/schema',
          ),
        ).called(1);
      });

      test('defaultValue for enum is valid value when converted to string', () {
        final json = {
          'type': 'string',
          'enum': ['true', 'false', 'legacy'],
          'default': true,
        };
        final schema = parseTestSchema(json);
        expect(
          schema,
          isA<SchemaEnum>().having(
            (e) => e.defaultValue,
            'defaultValue',
            equals('true'),
          ),
        );
      });

      test('null is valid for nullable enum', () {
        final json = {
          'type': 'string',
          'enum': ['success', 'failure', null],
          'nullable': true,
        };
        final schema = parseTestSchema(json);
        expect(
          schema,
          isA<SchemaEnum>().having(
            (e) => e.enumValues,
            'enumValues',
            equals(['success', 'failure']),
          ),
        );
      });

      test('defaultValue must be a valid enum value', () {
        final json = {
          'type': 'string',
          'enum': ['success', 'failure'],
          'default': 'neutral',
        };
        expect(
          () => parseTestSchema(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              contains('defaultValue must be one of the enum values: neutral'),
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
        () => parseOpenApi(json),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            equals(
              "'tags' is not a list of String: [1, 2] in #/paths/~1users/get",
            ),
          ),
        ),
      );
    });

    test('kebab names in components', () {
      final json = {
        'foo-bar': {'type': 'string'},
      };
      final spec = parseTestSchemas(json);
      expect(spec['foo-bar']!.object, isA<SchemaString>());
      expect(
        spec['foo-bar']!.pointer,
        const JsonPointer.fromParts(['components', 'schemas', 'foo-bar']),
      );
      expect(spec['foo-bar']!.object!.snakeName, equals('foo_bar'));
    });

    group('nullable', () {
      test('string', () {
        final json = {'type': 'string', 'nullable': true};
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaString>());
        expect(schema.common.nullable, isTrue);
      });
      test('string or null', () {
        final json = {
          'type': ['string', 'null'],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaString>());
        expect(schema.common.nullable, isTrue);
      });
    });

    group('multiple types', () {
      test('string or number', () {
        final json = {
          'type': ['string', 'number'],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaOneOf>());
        final oneOf = schema as SchemaOneOf;
        expect(oneOf.schemas.length, 2);
        expect(oneOf.schemas[0].object, isA<SchemaString>());
        expect(oneOf.schemas[1].object, isA<SchemaNumber>());
        expect(oneOf.common.nullable, isFalse);
      });
      test('string or number or null', () {
        final json = {
          'type': ['string', 'number', 'null'],
        };
        final schema = parseTestSchema(json);
        expect(schema, isA<SchemaOneOf>());
        final oneOf = schema as SchemaOneOf;
        expect(oneOf.schemas.length, 2);
        expect(oneOf.schemas[0].object, isA<SchemaString>());
        expect(oneOf.schemas[1].object, isA<SchemaNumber>());
        expect(oneOf.common.nullable, isTrue);
      });

      test('explicit oneOf wins over multi-type', () {
        // Github writes both `type: [null, string, integer]` AND
        // `oneOf: [{string}, {integer with description}]` on the
        // same property. The explicit `oneOf` carries strictly more
        // info (the integer variant's description, formats, items)
        // and should win — otherwise it gets logged as `Unused:
        // oneOf` and dropped on the floor.
        final json = {
          'type': ['null', 'string', 'integer'],
          'oneOf': [
            {'type': 'string'},
            {'type': 'integer', 'description': 'milestone number'},
          ],
        };
        final schema = parseTestSchema(json);
        if (schema is! SchemaOneOf) {
          fail('Expected SchemaOneOf, got ${schema.runtimeType}');
        }
        expect(schema.schemas.length, 2);
        expect(schema.schemas[0].object, isA<SchemaString>());
        final intVariant = schema.schemas[1].object;
        if (intVariant is! SchemaInteger) {
          fail('Expected SchemaInteger, got ${intVariant.runtimeType}');
        }
        // Description from the explicit oneOf variant survives.
        expect(intVariant.common.description, 'milestone number');
        // The parent's `type: [null, ...]` still propagates the
        // nullable bit through `common`.
        expect(schema.common.nullable, isTrue);
      });

      test('explicit anyOf wins over multi-type', () {
        // Same gap as oneOf above; github uses `anyOf` in a few
        // property slots too (e.g. `metadata.additionalProperties`
        // in webhooks).
        final json = {
          'type': ['null', 'string', 'integer'],
          'anyOf': [
            {'type': 'string', 'format': 'date-time'},
            {'type': 'integer'},
          ],
        };
        final schema = parseTestSchema(json);
        if (schema is! SchemaAnyOf) {
          fail('Expected SchemaAnyOf, got ${schema.runtimeType}');
        }
        expect(schema.schemas.length, 2);
        // The string variant carries `format: date-time` from the
        // explicit anyOf, which the type-array expansion would drop.
        final strVariant = schema.schemas[0].object;
        if (strVariant is! SchemaPod) {
          fail('Expected SchemaPod, got ${strVariant.runtimeType}');
        }
        expect(strVariant.type, PodType.dateTime);
        expect(schema.common.nullable, isTrue);
      });

      test('property-slot oneOf without parallel type also parses', () {
        // The slot-coverage check: schemas with only `oneOf` (no
        // `type:` array sibling) keep working as before — this case
        // already worked, we just want a regression guard.
        final json = {
          'type': 'object',
          'properties': {
            'value': {
              'oneOf': [
                {'type': 'string'},
                {'type': 'integer'},
              ],
            },
          },
        };
        final schema = parseTestSchema(json);
        if (schema is! SchemaObject) {
          fail('Expected SchemaObject, got ${schema.runtimeType}');
        }
        expect(schema.properties['value']?.object, isA<SchemaOneOf>());
      });

      test('property-slot oneOf with parallel type', () {
        // End-to-end shape mirroring github's `issues.post.milestone`
        // — oneOf at a property slot with the redundant multi-type
        // sibling. The property's schema is parsed as an explicit
        // oneOf, not a type-array-derived synthetic one.
        final json = {
          'type': 'object',
          'properties': {
            'milestone': {
              'type': ['null', 'string', 'integer'],
              'oneOf': [
                {'type': 'string'},
                {'type': 'integer'},
              ],
            },
          },
        };
        final schema = parseTestSchema(json);
        if (schema is! SchemaObject) {
          fail('Expected SchemaObject, got ${schema.runtimeType}');
        }
        final milestone = schema.properties['milestone']?.object;
        if (milestone is! SchemaOneOf) {
          fail('Expected SchemaOneOf, got ${milestone.runtimeType}');
        }
        expect(milestone.schemas.length, 2);
        expect(milestone.common.nullable, isTrue);
      });
    });

    group('security requirements', () {
      test('parse', () {
        final json = {
          'openapi': '3.1.0',
          'info': {'title': 'Space Traders API', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://api.spacetraders.io/v2'},
          ],
          'security': [
            {
              'apiKey': ['scope1', 'scope2'],
            },
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
              'apiKey': {'type': 'apiKey', 'name': 'apiKey', 'in': 'header'},
            },
          },
        };
        final spec = parseOpenApi(json);
        expect(spec.securityRequirements.length, 1);
        expect(
          spec.securityRequirements[0],
          equals(
            SecurityRequirement(
              conditions: const {
                'apiKey': ['scope1', 'scope2'],
              },
              pointer: JsonPointer.parse('#/security/0'),
            ),
          ),
        );
        expect(spec.components.securitySchemes.length, 1);
        expect(
          spec.components.securitySchemes[0],
          equals(
            ApiKeySecurityScheme(
              pointer: JsonPointer.parse('#/components/securitySchemes/apiKey'),
              name: 'apiKey',
              description: null,
              keyName: 'apiKey',
              inLocation: ApiKeyLocation.header,
            ),
          ),
        );
      });
      test('scopes/roles must be list', () {
        final json = {'foo': 'bar'};
        expect(
          () => parseSecurityRequirement(MapContext.initial(json)),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              equals("'foo' is not a list of String: bar in #/"),
            ),
          ),
        );
      });

      test('scopes/roles cannot be null', () {
        final json = {'foo': null};
        expect(
          () => parseSecurityRequirement(MapContext.initial(json)),
          throwsA(isA<FormatException>()),
        );
      });
    });
    group('security scheme', () {
      test('cookie not supported', () {
        final json = {'type': 'apiKey', 'name': 'apiKey', 'in': 'cookie'};
        expect(
          () => parseSecurityScheme('name', MapContext.initial(json)),
          throwsA(isA<UnimplementedError>()),
        );
      });
      test('unknown location', () {
        final json = {'type': 'apiKey', 'name': 'apiKey', 'in': 'unknown'};
        expect(
          () => parseSecurityScheme('name', MapContext.initial(json)),
          throwsA(isA<FormatException>()),
        );
      });
      test('oauth2 parses as bearer pass-through', () {
        // oauth2 schemes deliver an opaque bearer token at the wire
        // level, so we generate the same `HttpAuth(scheme: 'bearer', …)`
        // plumbing as a `http` + `bearer` scheme. Token acquisition (the
        // OAuth2 grants, refresh) stays the caller's responsibility.
        final json = {
          'type': 'oauth2',
          'flows': {
            'implicit': {
              'authorizationUrl': 'https://example.com/auth',
              'scopes': <String, String>{},
            },
          },
        };
        final scheme = runWithLogger(
          Logger(),
          () => parseSecurityScheme('name', MapContext.initial(json)),
        );
        expect(scheme, isA<HttpSecurityScheme>());
        expect((scheme as HttpSecurityScheme).scheme, 'bearer');
        expect(scheme.bearerFormat, isNull);
      });
      test('mutualTLS declaration accepted as UnsupportedSecurityScheme', () {
        final json = {'type': 'mutualTLS'};
        final scheme = runWithLogger(
          Logger(),
          () => parseSecurityScheme('name', MapContext.initial(json)),
        );
        expect(scheme, isA<UnsupportedSecurityScheme>());
        expect((scheme as UnsupportedSecurityScheme).type, 'mutualTLS');
      });
      test('openIdConnect parses as bearer pass-through', () {
        // OpenAPI 3.0 specs in the wild ship both 'openIdConnect' (as the
        // spec technically prescribes in some versions) and 'openIDConnect'
        // (widely deployed). Accept both, treating each as bearer
        // pass-through — at the wire level OIDC lands on a bearer token.
        for (final spelling in ['openIdConnect', 'openIDConnect']) {
          final json = {
            'type': spelling,
            'openIdConnectUrl': 'https://example.com/.well-known',
          };
          final scheme = runWithLogger(
            Logger(),
            () => parseSecurityScheme('name', MapContext.initial(json)),
          );
          expect(
            scheme,
            isA<HttpSecurityScheme>(),
            reason: 'should accept type=$spelling',
          );
          expect((scheme as HttpSecurityScheme).scheme, 'bearer');
        }
      });
      test('unknown type', () {
        final json = {'type': 'unknown'};
        expect(
          () => parseSecurityScheme('name', MapContext.initial(json)),
          throwsA(isA<FormatException>()),
        );
      });
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
