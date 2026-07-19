import 'package:discord/messages/user_avatar_decoration_response.dart';
import 'package:discord/messages/user_collectibles_response.dart';
import 'package:discord/messages/user_primary_guild_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/available_locales_enum.dart';
import 'package:discord/models/int53_type.dart';
import 'package:discord/models/premium_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UserPiiResponse {
  const UserPiiResponse({
    required this.id,
    required this.username,
    required this.avatar,
    required this.discriminator,
    required this.publicFlags,
    required this.flags,
    required this.globalName,
    required this.mfaEnabled,
    required this.locale,
    this.bot,
    this.system,
    this.banner,
    this.accentColor,
    this.avatarDecorationData,
    this.collectibles,
    this.primaryGuild,
    this.premiumType,
    this.email,
    this.verified,
  });

  /// Converts a `Map<String, dynamic>` to a [UserPiiResponse].
  factory UserPiiResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserPiiResponse',
      json,
      () => UserPiiResponse(
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
          json['primary_guild'] as Map<String, dynamic>?,
        ),
        mfaEnabled: json['mfa_enabled'] as bool,
        locale: AvailableLocalesEnum.fromJson(json['locale'] as String),
        premiumType: PremiumTypes.maybeFromJson(json['premium_type'] as int?),
        email: json['email'] as String?,
        verified: json['verified'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserPiiResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserPiiResponse.fromJson(json);
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
  final bool mfaEnabled;
  final AvailableLocalesEnum locale;
  final PremiumTypes? premiumType;
  final String? email;
  final bool? verified;

  /// Converts a [UserPiiResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'username': username,
      'avatar': avatar,
      'discriminator': discriminator,
      'public_flags': publicFlags,
      'flags': flags.toJson(),
      if (bot != null) 'bot': bot,
      if (system != null) 'system': system,
      'banner': banner,
      'accent_color': accentColor,
      'global_name': globalName,
      'avatar_decoration_data': avatarDecorationData?.toJson(),
      'collectibles': collectibles?.toJson(),
      'primary_guild': primaryGuild?.toJson(),
      'mfa_enabled': mfaEnabled,
      'locale': locale.toJson(),
      if (premiumType != null) 'premium_type': premiumType?.toJson(),
      'email': email,
      if (verified != null) 'verified': verified,
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
    mfaEnabled,
    locale,
    premiumType,
    email,
    verified,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserPiiResponse &&
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
        primaryGuild == other.primaryGuild &&
        mfaEnabled == other.mfaEnabled &&
        locale == other.locale &&
        premiumType == other.premiumType &&
        email == other.email &&
        verified == other.verified;
  }
}
