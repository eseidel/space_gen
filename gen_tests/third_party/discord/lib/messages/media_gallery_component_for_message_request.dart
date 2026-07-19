import 'package:discord/messages/media_gallery_item_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class MediaGalleryComponentForMessageRequest {
  const MediaGalleryComponentForMessageRequest({required this.items, this.id});

  /// Converts a `Map<String, dynamic>` to a
  /// [MediaGalleryComponentForMessageRequest].
  factory MediaGalleryComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MediaGalleryComponentForMessageRequest',
      json,
      () => MediaGalleryComponentForMessageRequest(
        id: json['id'] as int?,
        items: (json['items'] as List)
            .map<MediaGalleryItemRequest>(
              (e) =>
                  MediaGalleryItemRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MediaGalleryComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MediaGalleryComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.mediaGallery;
  final int? id;
  final List<MediaGalleryItemRequest> items;

  /// Converts a [MediaGalleryComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
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
    return other is MediaGalleryComponentForMessageRequest &&
        id == other.id &&
        listsEqual(items, other.items);
  }
}
