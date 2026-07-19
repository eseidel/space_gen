import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/messages/standard_sticker_response.dart';
import 'package:meta/meta.dart';

sealed class BasicMessageResponseStickersInner {
  const BasicMessageResponseStickersInner();

  factory BasicMessageResponseStickersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => BasicMessageResponseStickersInnerGuildStickerResponse(
        GuildStickerResponse.fromJson(json),
      ),
      1 => BasicMessageResponseStickersInnerStandardStickerResponse(
        StandardStickerResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for BasicMessageResponseStickersInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BasicMessageResponseStickersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BasicMessageResponseStickersInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class BasicMessageResponseStickersInnerGuildStickerResponse
    extends BasicMessageResponseStickersInner {
  const BasicMessageResponseStickersInnerGuildStickerResponse(this.value);

  final GuildStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicMessageResponseStickersInnerGuildStickerResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseStickersInnerStandardStickerResponse
    extends BasicMessageResponseStickersInner {
  const BasicMessageResponseStickersInnerStandardStickerResponse(this.value);

  final StandardStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicMessageResponseStickersInnerStandardStickerResponse &&
        value == other.value;
  }
}
