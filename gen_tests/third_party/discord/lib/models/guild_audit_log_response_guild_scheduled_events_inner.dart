// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/external_scheduled_event_response.dart';
import 'package:discord/messages/stage_scheduled_event_response.dart';
import 'package:discord/messages/voice_scheduled_event_response.dart';
import 'package:meta/meta.dart';

sealed class GuildAuditLogResponseGuildScheduledEventsInner {
  const GuildAuditLogResponseGuildScheduledEventsInner();

  factory GuildAuditLogResponseGuildScheduledEventsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['entity_type'];
    return switch (discriminator) {
      3 =>
        GuildAuditLogResponseGuildScheduledEventsInnerExternalScheduledEventResponse(
          ExternalScheduledEventResponse.fromJson(json),
        ),
      1 =>
        GuildAuditLogResponseGuildScheduledEventsInnerStageScheduledEventResponse(
          StageScheduledEventResponse.fromJson(json),
        ),
      2 =>
        GuildAuditLogResponseGuildScheduledEventsInnerVoiceScheduledEventResponse(
          VoiceScheduledEventResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown entity_type '$discriminator' for GuildAuditLogResponseGuildScheduledEventsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildAuditLogResponseGuildScheduledEventsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildAuditLogResponseGuildScheduledEventsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GuildAuditLogResponseGuildScheduledEventsInnerExternalScheduledEventResponse
    extends GuildAuditLogResponseGuildScheduledEventsInner {
  const GuildAuditLogResponseGuildScheduledEventsInnerExternalScheduledEventResponse(
    this.value,
  );

  final ExternalScheduledEventResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseGuildScheduledEventsInnerExternalScheduledEventResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseGuildScheduledEventsInnerStageScheduledEventResponse
    extends GuildAuditLogResponseGuildScheduledEventsInner {
  const GuildAuditLogResponseGuildScheduledEventsInnerStageScheduledEventResponse(
    this.value,
  );

  final StageScheduledEventResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseGuildScheduledEventsInnerStageScheduledEventResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseGuildScheduledEventsInnerVoiceScheduledEventResponse
    extends GuildAuditLogResponseGuildScheduledEventsInner {
  const GuildAuditLogResponseGuildScheduledEventsInnerVoiceScheduledEventResponse(
    this.value,
  );

  final VoiceScheduledEventResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseGuildScheduledEventsInnerVoiceScheduledEventResponse &&
        value == other.value;
  }
}
