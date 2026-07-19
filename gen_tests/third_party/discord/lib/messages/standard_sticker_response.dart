import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/sticker_format_types.dart';
import 'package:discord/models/sticker_types.dart';
import 'package:meta/meta.dart';

@immutable
class StandardStickerResponse {
  const StandardStickerResponse({
    required this.id,
    required this.name,
    required this.tags,
    required this.formatType,
    required this.description,
    required this.packId,
    required this.sortValue,
  });

  /// Converts a `Map<String, dynamic>` to a [StandardStickerResponse].
  factory StandardStickerResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StandardStickerResponse',
      json,
      () => StandardStickerResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        tags: json['tags'] as String,
        formatType: StickerFormatTypes.maybeFromJson(
          checkedKey(json, 'format_type') as int?,
        ),
        description: checkedKey(json, 'description') as String?,
        packId: SnowflakeType.fromJson(json['pack_id'] as String),
        sortValue: json['sort_value'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StandardStickerResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StandardStickerResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String tags;
  StickerTypes get type => StickerTypes.standard;
  final StickerFormatTypes? formatType;
  final String? description;
  final SnowflakeType packId;
  final int sortValue;

  /// Converts a [StandardStickerResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'tags': tags,
      'type': type.toJson(),
      'format_type': formatType?.toJson(),
      'description': description,
      'pack_id': packId.toJson(),
      'sort_value': sortValue,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    tags,
    formatType,
    description,
    packId,
    sortValue,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StandardStickerResponse &&
        id == other.id &&
        name == other.name &&
        tags == other.tags &&
        formatType == other.formatType &&
        description == other.description &&
        packId == other.packId &&
        sortValue == other.sortValue;
  }
}
