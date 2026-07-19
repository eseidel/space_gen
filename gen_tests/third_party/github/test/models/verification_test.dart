// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Verification', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Verification(
        verified: false,
        reason: 'example',
        payload: 'example',
        signature: 'example',
        verifiedAt: 'example',
      );
      final parsed = Verification.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Verification.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Verification.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
