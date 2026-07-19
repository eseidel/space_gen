import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageMentionChannelResponse {
  const MessageMentionChannelResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.guildId,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageMentionChannelResponse].
  factory MessageMentionChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageMentionChannelResponse',
      json,
      () => MessageMentionChannelResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        type: ChannelTypes.fromJson(json['type'] as int),
        guildId: SnowflakeType.fromJson(json['guild_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageMentionChannelResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageMentionChannelResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final ChannelTypes type;
  final SnowflakeType guildId;

  /// Converts a [MessageMentionChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'type': type.toJson(),
      'guild_id': guildId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, type, guildId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageMentionChannelResponse &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        guildId == other.guildId;
  }
}
