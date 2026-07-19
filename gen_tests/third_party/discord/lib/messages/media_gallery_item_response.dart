import 'package:discord/messages/unfurled_media_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MediaGalleryItemResponse {
  const MediaGalleryItemResponse({
    required this.media,
    required this.description,
    required this.spoiler,
  });

  /// Converts a `Map<String, dynamic>` to a [MediaGalleryItemResponse].
  factory MediaGalleryItemResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MediaGalleryItemResponse',
      json,
      () => MediaGalleryItemResponse(
        media: UnfurledMediaResponse.fromJson(
          json['media'] as Map<String, dynamic>,
        ),
        description: checkedKey(json, 'description') as String?,
        spoiler: json['spoiler'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MediaGalleryItemResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MediaGalleryItemResponse.fromJson(json);
  }

  final UnfurledMediaResponse media;
  final String? description;
  final bool spoiler;

  /// Converts a [MediaGalleryItemResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'media': media.toJson(),
      'description': description,
      'spoiler': spoiler,
    };
  }

  @override
  int get hashCode => Object.hashAll([media, description, spoiler]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MediaGalleryItemResponse &&
        media == other.media &&
        description == other.description &&
        spoiler == other.spoiler;
  }
}
