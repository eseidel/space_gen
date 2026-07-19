// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateOnboardingPromptRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdateOnboardingPromptRequest(
        title: 'example',
        options: const <OnboardingPromptOptionRequest>[
          OnboardingPromptOptionRequest(title: 'example'),
        ],
        id: SnowflakeType('0'),
      );
      final parsed = UpdateOnboardingPromptRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateOnboardingPromptRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UpdateOnboardingPromptRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
