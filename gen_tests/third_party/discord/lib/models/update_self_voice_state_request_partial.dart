import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateSelfVoiceStateRequestPartial {
  const UpdateSelfVoiceStateRequestPartial({
    this.requestToSpeakTimestamp,
    this.suppress,
    this.channelId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UpdateSelfVoiceStateRequestPartial].
  factory UpdateSelfVoiceStateRequestPartial.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UpdateSelfVoiceStateRequestPartial',
      json,
      () => UpdateSelfVoiceStateRequestPartial(
        requestToSpeakTimestamp: maybeParseDateTime(
          json['request_to_speak_timestamp'] as String?,
        ),
        suppress: json['suppress'] as bool?,
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateSelfVoiceStateRequestPartial? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateSelfVoiceStateRequestPartial.fromJson(json);
  }

  final DateTime? requestToSpeakTimestamp;
  final bool? suppress;
  final SnowflakeType? channelId;

  /// Converts a [UpdateSelfVoiceStateRequestPartial]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'request_to_speak_timestamp': requestToSpeakTimestamp?.toIso8601String(),
      'suppress': suppress,
      'channel_id': channelId?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([requestToSpeakTimestamp, suppress, channelId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateSelfVoiceStateRequestPartial &&
        requestToSpeakTimestamp == other.requestToSpeakTimestamp &&
        suppress == other.suppress &&
        channelId == other.channelId;
  }
}
