import 'package:discord/messages/entity_metadata_stage_instance_response.dart';
import 'package:discord/messages/scheduled_event_user_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_scheduled_event_entity_types.dart';
import 'package:discord/models/guild_scheduled_event_privacy_levels.dart';
import 'package:discord/models/guild_scheduled_event_statuses.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class StageScheduledEventResponse {
  const StageScheduledEventResponse({
    required this.id,
    required this.guildId,
    required this.name,
    required this.description,
    required this.channelId,
    required this.creatorId,
    required this.image,
    required this.scheduledStartTime,
    required this.scheduledEndTime,
    required this.status,
    required this.entityId,
    required this.privacyLevel,
    required this.entityMetadata,
    this.creator,
    this.userCount,
    this.userRsvp,
  });

  /// Converts a `Map<String, dynamic>` to a [StageScheduledEventResponse].
  factory StageScheduledEventResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StageScheduledEventResponse',
      json,
      () => StageScheduledEventResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        channelId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'channel_id') as String?,
        ),
        creatorId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'creator_id') as String?,
        ),
        creator: UserResponse.maybeFromJson(
          json['creator'] as Map<String, dynamic>?,
        ),
        image: checkedKey(json, 'image') as String?,
        scheduledStartTime: DateTime.parse(
          json['scheduled_start_time'] as String,
        ),
        scheduledEndTime: maybeParseDateTime(
          checkedKey(json, 'scheduled_end_time') as String?,
        ),
        status: GuildScheduledEventStatuses.fromJson(json['status'] as int),
        entityId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'entity_id') as String?,
        ),
        userCount: json['user_count'] as int?,
        privacyLevel: GuildScheduledEventPrivacyLevels.fromJson(
          json['privacy_level'] as int,
        ),
        userRsvp: ScheduledEventUserResponse.maybeFromJson(
          json['user_rsvp'] as Map<String, dynamic>?,
        ),
        entityMetadata: EntityMetadataStageInstanceResponse.maybeFromJson(
          checkedKey(json, 'entity_metadata') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StageScheduledEventResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StageScheduledEventResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType guildId;
  final String name;
  final String? description;
  final SnowflakeType? channelId;
  final SnowflakeType? creatorId;
  final UserResponse? creator;
  final String? image;
  final DateTime scheduledStartTime;
  final DateTime? scheduledEndTime;
  final GuildScheduledEventStatuses status;
  GuildScheduledEventEntityTypes get entityType =>
      GuildScheduledEventEntityTypes.stageInstance;
  final SnowflakeType? entityId;
  final int? userCount;
  final GuildScheduledEventPrivacyLevels privacyLevel;
  final ScheduledEventUserResponse? userRsvp;
  final EntityMetadataStageInstanceResponse? entityMetadata;

  /// Converts a [StageScheduledEventResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'guild_id': guildId.toJson(),
      'name': name,
      'description': description,
      'channel_id': channelId?.toJson(),
      'creator_id': creatorId?.toJson(),
      if (creator != null) 'creator': creator?.toJson(),
      'image': image,
      'scheduled_start_time': scheduledStartTime.toIso8601String(),
      'scheduled_end_time': scheduledEndTime?.toIso8601String(),
      'status': status.toJson(),
      'entity_type': entityType.toJson(),
      'entity_id': entityId?.toJson(),
      if (userCount != null) 'user_count': userCount,
      'privacy_level': privacyLevel.toJson(),
      'user_rsvp': userRsvp?.toJson(),
      'entity_metadata': entityMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    guildId,
    name,
    description,
    channelId,
    creatorId,
    creator,
    image,
    scheduledStartTime,
    scheduledEndTime,
    status,
    entityId,
    userCount,
    privacyLevel,
    userRsvp,
    entityMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StageScheduledEventResponse &&
        id == other.id &&
        guildId == other.guildId &&
        name == other.name &&
        description == other.description &&
        channelId == other.channelId &&
        creatorId == other.creatorId &&
        creator == other.creator &&
        image == other.image &&
        scheduledStartTime == other.scheduledStartTime &&
        scheduledEndTime == other.scheduledEndTime &&
        status == other.status &&
        entityId == other.entityId &&
        userCount == other.userCount &&
        privacyLevel == other.privacyLevel &&
        userRsvp == other.userRsvp &&
        entityMetadata == other.entityMetadata;
  }
}
