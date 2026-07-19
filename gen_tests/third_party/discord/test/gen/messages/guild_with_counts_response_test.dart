// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildWithCountsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildWithCountsResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        description: 'example',
        homeHeader: 'example',
        splash: 'example',
        discoverySplash: 'example',
        features: const <GuildFeatures>[GuildFeatures.animatedBanner],
        banner: 'example',
        ownerId: SnowflakeType('0'),
        applicationId: SnowflakeType('0'),
        region: 'example',
        afkChannelId: SnowflakeType('0'),
        afkTimeout: AfkTimeouts.oneMinute,
        systemChannelId: SnowflakeType('0'),
        systemChannelFlags: 0,
        widgetEnabled: false,
        widgetChannelId: SnowflakeType('0'),
        verificationLevel: VerificationLevels.none,
        roles: <GuildRoleResponse>[
          GuildRoleResponse(
            id: SnowflakeType('0'),
            name: 'example',
            description: 'example',
            permissions: 'example',
            position: 0,
            color: 0,
            colors: const GuildRoleColorsResponse(
              primaryColor: 0,
              secondaryColor: 0,
              tertiaryColor: 0,
            ),
            hoist: false,
            managed: false,
            mentionable: false,
            icon: 'example',
            unicodeEmoji: 'example',
            flags: 0,
          ),
        ],
        defaultMessageNotifications: UserNotificationSettings.allMessages,
        mfaLevel: GuildMfaLevel.none,
        explicitContentFilter: GuildExplicitContentFilterTypes.disabled,
        maxPresences: 0,
        maxMembers: 0,
        maxStageVideoChannelUsers: 0,
        maxVideoChannelUsers: 0,
        vanityUrlCode: 'example',
        premiumTier: PremiumGuildTiers.none,
        premiumSubscriptionCount: 0,
        preferredLocale: AvailableLocalesEnum.ar,
        rulesChannelId: SnowflakeType('0'),
        safetyAlertsChannelId: SnowflakeType('0'),
        publicUpdatesChannelId: SnowflakeType('0'),
        premiumProgressBarEnabled: false,
        nsfw: false,
        nsfwLevel: GuildNsfwContentLevel.default_,
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
        incidentsData: GuildIncidentsDataResponse(
          invitesDisabledUntil: DateTime.utc(2024),
          dmsDisabledUntil: DateTime.utc(2024),
        ),
      );
      final parsed = GuildWithCountsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildWithCountsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildWithCountsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
