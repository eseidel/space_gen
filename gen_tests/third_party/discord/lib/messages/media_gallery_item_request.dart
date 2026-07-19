import 'package:discord/messages/unfurled_media_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MediaGalleryItemRequest {
  const MediaGalleryItemRequest({
    required this.media,
    this.description,
    this.spoiler,
  });

  /// Converts a `Map<String, dynamic>` to a [MediaGalleryItemRequest].
  factory MediaGalleryItemRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MediaGalleryItemRequest',
      json,
      () => MediaGalleryItemRequest(
        description: json['description'] as String?,
        spoiler: json['spoiler'] as bool?,
        media: UnfurledMediaRequest.fromJson(
          json['media'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MediaGalleryItemRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MediaGalleryItemRequest.fromJson(json);
  }

  final String? description;
  final bool? spoiler;
  final UnfurledMediaRequest media;

  /// Converts a [MediaGalleryItemRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'spoiler': spoiler,
      'media': media.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([description, spoiler, media]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MediaGalleryItemRequest &&
        description == other.description &&
        spoiler == other.spoiler &&
        media == other.media;
  }
}
