// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PremiumGuildTiers', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PremiumGuildTiers.none;
      final parsed = PremiumGuildTiers.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PremiumGuildTiers.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => PremiumGuildTiers.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in PremiumGuildTiers.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PremiumGuildTiers.values) {
        expect(PremiumGuildTiers.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
