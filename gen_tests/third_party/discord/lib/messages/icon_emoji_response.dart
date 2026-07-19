import 'package:meta/meta.dart';

@immutable
class IconEmojiResponse {
  const IconEmojiResponse();

  /// Converts a `Map<String, dynamic>` to an [IconEmojiResponse].
  factory IconEmojiResponse.fromJson(Map<String, dynamic> _) {
    return const IconEmojiResponse();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IconEmojiResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IconEmojiResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
