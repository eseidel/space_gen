import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/webhook_types.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationIncomingWebhookResponse {
  const ApplicationIncomingWebhookResponse({
    required this.applicationId,
    required this.avatar,
    required this.channelId,
    required this.id,
    required this.name,
    this.guildId,
    this.user,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationIncomingWebhookResponse].
  factory ApplicationIncomingWebhookResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationIncomingWebhookResponse',
      json,
      () => ApplicationIncomingWebhookResponse(
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
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationIncomingWebhookResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationIncomingWebhookResponse.fromJson(json);
  }

  final SnowflakeType? applicationId;
  final String? avatar;
  final SnowflakeType? channelId;
  final SnowflakeType? guildId;
  final SnowflakeType id;
  final String name;
  WebhookTypes get type => WebhookTypes.applicationIncoming;
  final UserResponse? user;

  /// Converts an [ApplicationIncomingWebhookResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'application_id': applicationId?.toJson(),
      'avatar': avatar,
      'channel_id': channelId?.toJson(),
      'guild_id': guildId?.toJson(),
      'id': id.toJson(),
      'name': name,
      'type': type.toJson(),
      'user': user?.toJson(),
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
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationIncomingWebhookResponse &&
        applicationId == other.applicationId &&
        avatar == other.avatar &&
        channelId == other.channelId &&
        guildId == other.guildId &&
        id == other.id &&
        name == other.name &&
        user == other.user;
  }
}
