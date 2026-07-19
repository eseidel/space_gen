import 'package:discord/messages/sticker_pack_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class StickerPackCollectionResponse {
  const StickerPackCollectionResponse({required this.stickerPacks});

  /// Converts a `Map<String, dynamic>` to a [StickerPackCollectionResponse].
  factory StickerPackCollectionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StickerPackCollectionResponse',
      json,
      () => StickerPackCollectionResponse(
        stickerPacks: (json['sticker_packs'] as List)
            .map<StickerPackResponse>(
              (e) => StickerPackResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StickerPackCollectionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StickerPackCollectionResponse.fromJson(json);
  }

  final List<StickerPackResponse> stickerPacks;

  /// Converts a [StickerPackCollectionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sticker_packs': stickerPacks.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(stickerPacks).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StickerPackCollectionResponse &&
        listsEqual(stickerPacks, other.stickerPacks);
  }
}
