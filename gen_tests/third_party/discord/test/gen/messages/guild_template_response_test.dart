// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildTemplateResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildTemplateResponse(
        code: 'example',
        name: 'example',
        description: 'example',
        usageCount: 0,
        creatorId: SnowflakeType('0'),
        creator: UserResponse(
          id: SnowflakeType('0'),
          username: 'example',
          avatar: 'example',
          discriminator: 'example',
          publicFlags: 0,
          flags: Int53Type(-9007199254740991),
          globalName: 'example',
          primaryGuild: UserPrimaryGuildResponse(
            identityGuildId: SnowflakeType('0'),
            identityEnabled: false,
            tag: 'example',
            badge: 'example',
          ),
        ),
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        sourceGuildId: SnowflakeType('0'),
        serializedSourceGuild: GuildTemplateSnapshotResponse(
          name: 'example',
          description: 'example',
          region: 'example',
          verificationLevel: VerificationLevels.none,
          defaultMessageNotifications: UserNotificationSettings.allMessages,
          explicitContentFilter: GuildExplicitContentFilterTypes.disabled,
          preferredLocale: AvailableLocalesEnum.ar,
          afkChannelId: SnowflakeType('0'),
          afkTimeout: AfkTimeouts.oneMinute,
          systemChannelId: SnowflakeType('0'),
          systemChannelFlags: 0,
          roles: const <GuildTemplateRoleResponse>[
            GuildTemplateRoleResponse(
              id: 0,
              name: 'example',
              permissions: 'example',
              color: 0,
              colors: GuildTemplateRoleColorsResponse(
                primaryColor: 0,
                secondaryColor: 0,
                tertiaryColor: 0,
              ),
              hoist: false,
              mentionable: false,
              icon: 'example',
              unicodeEmoji: 'example',
            ),
          ],
          channels: <GuildTemplateChannelResponse>[
            GuildTemplateChannelResponse(
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
            ),
          ],
        ),
        isDirty: false,
      );
      final parsed = GuildTemplateResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildTemplateResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildTemplateResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
