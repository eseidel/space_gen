// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildWelcomeChannel', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildWelcomeChannel(
        channelId: SnowflakeType('0'),
        description: 'example',
      );
      final parsed = GuildWelcomeChannel.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildWelcomeChannel.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildWelcomeChannel.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
