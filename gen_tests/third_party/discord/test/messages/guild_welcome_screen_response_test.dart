// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildWelcomeScreenResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildWelcomeScreenResponse(
        description: 'example',
        welcomeChannels: <GuildWelcomeScreenChannelResponse>[
          GuildWelcomeScreenChannelResponse(
            channelId: SnowflakeType('0'),
            description: 'example',
            emojiId: SnowflakeType('0'),
            emojiName: 'example',
          ),
        ],
      );
      final parsed = GuildWelcomeScreenResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildWelcomeScreenResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildWelcomeScreenResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
