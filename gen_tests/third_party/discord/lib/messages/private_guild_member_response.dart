import 'package:discord/api_exception.dart';
import 'package:discord/messages/user_avatar_decoration_response.dart';
import 'package:discord/messages/user_collectibles_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateGuildMemberResponse {
  PrivateGuildMemberResponse({
    required this.avatar,
    required this.banner,
    required this.communicationDisabledUntil,
    required this.flags,
    required this.joinedAt,
    required this.nick,
    required this.pending,
    required this.premiumSince,
    required this.roles,
    required this.user,
    required this.mute,
    required this.deaf,
    this.avatarDecorationData,
    this.collectibles,
    this.permissions,
  }) {
    roles.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [PrivateGuildMemberResponse].
  factory PrivateGuildMemberResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PrivateGuildMemberResponse',
      json,
      () => PrivateGuildMemberResponse(
        avatar: checkedKey(json, 'avatar') as String?,
        avatarDecorationData: UserAvatarDecorationResponse.maybeFromJson(
          json['avatar_decoration_data'] as Map<String, dynamic>?,
        ),
        banner: checkedKey(json, 'banner') as String?,
        communicationDisabledUntil: maybeParseDateTime(
          checkedKey(json, 'communication_disabled_until') as String?,
        ),
        flags: json['flags'] as int,
        joinedAt: DateTime.parse(json['joined_at'] as String),
        nick: checkedKey(json, 'nick') as String?,
        pending: json['pending'] as bool,
        premiumSince: maybeParseDateTime(
          checkedKey(json, 'premium_since') as String?,
        ),
        roles: (json['roles'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        collectibles: UserCollectiblesResponse.maybeFromJson(
          json['collectibles'] as Map<String, dynamic>?,
        ),
        user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
        mute: json['mute'] as bool,
        deaf: json['deaf'] as bool,
        permissions: json['permissions'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateGuildMemberResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PrivateGuildMemberResponse.fromJson(json);
  }

  final String? avatar;
  final UserAvatarDecorationResponse? avatarDecorationData;
  final String? banner;
  final DateTime? communicationDisabledUntil;
  final int flags;
  final DateTime joinedAt;
  final String? nick;
  final bool pending;
  final DateTime? premiumSince;
  final List<SnowflakeType> roles;
  final UserCollectiblesResponse? collectibles;
  final UserResponse user;
  final bool mute;
  final bool deaf;
  final String? permissions;

  /// Converts a [PrivateGuildMemberResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'avatar_decoration_data': avatarDecorationData?.toJson(),
      'banner': banner,
      'communication_disabled_until': communicationDisabledUntil
          ?.toIso8601String(),
      'flags': flags,
      'joined_at': joinedAt.toIso8601String(),
      'nick': nick,
      'pending': pending,
      'premium_since': premiumSince?.toIso8601String(),
      'roles': roles.map((e) => e.toJson()).toList(),
      'collectibles': collectibles?.toJson(),
      'user': user.toJson(),
      'mute': mute,
      'deaf': deaf,
      'permissions': ?permissions,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    avatar,
    avatarDecorationData,
    banner,
    communicationDisabledUntil,
    flags,
    joinedAt,
    nick,
    pending,
    premiumSince,
    listHash(roles),
    collectibles,
    user,
    mute,
    deaf,
    permissions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateGuildMemberResponse &&
        avatar == other.avatar &&
        avatarDecorationData == other.avatarDecorationData &&
        banner == other.banner &&
        communicationDisabledUntil == other.communicationDisabledUntil &&
        flags == other.flags &&
        joinedAt == other.joinedAt &&
        nick == other.nick &&
        pending == other.pending &&
        premiumSince == other.premiumSince &&
        listsEqual(roles, other.roles) &&
        collectibles == other.collectibles &&
        user == other.user &&
        mute == other.mute &&
        deaf == other.deaf &&
        permissions == other.permissions;
  }
}
