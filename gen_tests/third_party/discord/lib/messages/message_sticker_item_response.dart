import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/sticker_format_types.dart';
import 'package:meta/meta.dart';

@immutable
class MessageStickerItemResponse {
  const MessageStickerItemResponse({
    required this.id,
    required this.name,
    required this.formatType,
  });

  /// Converts a `Map<String, dynamic>` to a [MessageStickerItemResponse].
  factory MessageStickerItemResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageStickerItemResponse',
      json,
      () => MessageStickerItemResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        formatType: StickerFormatTypes.fromJson(json['format_type'] as int),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageStickerItemResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageStickerItemResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final StickerFormatTypes formatType;

  /// Converts a [MessageStickerItemResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'format_type': formatType.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, formatType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageStickerItemResponse &&
        id == other.id &&
        name == other.name &&
        formatType == other.formatType;
  }
}
