import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProvisionalTokenResponse {
  const ProvisionalTokenResponse({
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.scope,
    required this.idToken,
    this.refreshToken,
    this.scopes,
    this.expiresAtS,
  });

  /// Converts a `Map<String, dynamic>` to a [ProvisionalTokenResponse].
  factory ProvisionalTokenResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProvisionalTokenResponse',
      json,
      () => ProvisionalTokenResponse(
        tokenType: json['token_type'] as String,
        accessToken: json['access_token'] as String,
        expiresIn: json['expires_in'] as int,
        scope: json['scope'] as String,
        idToken: json['id_token'] as String,
        refreshToken: json['refresh_token'] as String?,
        scopes: (json['scopes'] as List?)?.cast<String>(),
        expiresAtS: json['expires_at_s'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProvisionalTokenResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProvisionalTokenResponse.fromJson(json);
  }

  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String scope;
  final String idToken;
  final String? refreshToken;
  final List<String>? scopes;
  final int? expiresAtS;

  /// Converts a [ProvisionalTokenResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'token_type': tokenType,
      'access_token': accessToken,
      'expires_in': expiresIn,
      'scope': scope,
      'id_token': idToken,
      'refresh_token': refreshToken,
      'scopes': scopes,
      'expires_at_s': expiresAtS,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    tokenType,
    accessToken,
    expiresIn,
    scope,
    idToken,
    refreshToken,
    listHash(scopes),
    expiresAtS,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProvisionalTokenResponse &&
        tokenType == other.tokenType &&
        accessToken == other.accessToken &&
        expiresIn == other.expiresIn &&
        scope == other.scope &&
        idToken == other.idToken &&
        refreshToken == other.refreshToken &&
        listsEqual(scopes, other.scopes) &&
        expiresAtS == other.expiresAtS;
  }
}
