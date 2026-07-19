// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildOnboardingResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildOnboardingResponse(
        guildId: SnowflakeType('0'),
        prompts: <OnboardingPromptResponse>[
          OnboardingPromptResponse(
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
          ),
        ],
        defaultChannelIds: <SnowflakeType>[SnowflakeType('0')],
        enabled: false,
        mode: GuildOnboardingMode.onboardingDefault,
      );
      final parsed = GuildOnboardingResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildOnboardingResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildOnboardingResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
