// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OnboardingPromptOptionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OnboardingPromptOptionResponse(
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
      );
      final parsed = OnboardingPromptOptionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OnboardingPromptOptionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OnboardingPromptOptionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
