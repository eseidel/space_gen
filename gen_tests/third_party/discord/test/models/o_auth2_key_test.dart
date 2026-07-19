// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OAuth2Key', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OAuth2Key(
        kty: 'example',
        use: 'example',
        kid: 'example',
        n: 'example',
        e: 'example',
        alg: 'example',
      );
      final parsed = OAuth2Key.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OAuth2Key.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OAuth2Key.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
