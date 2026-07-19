import 'package:discord/messages/standard_sticker_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class StickerPackResponse {
  const StickerPackResponse({
    required this.id,
    required this.skuId,
    required this.name,
    required this.description,
    required this.stickers,
    this.coverStickerId,
    this.bannerAssetId,
  });

  /// Converts a `Map<String, dynamic>` to a [StickerPackResponse].
  factory StickerPackResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StickerPackResponse',
      json,
      () => StickerPackResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        skuId: SnowflakeType.fromJson(json['sku_id'] as String),
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        stickers: (json['stickers'] as List)
            .map<StandardStickerResponse>(
              (e) =>
                  StandardStickerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        coverStickerId: SnowflakeType.maybeFromJson(
          json['cover_sticker_id'] as String?,
        ),
        bannerAssetId: SnowflakeType.maybeFromJson(
          json['banner_asset_id'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StickerPackResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StickerPackResponse.fromJson(json);
  }

  final SnowflakeType id;
  final SnowflakeType skuId;
  final String name;
  final String? description;
  final List<StandardStickerResponse> stickers;
  final SnowflakeType? coverStickerId;
  final SnowflakeType? bannerAssetId;

  /// Converts a [StickerPackResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'sku_id': skuId.toJson(),
      'name': name,
      'description': description,
      'stickers': stickers.map((e) => e.toJson()).toList(),
      if (coverStickerId != null) 'cover_sticker_id': coverStickerId?.toJson(),
      if (bannerAssetId != null) 'banner_asset_id': bannerAssetId?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    skuId,
    name,
    description,
    listHash(stickers),
    coverStickerId,
    bannerAssetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StickerPackResponse &&
        id == other.id &&
        skuId == other.skuId &&
        name == other.name &&
        description == other.description &&
        listsEqual(stickers, other.stickers) &&
        coverStickerId == other.coverStickerId &&
        bannerAssetId == other.bannerAssetId;
  }
}
