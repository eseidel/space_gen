// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildWelcomeScreenChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildWelcomeScreenChannelResponse(
        channelId: SnowflakeType('0'),
        description: 'example',
        emojiId: SnowflakeType('0'),
        emojiName: 'example',
      );
      final parsed = GuildWelcomeScreenChannelResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildWelcomeScreenChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildWelcomeScreenChannelResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
