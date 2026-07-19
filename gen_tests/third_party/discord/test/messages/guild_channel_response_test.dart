// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildChannelResponse(
        id: SnowflakeType('0'),
        type: ChannelTypes.dm,
        flags: 0,
        guildId: SnowflakeType('0'),
        name: 'example',
        position: 0,
      );
      final parsed = GuildChannelResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildChannelResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
