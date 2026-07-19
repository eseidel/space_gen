// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildPreviewResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildPreviewResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        description: 'example',
        homeHeader: 'example',
        splash: 'example',
        discoverySplash: 'example',
        features: const <GuildFeatures>[GuildFeatures.animatedBanner],
        approximateMemberCount: 0,
        approximatePresenceCount: 0,
        emojis: <EmojiResponse>[
          EmojiResponse(
            id: SnowflakeType('0'),
            name: 'example',
            roles: <SnowflakeType>[SnowflakeType('0')],
            requireColons: false,
            managed: false,
            animated: false,
            available: false,
          ),
        ],
        stickers: <GuildStickerResponse>[
          GuildStickerResponse(
            id: SnowflakeType('0'),
            name: 'example',
            tags: 'example',
            formatType: StickerFormatTypes.png,
            description: 'example',
            available: false,
            guildId: SnowflakeType('0'),
          ),
        ],
      );
      final parsed = GuildPreviewResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildPreviewResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildPreviewResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
