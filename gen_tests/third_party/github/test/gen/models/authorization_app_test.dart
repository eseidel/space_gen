// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizationApp', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AuthorizationApp(
        clientId: 'example',
        name: 'example',
        url: Uri.parse('https://example.com'),
      );
      final parsed = AuthorizationApp.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AuthorizationApp.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AuthorizationApp.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
