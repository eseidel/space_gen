import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/afk_timeouts.dart';
import 'package:discord/models/available_locales_enum.dart';
import 'package:discord/models/guild_explicit_content_filter_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/user_notification_settings.dart';
import 'package:discord/models/verification_levels.dart';
import 'package:meta/meta.dart';

@immutable
class GuildPatchRequestPartial {
  const GuildPatchRequestPartial({
    this.name,
    this.description,
    this.region,
    this.icon,
    this.verificationLevel,
    this.defaultMessageNotifications,
    this.explicitContentFilter,
    this.preferredLocale,
    this.afkTimeout,
    this.afkChannelId,
    this.systemChannelId,
    this.splash,
    this.banner,
    this.systemChannelFlags,
    this.features,
    this.discoverySplash,
    this.homeHeader,
    this.rulesChannelId,
    this.safetyAlertsChannelId,
    this.publicUpdatesChannelId,
    this.premiumProgressBarEnabled,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildPatchRequestPartial].
  factory GuildPatchRequestPartial.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildPatchRequestPartial',
      json,
      () => GuildPatchRequestPartial(
        name: json['name'] as String?,
        description: json['description'] as String?,
        region: json['region'] as String?,
        icon: maybeBase64Decode(json['icon'] as String?),
        verificationLevel: VerificationLevels.maybeFromJson(
          json['verification_level'] as int?,
        ),
        defaultMessageNotifications: UserNotificationSettings.maybeFromJson(
          json['default_message_notifications'] as int?,
        ),
        explicitContentFilter: GuildExplicitContentFilterTypes.maybeFromJson(
          json['explicit_content_filter'] as int?,
        ),
        preferredLocale: AvailableLocalesEnum.maybeFromJson(
          json['preferred_locale'] as String?,
        ),
        afkTimeout: AfkTimeouts.maybeFromJson(json['afk_timeout'] as int?),
        afkChannelId: SnowflakeType.maybeFromJson(
          json['afk_channel_id'] as String?,
        ),
        systemChannelId: SnowflakeType.maybeFromJson(
          json['system_channel_id'] as String?,
        ),
        splash: maybeBase64Decode(json['splash'] as String?),
        banner: maybeBase64Decode(json['banner'] as String?),
        systemChannelFlags: json['system_channel_flags'] as int?,
        features: (json['features'] as List?)?.cast<String>(),
        discoverySplash: maybeBase64Decode(json['discovery_splash'] as String?),
        homeHeader: maybeBase64Decode(json['home_header'] as String?),
        rulesChannelId: SnowflakeType.maybeFromJson(
          json['rules_channel_id'] as String?,
        ),
        safetyAlertsChannelId: SnowflakeType.maybeFromJson(
          json['safety_alerts_channel_id'] as String?,
        ),
        publicUpdatesChannelId: SnowflakeType.maybeFromJson(
          json['public_updates_channel_id'] as String?,
        ),
        premiumProgressBarEnabled:
            json['premium_progress_bar_enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildPatchRequestPartial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildPatchRequestPartial.fromJson(json);
  }

  final String? name;
  final String? description;
  final String? region;
  final Uint8List? icon;
  final VerificationLevels? verificationLevel;
  final UserNotificationSettings? defaultMessageNotifications;
  final GuildExplicitContentFilterTypes? explicitContentFilter;
  final AvailableLocalesEnum? preferredLocale;
  final AfkTimeouts? afkTimeout;
  final SnowflakeType? afkChannelId;
  final SnowflakeType? systemChannelId;
  final Uint8List? splash;
  final Uint8List? banner;
  final int? systemChannelFlags;
  final List<String>? features;
  final Uint8List? discoverySplash;
  final Uint8List? homeHeader;
  final SnowflakeType? rulesChannelId;
  final SnowflakeType? safetyAlertsChannelId;
  final SnowflakeType? publicUpdatesChannelId;
  final bool? premiumProgressBarEnabled;

  /// Converts a [GuildPatchRequestPartial] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'description': description,
      'region': region,
      'icon': maybeBase64Encode(icon),
      'verification_level': verificationLevel?.toJson(),
      'default_message_notifications': defaultMessageNotifications?.toJson(),
      'explicit_content_filter': explicitContentFilter?.toJson(),
      'preferred_locale': preferredLocale?.toJson(),
      'afk_timeout': afkTimeout?.toJson(),
      'afk_channel_id': afkChannelId?.toJson(),
      'system_channel_id': systemChannelId?.toJson(),
      'splash': maybeBase64Encode(splash),
      'banner': maybeBase64Encode(banner),
      'system_channel_flags': systemChannelFlags,
      'features': features,
      'discovery_splash': maybeBase64Encode(discoverySplash),
      'home_header': maybeBase64Encode(homeHeader),
      'rules_channel_id': rulesChannelId?.toJson(),
      'safety_alerts_channel_id': safetyAlertsChannelId?.toJson(),
      'public_updates_channel_id': publicUpdatesChannelId?.toJson(),
      'premium_progress_bar_enabled': premiumProgressBarEnabled,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    region,
    listHash(icon),
    verificationLevel,
    defaultMessageNotifications,
    explicitContentFilter,
    preferredLocale,
    afkTimeout,
    afkChannelId,
    systemChannelId,
    listHash(splash),
    listHash(banner),
    systemChannelFlags,
    listHash(features),
    listHash(discoverySplash),
    listHash(homeHeader),
    rulesChannelId,
    safetyAlertsChannelId,
    publicUpdatesChannelId,
    premiumProgressBarEnabled,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildPatchRequestPartial &&
        name == other.name &&
        description == other.description &&
        region == other.region &&
        listsEqual(icon, other.icon) &&
        verificationLevel == other.verificationLevel &&
        defaultMessageNotifications == other.defaultMessageNotifications &&
        explicitContentFilter == other.explicitContentFilter &&
        preferredLocale == other.preferredLocale &&
        afkTimeout == other.afkTimeout &&
        afkChannelId == other.afkChannelId &&
        systemChannelId == other.systemChannelId &&
        listsEqual(splash, other.splash) &&
        listsEqual(banner, other.banner) &&
        systemChannelFlags == other.systemChannelFlags &&
        listsEqual(features, other.features) &&
        listsEqual(discoverySplash, other.discoverySplash) &&
        listsEqual(homeHeader, other.homeHeader) &&
        rulesChannelId == other.rulesChannelId &&
        safetyAlertsChannelId == other.safetyAlertsChannelId &&
        publicUpdatesChannelId == other.publicUpdatesChannelId &&
        premiumProgressBarEnabled == other.premiumProgressBarEnabled;
  }
}
