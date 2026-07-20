import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateDefaultReactionEmojiRequest {
  UpdateDefaultReactionEmojiRequest({this.emojiId, this.emojiName}) {
    emojiName?.validate(maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [UpdateDefaultReactionEmojiRequest].
  factory UpdateDefaultReactionEmojiRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UpdateDefaultReactionEmojiRequest',
      json,
      () => UpdateDefaultReactionEmojiRequest(
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateDefaultReactionEmojiRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateDefaultReactionEmojiRequest.fromJson(json);
  }

  final SnowflakeType? emojiId;
  final String? emojiName;

  /// Converts a [UpdateDefaultReactionEmojiRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'emoji_id': emojiId?.toJson(), 'emoji_name': emojiName};
  }

  @override
  int get hashCode => Object.hashAll([emojiId, emojiName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateDefaultReactionEmojiRequest &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName;
  }
}
