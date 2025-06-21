import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('resolver', () {
    ResolvedSpec parseAndResolveTestSpec(Map<String, dynamic> json) {
      final spec = parseOpenApi(json);
      return resolveSpec(spec);
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
  });
}
