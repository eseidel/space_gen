import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_reference_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageReferenceRequest {
  const MessageReferenceRequest({
    required this.messageId,
    this.guildId,
    this.channelId,
    this.failIfNotExists,
    this.type,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageReferenceRequest].
  factory MessageReferenceRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageReferenceRequest',
      json,
      () => MessageReferenceRequest(
        guildId: SnowflakeType.maybeFromJson(json['guild_id'] as String?),
        channelId: SnowflakeType.maybeFromJson(json['channel_id'] as String?),
        messageId: SnowflakeType.fromJson(json['message_id'] as String),
        failIfNotExists: json['fail_if_not_exists'] as bool?,
        type: MessageReferenceType.maybeFromJson(json['type'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageReferenceRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageReferenceRequest.fromJson(json);
  }

  final SnowflakeType? guildId;
  final SnowflakeType? channelId;
  final SnowflakeType messageId;
  final bool? failIfNotExists;
  final MessageReferenceType? type;

  /// Converts a [MessageReferenceRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'guild_id': guildId?.toJson(),
      'channel_id': channelId?.toJson(),
      'message_id': messageId.toJson(),
      'fail_if_not_exists': failIfNotExists,
      'type': type?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([guildId, channelId, messageId, failIfNotExists, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageReferenceRequest &&
        guildId == other.guildId &&
        channelId == other.channelId &&
        messageId == other.messageId &&
        failIfNotExists == other.failIfNotExists &&
        type == other.type;
  }
}
