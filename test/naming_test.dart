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
