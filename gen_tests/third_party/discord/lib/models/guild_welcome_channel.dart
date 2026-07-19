import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class GuildWelcomeChannel {
  const GuildWelcomeChannel({
    required this.channelId,
    required this.description,
    this.emojiId,
    this.emojiName,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildWelcomeChannel].
  factory GuildWelcomeChannel.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildWelcomeChannel',
      json,
      () => GuildWelcomeChannel(
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        description: json['description'] as String,
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildWelcomeChannel? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildWelcomeChannel.fromJson(json);
  }

  final SnowflakeType channelId;
  final String description;
  final SnowflakeType? emojiId;
  final String? emojiName;

  /// Converts a [GuildWelcomeChannel] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'channel_id': channelId.toJson(),
      'description': description,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([channelId, description, emojiId, emojiName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildWelcomeChannel &&
        channelId == other.channelId &&
        description == other.description &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName;
  }
}
