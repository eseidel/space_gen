// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/entity_metadata_external.dart';
import 'package:discord/models/entity_metadata_stage_instance.dart';
import 'package:discord/models/entity_metadata_voice.dart';
import 'package:discord/models/guild_scheduled_event_entity_types.dart';
import 'package:discord/models/guild_scheduled_event_privacy_levels.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class CreateGuildScheduledEventRequest {
  const CreateGuildScheduledEventRequest();

  factory CreateGuildScheduledEventRequest.fromJson(Map<String, dynamic> json) {
    final discriminator = json['entity_type'];
    return switch (discriminator) {
      3 => ExternalScheduledEventCreateRequest.fromJson(json),
      1 => StageScheduledEventCreateRequest.fromJson(json),
      2 => VoiceScheduledEventCreateRequest.fromJson(json),
      _ => throw FormatException(
        "Unknown entity_type '$discriminator' for CreateGuildScheduledEventRequest",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildScheduledEventRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateGuildScheduledEventRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ExternalScheduledEventCreateRequest
    extends CreateGuildScheduledEventRequest {
  const ExternalScheduledEventCreateRequest({
    required this.name,
    required this.scheduledStartTime,
    required this.privacyLevel,
    required this.entityMetadata,
    this.description,
    this.image,
    this.scheduledEndTime,
    this.channelId,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ExternalScheduledEventCreateRequest].
  factory ExternalScheduledEventCreateRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ExternalScheduledEventCreateRequest',
      json,
      () => ExternalScheduledEventCreateRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        image: maybeBase64Decode(json['image'] as String?),
        scheduledStartTime: DateTime.parse(
          json['scheduled_start_time'] as String,
        ),
        scheduledEndTime: maybeParseDateTime(
          json['scheduled_end_time'] as String?,
        ),
        privacyLevel: GuildScheduledEventPrivacyLevels.fromJson(
          json['privacy_level'] as int,
        ),
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        entityMetadata: EntityMetadataExternal.fromJson(
          json['entity_metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExternalScheduledEventCreateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ExternalScheduledEventCreateRequest.fromJson(json);
  }

  final String name;
  final String? description;
  final Uint8List? image;
  final DateTime scheduledStartTime;
  final DateTime? scheduledEndTime;
  final GuildScheduledEventPrivacyLevels privacyLevel;
  GuildScheduledEventEntityTypes get entityType =>
      GuildScheduledEventEntityTypes.external_;
  final SnowflakeType? channelId;
  final EntityMetadataExternal entityMetadata;

  /// Converts an [ExternalScheduledEventCreateRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': maybeBase64Encode(image),
      'scheduled_start_time': scheduledStartTime.toIso8601String(),
      'scheduled_end_time': scheduledEndTime?.toIso8601String(),
      'privacy_level': privacyLevel.toJson(),
      'entity_type': entityType.toJson(),
      'channel_id': channelId?.toJson(),
      'entity_metadata': entityMetadata.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    listHash(image),
    scheduledStartTime,
    scheduledEndTime,
    privacyLevel,
    channelId,
    entityMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExternalScheduledEventCreateRequest &&
        name == other.name &&
        description == other.description &&
        listsEqual(image, other.image) &&
        scheduledStartTime == other.scheduledStartTime &&
        scheduledEndTime == other.scheduledEndTime &&
        privacyLevel == other.privacyLevel &&
        channelId == other.channelId &&
        entityMetadata == other.entityMetadata;
  }
}

@immutable
final class StageScheduledEventCreateRequest
    extends CreateGuildScheduledEventRequest {
  const StageScheduledEventCreateRequest({
    required this.name,
    required this.scheduledStartTime,
    required this.privacyLevel,
    this.description,
    this.image,
    this.scheduledEndTime,
    this.channelId,
    this.entityMetadata,
  });

  /// Converts a `Map<String, dynamic>` to a [StageScheduledEventCreateRequest].
  factory StageScheduledEventCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StageScheduledEventCreateRequest',
      json,
      () => StageScheduledEventCreateRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        image: maybeBase64Decode(json['image'] as String?),
        scheduledStartTime: DateTime.parse(
          json['scheduled_start_time'] as String,
        ),
        scheduledEndTime: maybeParseDateTime(
          json['scheduled_end_time'] as String?,
        ),
        privacyLevel: GuildScheduledEventPrivacyLevels.fromJson(
          json['privacy_level'] as int,
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
  static StageScheduledEventCreateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StageScheduledEventCreateRequest.fromJson(json);
  }

  final String name;
  final String? description;
  final Uint8List? image;
  final DateTime scheduledStartTime;
  final DateTime? scheduledEndTime;
  final GuildScheduledEventPrivacyLevels privacyLevel;
  GuildScheduledEventEntityTypes get entityType =>
      GuildScheduledEventEntityTypes.stageInstance;
  final SnowflakeType? channelId;
  final EntityMetadataStageInstance? entityMetadata;

  /// Converts a [StageScheduledEventCreateRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': maybeBase64Encode(image),
      'scheduled_start_time': scheduledStartTime.toIso8601String(),
      'scheduled_end_time': scheduledEndTime?.toIso8601String(),
      'privacy_level': privacyLevel.toJson(),
      'entity_type': entityType.toJson(),
      'channel_id': channelId?.toJson(),
      'entity_metadata': entityMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    listHash(image),
    scheduledStartTime,
    scheduledEndTime,
    privacyLevel,
    channelId,
    entityMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StageScheduledEventCreateRequest &&
        name == other.name &&
        description == other.description &&
        listsEqual(image, other.image) &&
        scheduledStartTime == other.scheduledStartTime &&
        scheduledEndTime == other.scheduledEndTime &&
        privacyLevel == other.privacyLevel &&
        channelId == other.channelId &&
        entityMetadata == other.entityMetadata;
  }
}

@immutable
final class VoiceScheduledEventCreateRequest
    extends CreateGuildScheduledEventRequest {
  const VoiceScheduledEventCreateRequest({
    required this.name,
    required this.scheduledStartTime,
    required this.privacyLevel,
    this.description,
    this.image,
    this.scheduledEndTime,
    this.channelId,
    this.entityMetadata,
  });

  /// Converts a `Map<String, dynamic>` to a [VoiceScheduledEventCreateRequest].
  factory VoiceScheduledEventCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'VoiceScheduledEventCreateRequest',
      json,
      () => VoiceScheduledEventCreateRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
        image: maybeBase64Decode(json['image'] as String?),
        scheduledStartTime: DateTime.parse(
          json['scheduled_start_time'] as String,
        ),
        scheduledEndTime: maybeParseDateTime(
          json['scheduled_end_time'] as String?,
        ),
        privacyLevel: GuildScheduledEventPrivacyLevels.fromJson(
          json['privacy_level'] as int,
        ),
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        entityMetadata: EntityMetadataVoice.maybeFromJson(
          json['entity_metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static VoiceScheduledEventCreateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return VoiceScheduledEventCreateRequest.fromJson(json);
  }

  final String name;
  final String? description;
  final Uint8List? image;
  final DateTime scheduledStartTime;
  final DateTime? scheduledEndTime;
  final GuildScheduledEventPrivacyLevels privacyLevel;
  GuildScheduledEventEntityTypes get entityType =>
      GuildScheduledEventEntityTypes.voice;
  final SnowflakeType? channelId;
  final EntityMetadataVoice? entityMetadata;

  /// Converts a [VoiceScheduledEventCreateRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': maybeBase64Encode(image),
      'scheduled_start_time': scheduledStartTime.toIso8601String(),
      'scheduled_end_time': scheduledEndTime?.toIso8601String(),
      'privacy_level': privacyLevel.toJson(),
      'entity_type': entityType.toJson(),
      'channel_id': channelId?.toJson(),
      'entity_metadata': entityMetadata?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    description,
    listHash(image),
    scheduledStartTime,
    scheduledEndTime,
    privacyLevel,
    channelId,
    entityMetadata,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VoiceScheduledEventCreateRequest &&
        name == other.name &&
        description == other.description &&
        listsEqual(image, other.image) &&
        scheduledStartTime == other.scheduledStartTime &&
        scheduledEndTime == other.scheduledEndTime &&
        privacyLevel == other.privacyLevel &&
        channelId == other.channelId &&
        entityMetadata == other.entityMetadata;
  }
}
