// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildStickerResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildStickerResponse(
        id: SnowflakeType('0'),
        name: 'example',
        tags: 'example',
        formatType: StickerFormatTypes.png,
        description: 'example',
        available: false,
        guildId: SnowflakeType('0'),
      );
      final parsed = GuildStickerResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildStickerResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildStickerResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
