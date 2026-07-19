import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class FollowChannelRequest {
  const FollowChannelRequest({required this.webhookChannelId});

  /// Converts a `Map<String, dynamic>` to a [FollowChannelRequest].
  factory FollowChannelRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FollowChannelRequest',
      json,
      () => FollowChannelRequest(
        webhookChannelId: SnowflakeType.fromJson(
          json['webhook_channel_id'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FollowChannelRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FollowChannelRequest.fromJson(json);
  }

  final SnowflakeType webhookChannelId;

  /// Converts a [FollowChannelRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'webhook_channel_id': webhookChannelId.toJson()};
  }

  @override
  int get hashCode => webhookChannelId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FollowChannelRequest &&
        webhookChannelId == other.webhookChannelId;
  }
}
