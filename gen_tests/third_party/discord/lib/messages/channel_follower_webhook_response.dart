import 'package:discord/messages/user_response.dart';
import 'package:discord/messages/webhook_source_channel_response.dart';
import 'package:discord/messages/webhook_source_guild_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/webhook_types.dart';
import 'package:meta/meta.dart';

@immutable
class ChannelFollowerWebhookResponse {
  const ChannelFollowerWebhookResponse({
    required this.applicationId,
    required this.avatar,
    required this.channelId,
    required this.id,
    required this.name,
    this.guildId,
    this.user,
    this.sourceGuild,
    this.sourceChannel,
  });

  /// Converts a `Map<String, dynamic>` to a [ChannelFollowerWebhookResponse].
  factory ChannelFollowerWebhookResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChannelFollowerWebhookResponse',
      json,
      () => ChannelFollowerWebhookResponse(
        applicationId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'application_id') as String?,
        ),
        avatar: checkedKey(json, 'avatar') as String?,
        channelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'channel_id') as String?,
        ),
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
        sourceGuild: WebhookSourceGuildResponse.maybeFromJson(
          json['source_guild'] as Map<String, dynamic>?,
        ),
        sourceChannel: WebhookSourceChannelResponse.maybeFromJson(
          json['source_channel'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelFollowerWebhookResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChannelFollowerWebhookResponse.fromJson(json);
  }

  final SnowflakeType? applicationId;
  final String? avatar;
  final SnowflakeType? channelId;
  final SnowflakeType? guildId;
  final SnowflakeType id;
  final String name;
  WebhookTypes get type => WebhookTypes.channelFollower;
  final UserResponse? user;
  final WebhookSourceGuildResponse? sourceGuild;
  final WebhookSourceChannelResponse? sourceChannel;

  /// Converts a [ChannelFollowerWebhookResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'application_id': applicationId?.toJson(),
      'avatar': avatar,
      'channel_id': channelId?.toJson(),
      'guild_id': guildId?.toJson(),
      'id': id.toJson(),
      'name': name,
      'type': type.toJson(),
      if (user != null) 'user': user?.toJson(),
      if (sourceGuild != null) 'source_guild': sourceGuild?.toJson(),
      if (sourceChannel != null) 'source_channel': sourceChannel?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    applicationId,
    avatar,
    channelId,
    guildId,
    id,
    name,
    user,
    sourceGuild,
    sourceChannel,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelFollowerWebhookResponse &&
        applicationId == other.applicationId &&
        avatar == other.avatar &&
        channelId == other.channelId &&
        guildId == other.guildId &&
        id == other.id &&
        name == other.name &&
        user == other.user &&
        sourceGuild == other.sourceGuild &&
        sourceChannel == other.sourceChannel;
  }
}
