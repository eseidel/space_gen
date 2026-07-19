import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ChannelFollowerResponse {
  const ChannelFollowerResponse({
    required this.channelId,
    required this.webhookId,
  });

  /// Converts a `Map<String, dynamic>` to a [ChannelFollowerResponse].
  factory ChannelFollowerResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChannelFollowerResponse',
      json,
      () => ChannelFollowerResponse(
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        webhookId: SnowflakeType.fromJson(json['webhook_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelFollowerResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChannelFollowerResponse.fromJson(json);
  }

  final SnowflakeType channelId;
  final SnowflakeType webhookId;

  /// Converts a [ChannelFollowerResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId.toJson(), 'webhook_id': webhookId.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([channelId, webhookId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelFollowerResponse &&
        channelId == other.channelId &&
        webhookId == other.webhookId;
  }
}
