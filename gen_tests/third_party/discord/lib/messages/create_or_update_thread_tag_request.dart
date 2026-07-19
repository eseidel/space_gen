import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class CreateOrUpdateThreadTagRequest {
  const CreateOrUpdateThreadTagRequest({
    required this.name,
    this.emojiId,
    this.emojiName,
    this.moderated,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateOrUpdateThreadTagRequest].
  factory CreateOrUpdateThreadTagRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateOrUpdateThreadTagRequest',
      json,
      () => CreateOrUpdateThreadTagRequest(
        name: json['name'] as String,
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
        moderated: json['moderated'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateOrUpdateThreadTagRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateOrUpdateThreadTagRequest.fromJson(json);
  }

  final String name;
  final SnowflakeType? emojiId;
  final String? emojiName;
  final bool? moderated;

  /// Converts a [CreateOrUpdateThreadTagRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
      'moderated': moderated,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, emojiId, emojiName, moderated]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateOrUpdateThreadTagRequest &&
        name == other.name &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName &&
        moderated == other.moderated;
  }
}
