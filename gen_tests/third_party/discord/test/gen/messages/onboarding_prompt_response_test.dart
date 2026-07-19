// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OnboardingPromptResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OnboardingPromptResponse(
        id: SnowflakeType('0'),
        title: 'example',
        options: <OnboardingPromptOptionResponse>[
          OnboardingPromptOptionResponse(
            id: SnowflakeType('0'),
            title: 'example',
            description: 'example',
            emoji: SettingsEmojiResponse(
              id: SnowflakeType('0'),
              name: 'example',
              animated: false,
            ),
            roleIds: <SnowflakeType>[SnowflakeType('0')],
            channelIds: <SnowflakeType>[SnowflakeType('0')],
          ),
        ],
        singleSelect: false,
        required_: false,
        inOnboarding: false,
        type: OnboardingPromptType.multipleChoice,
      );
      final parsed = OnboardingPromptResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OnboardingPromptResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OnboardingPromptResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
