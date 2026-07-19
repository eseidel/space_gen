import 'package:discord/messages/application_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/o_auth2_scopes.dart';
import 'package:meta/meta.dart';

@immutable
class OAuth2GetAuthorizationResponse {
  const OAuth2GetAuthorizationResponse({
    required this.application,
    required this.expires,
    required this.scopes,
    this.user,
  });

  /// Converts a `Map<String, dynamic>` to an [OAuth2GetAuthorizationResponse].
  factory OAuth2GetAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OAuth2GetAuthorizationResponse',
      json,
      () => OAuth2GetAuthorizationResponse(
        application: ApplicationResponse.fromJson(
          json['application'] as Map<String, dynamic>,
        ),
        expires: DateTime.parse(json['expires'] as String),
        scopes: (json['scopes'] as List)
            .map<OAuth2Scopes>((e) => OAuth2Scopes.fromJson(e as String))
            .toList(),
        user: UserResponse.maybeFromJson(json['user'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OAuth2GetAuthorizationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OAuth2GetAuthorizationResponse.fromJson(json);
  }

  final ApplicationResponse application;
  final DateTime expires;
  final List<OAuth2Scopes> scopes;
  final UserResponse? user;

  /// Converts an [OAuth2GetAuthorizationResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'application': application.toJson(),
      'expires': expires.toIso8601String(),
      'scopes': scopes.map((e) => e.toJson()).toList(),
      'user': ?user?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([application, expires, listHash(scopes), user]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OAuth2GetAuthorizationResponse &&
        application == other.application &&
        expires == other.expires &&
        listsEqual(scopes, other.scopes) &&
        user == other.user;
  }
}
