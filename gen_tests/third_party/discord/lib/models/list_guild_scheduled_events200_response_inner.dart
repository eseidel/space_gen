// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/external_scheduled_event_response.dart';
import 'package:discord/messages/stage_scheduled_event_response.dart';
import 'package:discord/messages/voice_scheduled_event_response.dart';
import 'package:meta/meta.dart';

sealed class ListGuildScheduledEvents200ResponseInner {
  const ListGuildScheduledEvents200ResponseInner();

  factory ListGuildScheduledEvents200ResponseInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['entity_type'];
    return switch (discriminator) {
      3 =>
        ListGuildScheduledEvents200ResponseInnerExternalScheduledEventResponse(
          ExternalScheduledEventResponse.fromJson(json),
        ),
      1 => ListGuildScheduledEvents200ResponseInnerStageScheduledEventResponse(
        StageScheduledEventResponse.fromJson(json),
      ),
      2 => ListGuildScheduledEvents200ResponseInnerVoiceScheduledEventResponse(
        VoiceScheduledEventResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown entity_type '$discriminator' for ListGuildScheduledEvents200ResponseInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListGuildScheduledEvents200ResponseInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListGuildScheduledEvents200ResponseInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ListGuildScheduledEvents200ResponseInnerExternalScheduledEventResponse
    extends ListGuildScheduledEvents200ResponseInner {
  const ListGuildScheduledEvents200ResponseInnerExternalScheduledEventResponse(
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
            is ListGuildScheduledEvents200ResponseInnerExternalScheduledEventResponse &&
        value == other.value;
  }
}

@immutable
final class ListGuildScheduledEvents200ResponseInnerStageScheduledEventResponse
    extends ListGuildScheduledEvents200ResponseInner {
  const ListGuildScheduledEvents200ResponseInnerStageScheduledEventResponse(
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
            is ListGuildScheduledEvents200ResponseInnerStageScheduledEventResponse &&
        value == other.value;
  }
}

@immutable
final class ListGuildScheduledEvents200ResponseInnerVoiceScheduledEventResponse
    extends ListGuildScheduledEvents200ResponseInner {
  const ListGuildScheduledEvents200ResponseInnerVoiceScheduledEventResponse(
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
            is ListGuildScheduledEvents200ResponseInnerVoiceScheduledEventResponse &&
        value == other.value;
  }
}
