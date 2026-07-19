// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('VerificationLevels', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = VerificationLevels.none;
      final parsed = VerificationLevels.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(VerificationLevels.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => VerificationLevels.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in VerificationLevels.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in VerificationLevels.values) {
        expect(VerificationLevels.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
