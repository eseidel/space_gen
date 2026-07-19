import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CreateGuildStickerRequest {
  const CreateGuildStickerRequest({
    required this.name,
    required this.tags,
    required this.file,
    this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateGuildStickerRequest].
  factory CreateGuildStickerRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateGuildStickerRequest',
      json,
      () => CreateGuildStickerRequest(
        name: json['name'] as String,
        tags: json['tags'] as String,
        description: json['description'] as String?,
        file: json['file'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildStickerRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGuildStickerRequest.fromJson(json);
  }

  final String name;
  final String tags;
  final String? description;
  final String file;

  /// Converts a [CreateGuildStickerRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tags': tags,
      'description': description,
      'file': file,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, tags, description, file]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGuildStickerRequest &&
        name == other.name &&
        tags == other.tags &&
        description == other.description &&
        file == other.file;
  }
}
