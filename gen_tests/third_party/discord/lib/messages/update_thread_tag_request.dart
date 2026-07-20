import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateThreadTagRequest {
  UpdateThreadTagRequest({
    required this.name,
    this.emojiId,
    this.emojiName,
    this.moderated,
    this.id,
  }) {
    name.validate(minLength: 0, maxLength: 50);
    emojiName?.validate(maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to a [UpdateThreadTagRequest].
  factory UpdateThreadTagRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateThreadTagRequest',
      json,
      () => UpdateThreadTagRequest(
        name: json['name'] as String,
        emojiId: SnowflakeType.maybeFromJson(json['emoji_id'] as String?),
        emojiName: json['emoji_name'] as String?,
        moderated: json['moderated'] as bool?,
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateThreadTagRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateThreadTagRequest.fromJson(json);
  }

  final String name;
  final SnowflakeType? emojiId;
  final String? emojiName;
  final bool? moderated;
  final SnowflakeType? id;

  /// Converts a [UpdateThreadTagRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'emoji_id': emojiId?.toJson(),
      'emoji_name': emojiName,
      'moderated': moderated,
      'id': id?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, emojiId, emojiName, moderated, id]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateThreadTagRequest &&
        name == other.name &&
        emojiId == other.emojiId &&
        emojiName == other.emojiName &&
        moderated == other.moderated &&
        id == other.id;
  }
}
