import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class DefaultReactionEmojiResponse {
  const DefaultReactionEmojiResponse({
    required this.emojiId,
    required this.emojiName,
  });

  /// Converts a `Map<String, dynamic>` to a [DefaultReactionEmojiResponse].
  factory DefaultReactionEmojiResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DefaultReactionEmojiResponse',
      json,
      () => DefaultReactionEmojiResponse(
        emojiId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'emoji_id') as String?,
        ),
        emojiName: checkedKey(json, 'emoji_name') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DefaultReactionEmojiResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DefaultReactionEmojiResponse.fromJson(json);
  }

  final SnowflakeType? emojiId;
  final String? emojiName;

  /// Converts a [DefaultReactionEmojiResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'emoji_id': emojiId?.toJson(), 'emoji_name': emojiName};
  }

  @override
  int get hashCode => Object.hashAll([emojiId, emojiName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DefaultReactionEmojiResponse &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName;
  }
}
