import 'package:space_gen/templates/auth.dart';
import 'package:test/test.dart';

String? Function(String) _secrets(Map<String, String> values) =>
    (name) => values[name];

void main() {
  group('ApiKeyAuth', () {
    test('sendIn: cookie resolves into a Cookie header', () {
      const auth = ApiKeyAuth(
        name: 'session',
        sendIn: ApiKeyLocation.cookie,
        secretName: 'Session',
      );
      final resolved = auth.resolve(_secrets({'Session': 'abc123'}));
      expect(resolved.cookies, {'session': 'abc123'});
      expect(resolved.headers, isEmpty);
      expect(resolved.params, isEmpty);

      final headers = <String, String>{};
      resolved.applyToHeaders(headers);
      expect(headers, {'Cookie': 'session=abc123'});
    });

    test('no Cookie header when there are no cookies', () {
      const auth = ApiKeyAuth(
        name: 'X-Api-Key',
        sendIn: ApiKeyLocation.header,
        secretName: 'ApiKey',
      );
      final headers = <String, String>{};
      auth.resolve(_secrets({'ApiKey': 'abc123'})).applyToHeaders(headers);
      expect(headers, {'X-Api-Key': 'abc123'});
    });
  });

  group('ResolvedAuth', () {
    test('merging two cookie auths keeps both cookies', () {
      // Both cookies share the single `Cookie` header, so merge has to
      // concatenate rather than let the later auth replace the earlier.
      const first = ApiKeyAuth(
        name: 'session',
        sendIn: ApiKeyLocation.cookie,
        secretName: 'Session',
      );
      const second = ApiKeyAuth(
        name: 'csrf',
        sendIn: ApiKeyLocation.cookie,
        secretName: 'Csrf',
      );
      const auth = AllOfAuth([first, second]);
      final resolved = auth.resolve(
        _secrets({'Session': 'abc123', 'Csrf': 'xyz789'}),
      );

      final headers = <String, String>{};
      resolved.applyToHeaders(headers);
      expect(headers, {'Cookie': 'session=abc123; csrf=xyz789'});
    });
  });
}
