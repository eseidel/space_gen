import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ForumTagResponse {
  const ForumTagResponse({
    required this.id,
    required this.name,
    required this.moderated,
    required this.emojiId,
    required this.emojiName,
  });

  /// Converts a `Map<String, dynamic>` to a [ForumTagResponse].
  factory ForumTagResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ForumTagResponse',
      json,
      () => ForumTagResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        moderated: json['moderated'] as bool,
        emojiId: SnowflakeType.maybeFromJson(
          checkedKey(json, 'emoji_id') as String?,
        ),
        emojiName: checkedKey(json, 'emoji_name') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ForumTagResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ForumTagResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final bool moderated;
  final SnowflakeType? emojiId;
  final String? emojiName;

  /// Converts a [ForumTagResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'moderated': moderated,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, moderated, emojiId, emojiName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForumTagResponse &&
        id == other.id &&
        name == other.name &&
        moderated == other.moderated &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName;
  }
}
