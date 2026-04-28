import 'package:space_gen/src/naming.dart';
import 'package:space_gen/src/parse/spec.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:test/test.dart';

void main() {
  group('assignNames', () {
    AssignedNames namesFor(Map<String, dynamic> specJson) {
      final spec = parseOpenApi(specJson);
      final resolved = resolveSpec(
        spec,
        specUrl: Uri.parse('file:///spec.yaml'),
        logSchemas: false,
      );
      return assignNames(resolved);
    }

    test('top-level component schema gets CamelCase name', () {
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/user_profile'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'user_profile': {
              'type': 'object',
              'properties': {
                'login': {'type': 'string'},
              },
            },
          },
        },
      });
      expect(
        names[JsonPointer.parse('#/components/schemas/user_profile')],
        'UserProfile',
      );
    });

    test('inline object property schema is named from snake context', () {
      // Inline object at /paths/.../properties/location gets a
      // synthesized snake_name from its parent path; today's
      // algorithm camel-cases it.
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
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
              'type': 'object',
              'properties': {
                'location': {
                  'type': 'object',
                  'properties': {
                    'lat': {'type': 'number'},
                    'lng': {'type': 'number'},
                  },
                },
              },
            },
          },
        },
      });
      // The top-level User is named.
      expect(names[JsonPointer.parse('#/components/schemas/User')], 'User');
      // Inline `location` object also gets a name (it's a newtype).
      // The synthesized snake name combines parent + property.
      final inlineNames = names
          .toMap()
          .entries
          .where((e) => e.key.toString().contains('location'))
          .toList();
      expect(inlineNames, isNotEmpty);
      // Whatever the synthesized name is, it should be CamelCase.
      for (final entry in inlineNames) {
        expect(entry.value, matches(RegExp(r'^[A-Z][A-Za-z0-9]*$')));
      }
    });

    test('AssignedNames.[] throws for unassigned pointers', () {
      const names = AssignedNames.empty;
      expect(
        () => names[JsonPointer.parse('#/components/schemas/missing')],
        throwsStateError,
      );
      expect(
        names.maybeGet(JsonPointer.parse('#/components/schemas/missing')),
        isNull,
      );
    });

    test('entries iterates assigned (pointer, name) pairs', () {
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
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
              'type': 'object',
              'properties': {
                'login': {'type': 'string'},
              },
            },
          },
        },
      });
      final list = names.entries.toList();
      expect(list, isNotEmpty);
      final userEntry = list.firstWhere(
        (e) => e.key.toString() == '#/components/schemas/User',
      );
      expect(userEntry.value, 'User');
    });

    test('oneOf with discriminator gets one wrapper name per variant '
        'under the synthesized wrapper pointer', () {
      // Discriminator dispatch emits a `<Parent><Variant>` wrapper
      // per variant. Naming pass stores each under
      // `AssignedNames.wrapperPointer(parent, i)`.
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Pet'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Pet': {
              'oneOf': [
                {r'$ref': '#/components/schemas/Cat'},
                {r'$ref': '#/components/schemas/Dog'},
              ],
              'discriminator': {
                'propertyName': 'kind',
                'mapping': {
                  'cat': '#/components/schemas/Cat',
                  'dog': '#/components/schemas/Dog',
                },
              },
            },
            'Cat': {
              'type': 'object',
              'required': ['kind'],
              'properties': {
                'kind': {
                  'type': 'string',
                  'enum': ['cat'],
                },
              },
            },
            'Dog': {
              'type': 'object',
              'required': ['kind'],
              'properties': {
                'kind': {
                  'type': 'string',
                  'enum': ['dog'],
                },
              },
            },
          },
        },
      });
      final pet = JsonPointer.parse('#/components/schemas/Pet');
      expect(
        names[AssignedNames.wrapperPointer(pet, 0)],
        'PetCat',
      );
      expect(
        names[AssignedNames.wrapperPointer(pet, 1)],
        'PetDog',
      );
    });

    test('array-element dispatch wraps per-variant items with '
        '`<Parent><Items>List`', () {
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        'anyOf': [
                          {
                            'type': 'array',
                            'items': {
                              r'$ref': '#/components/schemas/Stargazer',
                            },
                          },
                          {
                            'type': 'array',
                            'items': {r'$ref': '#/components/schemas/User'},
                          },
                        ],
                      },
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Stargazer': {
              'type': 'object',
              'required': ['starred_at'],
              'properties': {
                'starred_at': {'type': 'string'},
              },
            },
            'User': {
              'type': 'object',
              'required': ['login'],
              'properties': {
                'login': {'type': 'string'},
              },
            },
          },
        },
      });
      // The synthesized anyOf gets a name (something like
      // `Get200Response` — exact synthesized name is implementation-
      // detail), and each wrapper splices the items type:
      // `<Parent>StargazerList` and `<Parent>UserList`.
      final wrappers = names.entries
          .where((e) => e.key.toString().contains('_wrapper'))
          .map((e) => e.value)
          .toList();
      expect(wrappers, hasLength(2));
      expect(wrappers.any((w) => w.endsWith('StargazerList')), isTrue);
      expect(wrappers.any((w) => w.endsWith('UserList')), isTrue);
    });

    test('allOf collapses (no wrappers, NoDispatch path)', () {
      // allOf renders as a synthetic merged RenderObject — no oneOf
      // wrapper subclasses. The naming pass walks it (recurses into
      // members) but `_assignWrapperNames` returns early on
      // NoDispatch, so no wrapper-pointer entries appear.
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Both'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Both': {
              'allOf': [
                {r'$ref': '#/components/schemas/A'},
                {r'$ref': '#/components/schemas/B'},
              ],
            },
            'A': {
              'type': 'object',
              'properties': {
                'a': {'type': 'string'},
              },
            },
            'B': {
              'type': 'object',
              'properties': {
                'b': {'type': 'string'},
              },
            },
          },
        },
      });
      // Components are still named; no wrapper-pointer entries.
      expect(names[JsonPointer.parse('#/components/schemas/Both')], 'Both');
      final wrappers = names.entries
          .where((e) => e.key.toString().contains('_wrapper'))
          .toList();
      expect(wrappers, isEmpty);
    });

    test('walks anyOf and allOf variants', () {
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Outer'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Outer': {
              'anyOf': [
                {r'$ref': '#/components/schemas/Inner'},
                {
                  'allOf': [
                    {r'$ref': '#/components/schemas/Inner'},
                  ],
                },
              ],
            },
            'Inner': {
              'type': 'object',
              'properties': {
                'value': {'type': 'string'},
              },
            },
          },
        },
      });
      // Both top-level component schemas reachable through the
      // anyOf/allOf walker get assigned names.
      expect(names[JsonPointer.parse('#/components/schemas/Outer')], 'Outer');
      expect(names[JsonPointer.parse('#/components/schemas/Inner')], 'Inner');
    });

    test('walks additionalProperties when an object has both named '
        'properties and a value schema', () {
      // An object with named properties + `additionalProperties: $ref`
      // resolves as `ResolvedObject` (not `ResolvedMap`); the walker
      // recurses into its `additionalProperties` so a newtype reachable
      // only through that slot still gets a name.
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Open'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Open': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
              'additionalProperties': {
                r'$ref': '#/components/schemas/Extra',
              },
            },
            'Extra': {
              'type': 'object',
              'properties': {
                'value': {'type': 'string'},
              },
            },
          },
        },
      });
      expect(names[JsonPointer.parse('#/components/schemas/Open')], 'Open');
      expect(names[JsonPointer.parse('#/components/schemas/Extra')], 'Extra');
    });

    test('walks map valueSchema and keySchema', () {
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'Get',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'additionalProperties': {
                          r'$ref': '#/components/schemas/Item',
                        },
                        'propertyNames': {
                          r'$ref': '#/components/schemas/Key',
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Item': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
            },
            'Key': {
              'type': 'string',
              'enum': ['a', 'b'],
            },
          },
        },
      });
      // Both the map's valueSchema (Item, an object newtype) and the
      // keySchema (Key, an enum newtype) get assigned names.
      expect(names[JsonPointer.parse('#/components/schemas/Item')], 'Item');
      expect(names[JsonPointer.parse('#/components/schemas/Key')], 'Key');
    });

    test('non-newtype schemas are not named (List<X>, primitives, etc.)', () {
      final names = namesFor({
        'openapi': '3.1.0',
        'info': {'title': 'X', 'version': '1.0'},
        'servers': [
          {'url': 'https://x'},
        ],
        'paths': {
          '/u': {
            'get': {
              'summary': 'List users',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'array',
                        'items': {r'$ref': '#/components/schemas/User'},
                      },
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
              'type': 'object',
              'properties': {
                'login': {'type': 'string'},
              },
            },
          },
        },
      });
      // User is named. The response array itself isn't (it's
      // structurally `List<User>`, no Dart class wrapper).
      expect(names[JsonPointer.parse('#/components/schemas/User')], 'User');
      // The `login` string property also isn't named — it's a
      // primitive, not a newtype.
      final loginNames = names
          .toMap()
          .entries
          .where((e) => e.key.toString().endsWith('/login'))
          .toList();
      expect(loginNames, isEmpty);
    });
  });
}
