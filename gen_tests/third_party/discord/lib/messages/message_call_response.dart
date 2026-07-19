import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageCallResponse {
  const MessageCallResponse({required this.participants, this.endedTimestamp});

  /// Converts a `Map<String, dynamic>` to a [MessageCallResponse].
  factory MessageCallResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageCallResponse',
      json,
      () => MessageCallResponse(
        endedTimestamp: maybeParseDateTime(json['ended_timestamp'] as String?),
        participants: (json['participants'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageCallResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageCallResponse.fromJson(json);
  }

  final DateTime? endedTimestamp;
  final List<SnowflakeType> participants;

  /// Converts a [MessageCallResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ended_timestamp': endedTimestamp?.toIso8601String(),
      'participants': participants.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([endedTimestamp, listHash(participants)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageCallResponse &&
        endedTimestamp == other.endedTimestamp &&
        listsEqual(participants, other.participants);
  }
}
