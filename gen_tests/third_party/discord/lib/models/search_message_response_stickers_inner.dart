// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/messages/standard_sticker_response.dart';
import 'package:meta/meta.dart';

sealed class SearchMessageResponseStickersInner {
  const SearchMessageResponseStickersInner();

  factory SearchMessageResponseStickersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => SearchMessageResponseStickersInnerGuildStickerResponse(
        GuildStickerResponse.fromJson(json),
      ),
      1 => SearchMessageResponseStickersInnerStandardStickerResponse(
        StandardStickerResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SearchMessageResponseStickersInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchMessageResponseStickersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SearchMessageResponseStickersInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SearchMessageResponseStickersInnerGuildStickerResponse
    extends SearchMessageResponseStickersInner {
  const SearchMessageResponseStickersInnerGuildStickerResponse(this.value);

  final GuildStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchMessageResponseStickersInnerGuildStickerResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseStickersInnerStandardStickerResponse
    extends SearchMessageResponseStickersInner {
  const SearchMessageResponseStickersInnerStandardStickerResponse(this.value);

  final StandardStickerResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchMessageResponseStickersInnerStandardStickerResponse &&
        value == other.value;
  }
}
