// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProvisionalTokenResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProvisionalTokenResponse(
        tokenType: 'example',
        accessToken: 'example',
        expiresIn: 0,
        scope: 'example',
        idToken: 'example',
      );
      final parsed = ProvisionalTokenResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProvisionalTokenResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProvisionalTokenResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
