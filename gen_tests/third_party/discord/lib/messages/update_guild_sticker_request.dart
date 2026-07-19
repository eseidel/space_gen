import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateGuildStickerRequest {
  const UpdateGuildStickerRequest({this.name, this.tags, this.description});

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildStickerRequest].
  factory UpdateGuildStickerRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildStickerRequest',
      json,
      () => UpdateGuildStickerRequest(
        name: json['name'] as String?,
        tags: json['tags'] as String?,
        description: json['description'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildStickerRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateGuildStickerRequest.fromJson(json);
  }

  final String? name;
  final String? tags;
  final String? description;

  /// Converts a [UpdateGuildStickerRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, tags, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildStickerRequest &&
        name == other.name &&
        tags == other.tags &&
        description == other.description;
  }
}
