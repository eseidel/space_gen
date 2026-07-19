// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EmbeddedActivityInstanceLocation', () {
    test('GuildChannelLocation round-trips via maybeFromJson/toJson', () {
      final instance = GuildChannelLocation(
        id: 'example',
        channelId: SnowflakeType('0'),
        guildId: SnowflakeType('0'),
      );
      final parsed = GuildChannelLocation.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('PrivateChannelLocation round-trips via maybeFromJson/toJson', () {
      final instance = PrivateChannelLocation(
        id: 'example',
        channelId: SnowflakeType('0'),
      );
      final parsed = PrivateChannelLocation.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EmbeddedActivityInstanceLocation.maybeFromJson(null), isNull);
    });
  });
}
