// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildTemplateChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildTemplateChannelResponse(
        id: 0,
        type: ChannelTypes.dm,
        name: 'example',
        position: 0,
        topic: 'example',
        bitrate: 0,
        userLimit: 0,
        nsfw: false,
        rateLimitPerUser: 0,
        parentId: SnowflakeType('0'),
        defaultAutoArchiveDuration: ThreadAutoArchiveDuration.oneHour,
        permissionOverwrites: <ChannelPermissionOverwriteResponse>[
          ChannelPermissionOverwriteResponse(
            id: SnowflakeType('0'),
            type: ChannelPermissionOverwrites.role,
            allow: 'example',
            deny: 'example',
          ),
        ],
        availableTags: <GuildTemplateChannelTags>[
          GuildTemplateChannelTags(
            id: 0,
            name: 'example',
            emojiId: SnowflakeType('0'),
            emojiName: 'example',
            moderated: false,
          ),
        ],
        template: 'example',
        defaultReactionEmoji: DefaultReactionEmojiResponse(
          emojiId: SnowflakeType('0'),
          emojiName: 'example',
        ),
        defaultThreadRateLimitPerUser: 0,
        defaultSortOrder: ThreadSortOrder.latestActivity,
        defaultForumLayout: ForumLayout.default_,
        defaultTagSetting: ThreadSearchTagSetting.matchAll,
        iconEmoji: const IconEmojiResponse(),
        themeColor: 0,
      );
      final parsed = GuildTemplateChannelResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildTemplateChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildTemplateChannelResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
