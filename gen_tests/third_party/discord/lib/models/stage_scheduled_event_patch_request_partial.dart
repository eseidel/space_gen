import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/entity_metadata_stage_instance.dart';
import 'package:discord/models/guild_scheduled_event_entity_types.dart';
import 'package:discord/models/guild_scheduled_event_privacy_levels.dart';
import 'package:discord/models/guild_scheduled_event_statuses.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class StageScheduledEventPatchRequestPartial {
  const StageScheduledEventPatchRequestPartial({
    this.status,
    this.name,
    this.description,
    this.image,
    this.scheduledStartTime,
    this.scheduledEndTime,
    this.entityType,
    this.privacyLevel,
    this.channelId,
    this.entityMetadata,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [StageScheduledEventPatchRequestPartial].
  factory StageScheduledEventPatchRequestPartial.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'StageScheduledEventPatchRequestPartial',
      json,
      () => StageScheduledEventPatchRequestPartial(
        status: GuildScheduledEventStatuses.maybeFromJson(
          json['status'] as int?,
        ),
        name: json['name'] as String?,
        description: json['description'] as String?,
        image: maybeBase64Decode(json['image'] as String?),
        scheduledStartTime: maybeParseDateTime(
          json['scheduled_start_time'] as String?,
        ),
        scheduledEndTime: maybeParseDateTime(
          json['scheduled_end_time'] as String?,
        ),
        entityType: GuildScheduledEventEntityTypes.maybeFromJson(
          json['entity_type'] as int?,
        ),
        privacyLevel: GuildScheduledEventPrivacyLevels.maybeFromJson(
          json['privacy_level'] as int?,
        ),
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        entityMetadata: EntityMetadataStageInstance.maybeFromJson(
          json['entity_metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StageScheduledEventPatchRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StageScheduledEventPatchRequestPartial.fromJson(json);
  }

  final GuildScheduledEventStatuses? status;
  final String? name;
  final String? description;
  final Uint8List? image;
  final DateTime? scheduledStartTime;
  final DateTime? scheduledEndTime;
  final GuildScheduledEventEntityTypes? entityType;
  final GuildScheduledEventPrivacyLevels? privacyLevel;
  final SnowflakeType? channelId;
  final EntityMetadataStageInstance? entityMetadata;

  /// Converts a [StageScheduledEventPatchRequestPartial]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'status': status?.toJson(),
      if (name != null) 'name': name,
      'description': description,
      'image': maybeBase64Encode(image),
      if (scheduledStartTime != null)
        'scheduled_start_time': scheduledStartTime?.toIso8601String(),
      'scheduled_end_time': scheduledEndTime?.toIso8601String(),
      'entity_type': entityType?.toJson(),
      if (privacyLevel != null) 'privacy_level': privacyLevel?.toJson(),
      'channel_id': channelId?.toJson(),
      'entity_metadata': entityMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    status,
    name,
    description,
    listHash(image),
    scheduledStartTime,
    scheduledEndTime,
    entityType,
    privacyLevel,
    channelId,
    entityMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StageScheduledEventPatchRequestPartial &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        listsEqual(image, other.image) &&
        scheduledStartTime == other.scheduledStartTime &&
        scheduledEndTime == other.scheduledEndTime &&
        entityType == other.entityType &&
        privacyLevel == other.privacyLevel &&
        channelId == other.channelId &&
        entityMetadata == other.entityMetadata;
  }
}
