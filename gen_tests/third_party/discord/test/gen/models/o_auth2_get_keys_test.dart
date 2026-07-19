// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OAuth2GetKeys', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OAuth2GetKeys(
        keys: <OAuth2Key>[
          OAuth2Key(
            kty: 'example',
            use: 'example',
            kid: 'example',
            n: 'example',
            e: 'example',
            alg: 'example',
          ),
        ],
      );
      final parsed = OAuth2GetKeys.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OAuth2GetKeys.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OAuth2GetKeys.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
