// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OnboardingPromptType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OnboardingPromptType.multipleChoice;
      final parsed = OnboardingPromptType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OnboardingPromptType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OnboardingPromptType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OnboardingPromptType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OnboardingPromptType.values) {
        expect(OnboardingPromptType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
