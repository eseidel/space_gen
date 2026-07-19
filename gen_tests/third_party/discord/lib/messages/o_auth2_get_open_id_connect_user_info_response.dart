import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OAuth2GetOpenIdConnectUserInfoResponse {
  const OAuth2GetOpenIdConnectUserInfoResponse({
    required this.sub,
    this.email,
    this.emailVerified,
    this.preferredUsername,
    this.nickname,
    this.picture,
    this.locale,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OAuth2GetOpenIdConnectUserInfoResponse].
  factory OAuth2GetOpenIdConnectUserInfoResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OAuth2GetOpenIdConnectUserInfoResponse',
      json,
      () => OAuth2GetOpenIdConnectUserInfoResponse(
        sub: json['sub'] as String,
        email: json['email'] as String?,
        emailVerified: json['email_verified'] as bool?,
        preferredUsername: json['preferred_username'] as String?,
        nickname: json['nickname'] as String?,
        picture: json['picture'] as String?,
        locale: json['locale'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OAuth2GetOpenIdConnectUserInfoResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OAuth2GetOpenIdConnectUserInfoResponse.fromJson(json);
  }

  final String sub;
  final String? email;
  final bool? emailVerified;
  final String? preferredUsername;
  final String? nickname;
  final String? picture;
  final String? locale;

  /// Converts an [OAuth2GetOpenIdConnectUserInfoResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sub': sub,
      'email': email,
      'email_verified': ?emailVerified,
      'preferred_username': ?preferredUsername,
      'nickname': nickname,
      'picture': ?picture,
      'locale': ?locale,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    sub,
    email,
    emailVerified,
    preferredUsername,
    nickname,
    picture,
    locale,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OAuth2GetOpenIdConnectUserInfoResponse &&
        sub == other.sub &&
        email == other.email &&
        emailVerified == other.emailVerified &&
        preferredUsername == other.preferredUsername &&
        nickname == other.nickname &&
        picture == other.picture &&
        locale == other.locale;
  }
}
