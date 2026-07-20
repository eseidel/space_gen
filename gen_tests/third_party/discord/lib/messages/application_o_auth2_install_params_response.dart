import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/o_auth2_scopes.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationOAuth2InstallParamsResponse {
  ApplicationOAuth2InstallParamsResponse({
    required this.scopes,
    required this.permissions,
  }) {
    scopes.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationOAuth2InstallParamsResponse].
  factory ApplicationOAuth2InstallParamsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationOAuth2InstallParamsResponse',
      json,
      () => ApplicationOAuth2InstallParamsResponse(
        scopes: (json['scopes'] as List)
            .map<OAuth2Scopes>((e) => OAuth2Scopes.fromJson(e as String))
            .toList(),
        permissions: json['permissions'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationOAuth2InstallParamsResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationOAuth2InstallParamsResponse.fromJson(json);
  }

  final List<OAuth2Scopes> scopes;
  final String permissions;

  /// Converts an [ApplicationOAuth2InstallParamsResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'scopes': scopes.map((e) => e.toJson()).toList(),
      'permissions': permissions,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(scopes), permissions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationOAuth2InstallParamsResponse &&
        listsEqual(scopes, other.scopes) &&
        permissions == other.permissions;
  }
}
