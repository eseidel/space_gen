// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/messages/standard_sticker_response.dart';
import 'package:meta/meta.dart';

sealed class MinimalContentMessageResponseStickersInner {
  const MinimalContentMessageResponseStickersInner();

  factory MinimalContentMessageResponseStickersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => MinimalContentMessageResponseStickersInnerGuildStickerResponse(
        GuildStickerResponse.fromJson(json),
      ),
      1 => MinimalContentMessageResponseStickersInnerStandardStickerResponse(
        StandardStickerResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MinimalContentMessageResponseStickersInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MinimalContentMessageResponseStickersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MinimalContentMessageResponseStickersInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MinimalContentMessageResponseStickersInnerGuildStickerResponse
    extends MinimalContentMessageResponseStickersInner {
  const MinimalContentMessageResponseStickersInnerGuildStickerResponse(
    this.value,
  );

  final GuildStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MinimalContentMessageResponseStickersInnerGuildStickerResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseStickersInnerStandardStickerResponse
    extends MinimalContentMessageResponseStickersInner {
  const MinimalContentMessageResponseStickersInnerStandardStickerResponse(
    this.value,
  );

  final StandardStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MinimalContentMessageResponseStickersInnerStandardStickerResponse &&
        value == other.value;
  }
}
