import 'package:discord/messages/media_gallery_item_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class MediaGalleryComponentResponse {
  const MediaGalleryComponentResponse({required this.id, required this.items});

  /// Converts a `Map<String, dynamic>` to a [MediaGalleryComponentResponse].
  factory MediaGalleryComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MediaGalleryComponentResponse',
      json,
      () => MediaGalleryComponentResponse(
        id: json['id'] as int,
        items: (json['items'] as List)
            .map<MediaGalleryItemResponse>(
              (e) =>
                  MediaGalleryItemResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MediaGalleryComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MediaGalleryComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.mediaGallery;
  final int id;
  final List<MediaGalleryItemResponse> items;

  /// Converts a [MediaGalleryComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, listHash(items)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MediaGalleryComponentResponse &&
        id == other.id &&
        listsEqual(items, other.items);
  }
}
