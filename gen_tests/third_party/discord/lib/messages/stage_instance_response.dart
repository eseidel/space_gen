import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/stage_instances_privacy_levels.dart';
import 'package:meta/meta.dart';

@immutable
class StageInstanceResponse {
  const StageInstanceResponse({
    required this.guildId,
    required this.channelId,
    required this.topic,
    required this.privacyLevel,
    required this.id,
    required this.discoverableDisabled,
    required this.guildScheduledEventId,
  });

  /// Converts a `Map<String, dynamic>` to a [StageInstanceResponse].
  factory StageInstanceResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StageInstanceResponse',
      json,
      () => StageInstanceResponse(
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        topic: json['topic'] as String,
        privacyLevel: StageInstancesPrivacyLevels.fromJson(
          json['privacy_level'] as int,
        ),
        id: SnowflakeType.fromJson(json['id'] as String),
        discoverableDisabled: json['discoverable_disabled'] as bool,
        guildScheduledEventId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'guild_scheduled_event_id') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StageInstanceResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StageInstanceResponse.fromJson(json);
  }

  final SnowflakeType guildId;
  final SnowflakeType channelId;
  final String topic;
  final StageInstancesPrivacyLevels privacyLevel;
  final SnowflakeType id;
  final bool discoverableDisabled;
  final SnowflakeType? guildScheduledEventId;

  /// Converts a [StageInstanceResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'guild_id': guildId.toJson(),
      'channel_id': channelId.toJson(),
      'topic': topic,
      'privacy_level': privacyLevel.toJson(),
      'id': id.toJson(),
      'discoverable_disabled': discoverableDisabled,
      'guild_scheduled_event_id': guildScheduledEventId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    guildId,
    channelId,
    topic,
    privacyLevel,
    id,
    discoverableDisabled,
    guildScheduledEventId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StageInstanceResponse &&
        guildId == other.guildId &&
        channelId == other.channelId &&
        topic == other.topic &&
        privacyLevel == other.privacyLevel &&
        id == other.id &&
        discoverableDisabled == other.discoverableDisabled &&
        guildScheduledEventId == other.guildScheduledEventId;
  }
}
