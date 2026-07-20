import 'dart:typed_data';
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BotAccountPatchRequest {
  BotAccountPatchRequest({required this.username, this.avatar, this.banner}) {
    username.validate(minLength: 2, maxLength: 32);
  }

  /// Converts a `Map<String, dynamic>` to a [BotAccountPatchRequest].
  factory BotAccountPatchRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BotAccountPatchRequest',
      json,
      () => BotAccountPatchRequest(
        username: json['username'] as String,
        avatar: maybeBase64Decode(json['avatar'] as String?),
        banner: maybeBase64Decode(json['banner'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BotAccountPatchRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BotAccountPatchRequest.fromJson(json);
  }

  final String username;
  final Uint8List? avatar;
  final Uint8List? banner;

  /// Converts a [BotAccountPatchRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'avatar': maybeBase64Encode(avatar),
      'banner': maybeBase64Encode(banner),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([username, listHash(avatar), listHash(banner)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BotAccountPatchRequest &&
        username == other.username &&
        listsEqual(avatar, other.avatar) &&
        listsEqual(banner, other.banner);
  }
}
