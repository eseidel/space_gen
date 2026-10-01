// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/stage_instances_privacy_levels.dart';
import 'package:meta/meta.dart';

@immutable
class CreateStageInstanceRequest {
  CreateStageInstanceRequest({
    required this.topic,
    required this.channelId,
    this.privacyLevel,
    this.guildScheduledEventId,
    this.sendStartNotification,
  }) {
    topic.validate(minLength: 1, maxLength: 120);
  }

  /// Converts a `Map<String, dynamic>` to a [CreateStageInstanceRequest].
  factory CreateStageInstanceRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateStageInstanceRequest',
      json,
      () => CreateStageInstanceRequest(
        topic: json['topic'] as String,
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        privacyLevel: StageInstancesPrivacyLevels.maybeFromJson(
          json['privacy_level'] as int?,
        ),
        guildScheduledEventId: SnowflakeType.maybeFromJson(
          json['guild_scheduled_event_id'] as String?,
        ),
        sendStartNotification: json['send_start_notification'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateStageInstanceRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateStageInstanceRequest.fromJson(json);
  }

  final String topic;
  final SnowflakeType channelId;
  final StageInstancesPrivacyLevels? privacyLevel;
  final SnowflakeType? guildScheduledEventId;
  final bool? sendStartNotification;

  /// Converts a [CreateStageInstanceRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'channel_id': channelId.toJson(),
      'privacy_level': privacyLevel?.toJson(),
      'guild_scheduled_event_id': guildScheduledEventId?.toJson(),
      'send_start_notification': sendStartNotification,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    topic,
    channelId,
    privacyLevel,
    guildScheduledEventId,
    sendStartNotification,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateStageInstanceRequest &&
        topic == other.topic &&
        channelId == other.channelId &&
        privacyLevel == other.privacyLevel &&
        guildScheduledEventId == other.guildScheduledEventId &&
        sendStartNotification == other.sendStartNotification;
  }
}
