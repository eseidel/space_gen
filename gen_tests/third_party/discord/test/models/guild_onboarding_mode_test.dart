// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildOnboardingMode', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GuildOnboardingMode.onboardingDefault;
      final parsed = GuildOnboardingMode.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildOnboardingMode.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildOnboardingMode.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GuildOnboardingMode.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GuildOnboardingMode.values) {
        expect(GuildOnboardingMode.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
