import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_reference_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageReferenceResponse {
  const MessageReferenceResponse({
    required this.type,
    required this.channelId,
    this.messageId,
    this.guildId,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageReferenceResponse].
  factory MessageReferenceResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageReferenceResponse',
      json,
      () => MessageReferenceResponse(
        type: MessageReferenceType.fromJson(json['type'] as int),
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        messageId: SnowflakeType.maybeFromJson(json['message_id'] as String?),
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageReferenceResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageReferenceResponse.fromJson(json);
  }

  final MessageReferenceType type;
  final SnowflakeType channelId;
  final SnowflakeType? messageId;
  final SnowflakeType? guildId;

  /// Converts a [MessageReferenceResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'channel_id': channelId.toJson(),
      'message_id': ?messageId?.toJson(),
      'guild_id': ?guildId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([type, channelId, messageId, guildId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageReferenceResponse &&
        type == other.type &&
        channelId == other.channelId &&
        messageId == other.messageId &&
        guildId == other.guildId;
  }
}
