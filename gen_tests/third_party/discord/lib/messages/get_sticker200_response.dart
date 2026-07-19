import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/messages/standard_sticker_response.dart';
import 'package:meta/meta.dart';

sealed class GetSticker200Response {
  const GetSticker200Response();

  factory GetSticker200Response.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => GetSticker200ResponseGuildStickerResponse(
        GuildStickerResponse.fromJson(json),
      ),
      1 => GetSticker200ResponseStandardStickerResponse(
        StandardStickerResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for GetSticker200Response",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSticker200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetSticker200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GetSticker200ResponseGuildStickerResponse
    extends GetSticker200Response {
  const GetSticker200ResponseGuildStickerResponse(this.value);

  final GuildStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSticker200ResponseGuildStickerResponse &&
        value == other.value;
  }
}

@immutable
final class GetSticker200ResponseStandardStickerResponse
    extends GetSticker200Response {
  const GetSticker200ResponseStandardStickerResponse(this.value);

  final StandardStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSticker200ResponseStandardStickerResponse &&
        value == other.value;
  }
}
