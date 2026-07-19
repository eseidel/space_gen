import 'package:discord/messages/emoji_response.dart';
import 'package:discord/messages/guild_incidents_data_response.dart';
import 'package:discord/messages/guild_role_response.dart';
import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/afk_timeouts.dart';
import 'package:discord/models/available_locales_enum.dart';
import 'package:discord/models/guild_explicit_content_filter_types.dart';
import 'package:discord/models/guild_features.dart';
import 'package:discord/models/guild_mfa_level.dart';
import 'package:discord/models/guild_nsfw_content_level.dart';
import 'package:discord/models/premium_guild_tiers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/user_notification_settings.dart';
import 'package:discord/models/verification_levels.dart';
import 'package:meta/meta.dart';

@immutable
class GuildWithCountsResponse {
  const GuildWithCountsResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.homeHeader,
    required this.splash,
    required this.discoverySplash,
    required this.features,
    required this.banner,
    required this.ownerId,
    required this.applicationId,
    required this.region,
    required this.afkChannelId,
    required this.afkTimeout,
    required this.systemChannelId,
    required this.systemChannelFlags,
    required this.widgetEnabled,
    required this.widgetChannelId,
    required this.verificationLevel,
    required this.roles,
    required this.defaultMessageNotifications,
    required this.mfaLevel,
    required this.explicitContentFilter,
    required this.maxPresences,
    required this.maxMembers,
    required this.maxStageVideoChannelUsers,
    required this.maxVideoChannelUsers,
    required this.vanityUrlCode,
    required this.premiumTier,
    required this.premiumSubscriptionCount,
    required this.preferredLocale,
    required this.rulesChannelId,
    required this.safetyAlertsChannelId,
    required this.publicUpdatesChannelId,
    required this.premiumProgressBarEnabled,
    required this.nsfw,
    required this.nsfwLevel,
    required this.emojis,
    required this.stickers,
    required this.incidentsData,
    this.premiumProgressBarEnabledUserUpdatedAt,
    this.approximateMemberCount,
    this.approximatePresenceCount,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildWithCountsResponse].
  factory GuildWithCountsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildWithCountsResponse',
      json,
      () => GuildWithCountsResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        icon: checkedKey(json, 'icon') as String?,
        description: checkedKey(json, 'description') as String?,
        homeHeader: checkedKey(json, 'home_header') as String?,
        splash: checkedKey(json, 'splash') as String?,
        discoverySplash: checkedKey(json, 'discovery_splash') as String?,
        features: (json['features'] as List)
            .map<GuildFeatures>((e) => GuildFeatures.fromJson(e as String))
            .toList(),
        banner: checkedKey(json, 'banner') as String?,
        ownerId: SnowflakeType.fromJson(json['owner_id'] as String),
        applicationId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'application_id') as String?,
        ),
        region: json['region'] as String,
        afkChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'afk_channel_id') as String?,
        ),
        afkTimeout: AfkTimeouts.fromJson(json['afk_timeout'] as int),
        systemChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'system_channel_id') as String?,
        ),
        systemChannelFlags: json['system_channel_flags'] as int,
        widgetEnabled: json['widget_enabled'] as bool,
        widgetChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'widget_channel_id') as String?,
        ),
        verificationLevel: VerificationLevels.fromJson(
          json['verification_level'] as int,
        ),
        roles: (json['roles'] as List)
            .map<GuildRoleResponse>(
              (e) => GuildRoleResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        defaultMessageNotifications: UserNotificationSettings.fromJson(
          json['default_message_notifications'] as int,
        ),
        mfaLevel: GuildMfaLevel.fromJson(json['mfa_level'] as int),
        explicitContentFilter: GuildExplicitContentFilterTypes.fromJson(
          json['explicit_content_filter'] as int,
        ),
        maxPresences: checkedKey(json, 'max_presences') as int?,
        maxMembers: json['max_members'] as int,
        maxStageVideoChannelUsers: json['max_stage_video_channel_users'] as int,
        maxVideoChannelUsers: json['max_video_channel_users'] as int,
        vanityUrlCode: checkedKey(json, 'vanity_url_code') as String?,
        premiumTier: PremiumGuildTiers.fromJson(json['premium_tier'] as int),
        premiumSubscriptionCount: json['premium_subscription_count'] as int,
        preferredLocale: AvailableLocalesEnum.fromJson(
          json['preferred_locale'] as String,
        ),
        rulesChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'rules_channel_id') as String?,
        ),
        safetyAlertsChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'safety_alerts_channel_id') as String?,
        ),
        publicUpdatesChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'public_updates_channel_id') as String?,
        ),
        premiumProgressBarEnabled: json['premium_progress_bar_enabled'] as bool,
        premiumProgressBarEnabledUserUpdatedAt: maybeParseDateTime(
          json['premium_progress_bar_enabled_user_updated_at'] as String?,
        ),
        nsfw: json['nsfw'] as bool,
        nsfwLevel: GuildNsfwContentLevel.fromJson(json['nsfw_level'] as int),
        emojis: (json['emojis'] as List)
            .map<EmojiResponse>(
              (e) => EmojiResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        stickers: (json['stickers'] as List)
            .map<GuildStickerResponse>(
              (e) => GuildStickerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        incidentsData: GuildIncidentsDataResponse.maybeFromJson(
          checkedKey(json, 'incidents_data') as Map<String, dynamic>?,
        ),
        approximateMemberCount: json['approximate_member_count'] as int?,
        approximatePresenceCount: json['approximate_presence_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildWithCountsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildWithCountsResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? icon;
  final String? description;
  final String? homeHeader;
  final String? splash;
  final String? discoverySplash;
  final List<GuildFeatures> features;
  final String? banner;
  final SnowflakeType ownerId;
  final SnowflakeType? applicationId;
  final String region;
  final SnowflakeType? afkChannelId;
  final AfkTimeouts afkTimeout;
  final SnowflakeType? systemChannelId;
  final int systemChannelFlags;
  final bool widgetEnabled;
  final SnowflakeType? widgetChannelId;
  final VerificationLevels verificationLevel;
  final List<GuildRoleResponse> roles;
  final UserNotificationSettings defaultMessageNotifications;
  final GuildMfaLevel mfaLevel;
  final GuildExplicitContentFilterTypes explicitContentFilter;
  final int? maxPresences;
  final int maxMembers;
  final int maxStageVideoChannelUsers;
  final int maxVideoChannelUsers;
  final String? vanityUrlCode;
  final PremiumGuildTiers premiumTier;
  final int premiumSubscriptionCount;
  final AvailableLocalesEnum preferredLocale;
  final SnowflakeType? rulesChannelId;
  final SnowflakeType? safetyAlertsChannelId;
  final SnowflakeType? publicUpdatesChannelId;
  final bool premiumProgressBarEnabled;
  final DateTime? premiumProgressBarEnabledUserUpdatedAt;
  final bool nsfw;
  final GuildNsfwContentLevel nsfwLevel;
  final List<EmojiResponse> emojis;
  final List<GuildStickerResponse> stickers;
  final GuildIncidentsDataResponse? incidentsData;
  final int? approximateMemberCount;
  final int? approximatePresenceCount;

  /// Converts a [GuildWithCountsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'icon': icon,
      'description': description,
      'home_header': homeHeader,
      'splash': splash,
      'discovery_splash': discoverySplash,
      'features': features.map((e) => e.toJson()).toList(),
      'banner': banner,
      'owner_id': ownerId.toJson(),
      'application_id': applicationId?.toJson(),
      'region': region,
      'afk_channel_id': afkChannelId?.toJson(),
      'afk_timeout': afkTimeout.toJson(),
      'system_channel_id': systemChannelId?.toJson(),
      'system_channel_flags': systemChannelFlags,
      'widget_enabled': widgetEnabled,
      'widget_channel_id': widgetChannelId?.toJson(),
      'verification_level': verificationLevel.toJson(),
      'roles': roles.map((e) => e.toJson()).toList(),
      'default_message_notifications': defaultMessageNotifications.toJson(),
      'mfa_level': mfaLevel.toJson(),
      'explicit_content_filter': explicitContentFilter.toJson(),
      'max_presences': maxPresences,
      'max_members': maxMembers,
      'max_stage_video_channel_users': maxStageVideoChannelUsers,
      'max_video_channel_users': maxVideoChannelUsers,
      'vanity_url_code': vanityUrlCode,
      'premium_tier': premiumTier.toJson(),
      'premium_subscription_count': premiumSubscriptionCount,
      'preferred_locale': preferredLocale.toJson(),
      'rules_channel_id': rulesChannelId?.toJson(),
      'safety_alerts_channel_id': safetyAlertsChannelId?.toJson(),
      'public_updates_channel_id': publicUpdatesChannelId?.toJson(),
      'premium_progress_bar_enabled': premiumProgressBarEnabled,
      'premium_progress_bar_enabled_user_updated_at':
          premiumProgressBarEnabledUserUpdatedAt?.toIso8601String(),
      'nsfw': nsfw,
      'nsfw_level': nsfwLevel.toJson(),
      'emojis': emojis.map((e) => e.toJson()).toList(),
      'stickers': stickers.map((e) => e.toJson()).toList(),
      'incidents_data': incidentsData?.toJson(),
      'approximate_member_count': approximateMemberCount,
      'approximate_presence_count': approximatePresenceCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    icon,
    description,
    homeHeader,
    splash,
    discoverySplash,
    listHash(features),
    banner,
    ownerId,
    applicationId,
    region,
    afkChannelId,
    afkTimeout,
    systemChannelId,
    systemChannelFlags,
    widgetEnabled,
    widgetChannelId,
    verificationLevel,
    listHash(roles),
    defaultMessageNotifications,
    mfaLevel,
    explicitContentFilter,
    maxPresences,
    maxMembers,
    maxStageVideoChannelUsers,
    maxVideoChannelUsers,
    vanityUrlCode,
    premiumTier,
    premiumSubscriptionCount,
    preferredLocale,
    rulesChannelId,
    safetyAlertsChannelId,
    publicUpdatesChannelId,
    premiumProgressBarEnabled,
    premiumProgressBarEnabledUserUpdatedAt,
    nsfw,
    nsfwLevel,
    listHash(emojis),
    listHash(stickers),
    incidentsData,
    approximateMemberCount,
    approximatePresenceCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildWithCountsResponse &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description &&
        homeHeader == other.homeHeader &&
        splash == other.splash &&
        discoverySplash == other.discoverySplash &&
        listsEqual(features, other.features) &&
        banner == other.banner &&
        ownerId == other.ownerId &&
        applicationId == other.applicationId &&
        region == other.region &&
        afkChannelId == other.afkChannelId &&
        afkTimeout == other.afkTimeout &&
        systemChannelId == other.systemChannelId &&
        systemChannelFlags == other.systemChannelFlags &&
        widgetEnabled == other.widgetEnabled &&
        widgetChannelId == other.widgetChannelId &&
        verificationLevel == other.verificationLevel &&
        listsEqual(roles, other.roles) &&
        defaultMessageNotifications == other.defaultMessageNotifications &&
        mfaLevel == other.mfaLevel &&
        explicitContentFilter == other.explicitContentFilter &&
        maxPresences == other.maxPresences &&
        maxMembers == other.maxMembers &&
        maxStageVideoChannelUsers == other.maxStageVideoChannelUsers &&
        maxVideoChannelUsers == other.maxVideoChannelUsers &&
        vanityUrlCode == other.vanityUrlCode &&
        premiumTier == other.premiumTier &&
        premiumSubscriptionCount == other.premiumSubscriptionCount &&
        preferredLocale == other.preferredLocale &&
        rulesChannelId == other.rulesChannelId &&
        safetyAlertsChannelId == other.safetyAlertsChannelId &&
        publicUpdatesChannelId == other.publicUpdatesChannelId &&
        premiumProgressBarEnabled == other.premiumProgressBarEnabled &&
        premiumProgressBarEnabledUserUpdatedAt ==
            other.premiumProgressBarEnabledUserUpdatedAt &&
        nsfw == other.nsfw &&
        nsfwLevel == other.nsfwLevel &&
        listsEqual(emojis, other.emojis) &&
        listsEqual(stickers, other.stickers) &&
        incidentsData == other.incidentsData &&
        approximateMemberCount == other.approximateMemberCount &&
        approximatePresenceCount == other.approximatePresenceCount;
  }
}
