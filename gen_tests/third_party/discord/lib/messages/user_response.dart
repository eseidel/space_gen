import 'package:discord/messages/user_avatar_decoration_response.dart';
import 'package:discord/messages/user_collectibles_response.dart';
import 'package:discord/messages/user_primary_guild_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/int53_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UserResponse {
  const UserResponse({
    required this.id,
    required this.username,
    required this.avatar,
    required this.discriminator,
    required this.publicFlags,
    required this.flags,
    required this.globalName,
    required this.primaryGuild,
    this.bot,
    this.system,
    this.banner,
    this.accentColor,
    this.avatarDecorationData,
    this.collectibles,
  });

  /// Converts a `Map<String, dynamic>` to a [UserResponse].
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserResponse',
      json,
      () => UserResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        username: json['username'] as String,
        avatar: checkedKey(json, 'avatar') as String?,
        discriminator: json['discriminator'] as String,
        publicFlags: json['public_flags'] as int,
        flags: Int53Type.fromJson(json['flags'] as int),
        bot: json['bot'] as bool?,
        system: json['system'] as bool?,
        banner: json['banner'] as String?,
        accentColor: json['accent_color'] as int?,
        globalName: checkedKey(json, 'global_name') as String?,
        avatarDecorationData: UserAvatarDecorationResponse.maybeFromJson(
          json['avatar_decoration_data'] as Map<String, dynamic>?,
        ),
        collectibles: UserCollectiblesResponse.maybeFromJson(
          json['collectibles'] as Map<String, dynamic>?,
        ),
        primaryGuild: UserPrimaryGuildResponse.maybeFromJson(
          checkedKey(json, 'primary_guild') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String username;
  final String? avatar;
  final String discriminator;
  final int publicFlags;
  final Int53Type flags;
  final bool? bot;
  final bool? system;
  final String? banner;
  final int? accentColor;
  final String? globalName;
  final UserAvatarDecorationResponse? avatarDecorationData;
  final UserCollectiblesResponse? collectibles;
  final UserPrimaryGuildResponse? primaryGuild;

  /// Converts a [UserResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'username': username,
      'avatar': avatar,
      'discriminator': discriminator,
      'public_flags': publicFlags,
      'flags': flags.toJson(),
      'bot': ?bot,
      'system': ?system,
      'banner': banner,
      'accent_color': accentColor,
      'global_name': globalName,
      'avatar_decoration_data': avatarDecorationData?.toJson(),
      'collectibles': collectibles?.toJson(),
      'primary_guild': primaryGuild?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    username,
    avatar,
    discriminator,
    publicFlags,
    flags,
    bot,
    system,
    banner,
    accentColor,
    globalName,
    avatarDecorationData,
    collectibles,
    primaryGuild,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserResponse &&
        id == other.id &&
        username == other.username &&
        avatar == other.avatar &&
        discriminator == other.discriminator &&
        publicFlags == other.publicFlags &&
        flags == other.flags &&
        bot == other.bot &&
        system == other.system &&
        banner == other.banner &&
        accentColor == other.accentColor &&
        globalName == other.globalName &&
        avatarDecorationData == other.avatarDecorationData &&
        collectibles == other.collectibles &&
        primaryGuild == other.primaryGuild;
  }
}
