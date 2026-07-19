import 'package:discord/messages/new_member_action_response.dart';
import 'package:discord/messages/resource_channel_response.dart';
import 'package:discord/messages/welcome_message_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildHomeSettingsResponse {
  const GuildHomeSettingsResponse({
    required this.guildId,
    required this.enabled,
    required this.newMemberActions,
    required this.resourceChannels,
    this.welcomeMessage,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildHomeSettingsResponse].
  factory GuildHomeSettingsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildHomeSettingsResponse',
      json,
      () => GuildHomeSettingsResponse(
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        enabled: json['enabled'] as bool,
        welcomeMessage: WelcomeMessageResponse.maybeFromJson(
          json['welcome_message'] as Map<String, dynamic>?,
        ),
        newMemberActions: (json['new_member_actions'] as List)
            .map<NewMemberActionResponse>(
              (e) =>
                  NewMemberActionResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        resourceChannels: (json['resource_channels'] as List)
            .map<ResourceChannelResponse>(
              (e) =>
                  ResourceChannelResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildHomeSettingsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildHomeSettingsResponse.fromJson(json);
  }

  final SnowflakeType guildId;
  final bool enabled;
  final WelcomeMessageResponse? welcomeMessage;
  final List<NewMemberActionResponse> newMemberActions;
  final List<ResourceChannelResponse> resourceChannels;

  /// Converts a [GuildHomeSettingsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'guild_id': guildId.toJson(),
      'enabled': enabled,
      if (welcomeMessage != null) 'welcome_message': welcomeMessage?.toJson(),
      'new_member_actions': newMemberActions.map((e) => e.toJson()).toList(),
      'resource_channels': resourceChannels.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    guildId,
    enabled,
    welcomeMessage,
    listHash(newMemberActions),
    listHash(resourceChannels),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildHomeSettingsResponse &&
        guildId == other.guildId &&
        enabled == other.enabled &&
        welcomeMessage == other.welcomeMessage &&
        listsEqual(newMemberActions, other.newMemberActions) &&
        listsEqual(resourceChannels, other.resourceChannels);
  }
}
