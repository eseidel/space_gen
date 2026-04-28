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

  group('NameAllocator', () {
    JsonPointer p(String s) => JsonPointer.parse('#/$s');

    test('single-tier preference resolves to itself when uncontested', () {
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Foo');
    });

    test('single-tier collision falls through to a numeric suffix', () {
      // Two claims, identical preference — neither can advance, both
      // settle on the last tier and the second gets the suffix in
      // pointer-string order.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo'])
        ..claim(p('b'), ['Foo'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Foo');
      expect(alloc.assigned[p('b')], 'Foo2');
    });

    test('multi-tier collision lets each entity step up to its next '
        'preference', () {
      // The whole point of multi-tier: A and B both want `Foo`; the
      // fixpoint advances both to their next preference, where they
      // happen not to collide. Both keep a meaningful name.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo', 'Bar'])
        ..claim(p('b'), ['Foo', 'Baz'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Bar');
      expect(alloc.assigned[p('b')], 'Baz');
    });

    test('symmetric multi-tier collision exhausts preferences, then '
        'suffixes', () {
      // Identical preference lists — nothing can disambiguate them.
      // After both tiers collide, the finalize step sorts by pointer
      // string and applies a suffix to all but the first.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo', 'Bar'])
        ..claim(p('b'), ['Foo', 'Bar'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Bar');
      expect(alloc.assigned[p('b')], 'Bar2');
    });

    test('an entity with a single preference holds it; richer-list '
        'rivals defer', () {
      // A's single preference is its only option. B has a fallback,
      // so the fixpoint advances B (not A) and both win their
      // own slot.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo'])
        ..claim(p('b'), ['Foo', 'Bar'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Foo');
      expect(alloc.assigned[p('b')], 'Bar');
    });

    test('three-way collision on first tier', () {
      // All three want Foo first, all bump. Second tier is unique
      // for each. No suffixing required.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo', 'Apple'])
        ..claim(p('b'), ['Foo', 'Banana'])
        ..claim(p('c'), ['Foo', 'Cherry'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Apple');
      expect(alloc.assigned[p('b')], 'Banana');
      expect(alloc.assigned[p('c')], 'Cherry');
    });

    test('subsequent resolve() honors names already assigned in '
        'earlier rounds', () {
      // Phase 1 assigns A=Foo. Phase 2 brings in B which would also
      // prefer Foo; it must bump because Foo is already taken.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo'])
        ..resolve()
        ..claim(p('b'), ['Foo', 'Bar'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Foo');
      expect(alloc.assigned[p('b')], 'Bar');
    });

    test('a re-claim on an already-assigned pointer is a no-op', () {
      // The naming pass calls `claim` from a recursive walker; a
      // duplicate claim during a re-visit must not overwrite the
      // already-resolved name.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo'])
        ..resolve()
        ..claim(p('a'), ['Bar'])
        ..resolve();
      expect(alloc.assigned[p('a')], 'Foo');
    });

    test('empty preference list is rejected', () {
      expect(
        () => NameAllocator().claim(p('a'), const []),
        throwsArgumentError,
      );
    });

    test('numeric suffix walks past a name already in use', () {
      // A holds Foo from phase 1 and Foo2 from phase 2. A new claim
      // for Foo lands at Foo3, not Foo2.
      final alloc = NameAllocator()
        ..claim(p('a'), ['Foo'])
        ..claim(p('b'), ['Foo'])
        ..resolve()
        // alloc has Foo and Foo2 taken now.
        ..claim(p('c'), ['Foo'])
        ..resolve();
      expect(alloc.assigned[p('c')], 'Foo3');
    });
  });
}
