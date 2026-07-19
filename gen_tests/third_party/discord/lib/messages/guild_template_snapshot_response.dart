import 'package:discord/messages/guild_template_channel_response.dart';
import 'package:discord/messages/guild_template_role_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/afk_timeouts.dart';
import 'package:discord/models/available_locales_enum.dart';
import 'package:discord/models/guild_explicit_content_filter_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/user_notification_settings.dart';
import 'package:discord/models/verification_levels.dart';
import 'package:meta/meta.dart';

@immutable
class GuildTemplateSnapshotResponse {
  const GuildTemplateSnapshotResponse({
    required this.name,
    required this.description,
    required this.region,
    required this.verificationLevel,
    required this.defaultMessageNotifications,
    required this.explicitContentFilter,
    required this.preferredLocale,
    required this.afkChannelId,
    required this.afkTimeout,
    required this.systemChannelId,
    required this.systemChannelFlags,
    required this.roles,
    required this.channels,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildTemplateSnapshotResponse].
  factory GuildTemplateSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildTemplateSnapshotResponse',
      json,
      () => GuildTemplateSnapshotResponse(
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        region: checkedKey(json, 'region') as String?,
        verificationLevel: VerificationLevels.fromJson(
          json['verification_level'] as int,
        ),
        defaultMessageNotifications: UserNotificationSettings.fromJson(
          json['default_message_notifications'] as int,
        ),
        explicitContentFilter: GuildExplicitContentFilterTypes.fromJson(
          json['explicit_content_filter'] as int,
        ),
        preferredLocale: AvailableLocalesEnum.fromJson(
          json['preferred_locale'] as String,
        ),
        afkChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'afk_channel_id') as String?,
        ),
        afkTimeout: AfkTimeouts.fromJson(json['afk_timeout'] as int),
        systemChannelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'system_channel_id') as String?,
        ),
        systemChannelFlags: json['system_channel_flags'] as int,
        roles: (json['roles'] as List)
            .map<GuildTemplateRoleResponse>(
              (e) =>
                  GuildTemplateRoleResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        channels: (json['channels'] as List)
            .map<GuildTemplateChannelResponse>(
              (e) => GuildTemplateChannelResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildTemplateSnapshotResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildTemplateSnapshotResponse.fromJson(json);
  }

  final String name;
  final String? description;
  final String? region;
  final VerificationLevels verificationLevel;
  final UserNotificationSettings defaultMessageNotifications;
  final GuildExplicitContentFilterTypes explicitContentFilter;
  final AvailableLocalesEnum preferredLocale;
  final SnowflakeType? afkChannelId;
  final AfkTimeouts afkTimeout;
  final SnowflakeType? systemChannelId;
  final int systemChannelFlags;
  final List<GuildTemplateRoleResponse> roles;
  final List<GuildTemplateChannelResponse> channels;

  /// Converts a [GuildTemplateSnapshotResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'region': region,
      'verification_level': verificationLevel.toJson(),
      'default_message_notifications': defaultMessageNotifications.toJson(),
      'explicit_content_filter': explicitContentFilter.toJson(),
      'preferred_locale': preferredLocale.toJson(),
      'afk_channel_id': afkChannelId?.toJson(),
      'afk_timeout': afkTimeout.toJson(),
      'system_channel_id': systemChannelId?.toJson(),
      'system_channel_flags': systemChannelFlags,
      'roles': roles.map((e) => e.toJson()).toList(),
      'channels': channels.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    region,
    verificationLevel,
    defaultMessageNotifications,
    explicitContentFilter,
    preferredLocale,
    afkChannelId,
    afkTimeout,
    systemChannelId,
    systemChannelFlags,
    listHash(roles),
    listHash(channels),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildTemplateSnapshotResponse &&
        name == other.name &&
        description == other.description &&
        region == other.region &&
        verificationLevel == other.verificationLevel &&
        defaultMessageNotifications == other.defaultMessageNotifications &&
        explicitContentFilter == other.explicitContentFilter &&
        preferredLocale == other.preferredLocale &&
        afkChannelId == other.afkChannelId &&
        afkTimeout == other.afkTimeout &&
        systemChannelId == other.systemChannelId &&
        systemChannelFlags == other.systemChannelFlags &&
        listsEqual(roles, other.roles) &&
        listsEqual(channels, other.channels);
  }
}
