import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/messages/standard_sticker_response.dart';
import 'package:meta/meta.dart';

sealed class MessageResponseStickersInner {
  const MessageResponseStickersInner();

  factory MessageResponseStickersInner.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => MessageResponseStickersInnerGuildStickerResponse(
        GuildStickerResponse.fromJson(json),
      ),
      1 => MessageResponseStickersInnerStandardStickerResponse(
        StandardStickerResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MessageResponseStickersInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageResponseStickersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageResponseStickersInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MessageResponseStickersInnerGuildStickerResponse
    extends MessageResponseStickersInner {
  const MessageResponseStickersInnerGuildStickerResponse(this.value);

  final GuildStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseStickersInnerGuildStickerResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseStickersInnerStandardStickerResponse
    extends MessageResponseStickersInner {
  const MessageResponseStickersInnerStandardStickerResponse(this.value);

  final StandardStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseStickersInnerStandardStickerResponse &&
        value == other.value;
  }
}
