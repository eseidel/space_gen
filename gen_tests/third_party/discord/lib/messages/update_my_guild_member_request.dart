import 'dart:typed_data';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateMyGuildMemberRequest {
  const UpdateMyGuildMemberRequest({
    this.nick,
    this.avatar,
    this.bio,
    this.banner,
  });

  /// Converts a `Map<String, dynamic>` to a [UpdateMyGuildMemberRequest].
  factory UpdateMyGuildMemberRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateMyGuildMemberRequest',
      json,
      () => UpdateMyGuildMemberRequest(
        nick: json['nick'] as String?,
        avatar: maybeBase64Decode(json['avatar'] as String?),
        bio: json['bio'] as String?,
        banner: maybeBase64Decode(json['banner'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateMyGuildMemberRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateMyGuildMemberRequest.fromJson(json);
  }

  final String? nick;
  final Uint8List? avatar;
  final String? bio;
  final Uint8List? banner;

  /// Converts a [UpdateMyGuildMemberRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'nick': nick,
      'avatar': maybeBase64Encode(avatar),
      'bio': bio,
      'banner': maybeBase64Encode(banner),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([nick, listHash(avatar), bio, listHash(banner)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateMyGuildMemberRequest &&
        nick == other.nick &&
        listsEqual(avatar, other.avatar) &&
        bio == other.bio &&
        listsEqual(banner, other.banner);
  }
}
