import 'package:space_gen/src/spec.dart';
import 'package:test/test.dart';

void main() {
  group('Spec', () {
    test('parse', () {
      final specJson = {
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
          },
        },
      };
      final spec = parseSpec(
        specJson,
        ParseContext.initial(Uri.parse('file:///foo.json')),
      );
      expect(spec.serverUrl, Uri.parse('https://api.spacetraders.io/v2'));
      expect(spec.endpoints.first.path, '/users');
    });

    test('parse with invalid enum', () {
      final specJson = {
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {'summary': 'Get user'},
          },
        },
        'components': {
          'schemas': {
            'NumberEnum': {
              // This is valid according to the spec, but we don't support it.
              'type': 'number',
              'enum': [1, 2, 3],
            },
          },
        },
      };
      expect(
        () => parseSpec(
          specJson,
          ParseContext.initial(Uri.parse('file:///foo.json')),
        ),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
