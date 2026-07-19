import 'package:discord/model_helpers.dart';
import 'package:discord/models/o_auth2_scopes.dart';
import 'package:meta/meta.dart';

@immutable
class ApplicationOAuth2InstallParams {
  const ApplicationOAuth2InstallParams({this.scopes, this.permissions});

  /// Converts a `Map<String, dynamic>` to an [ApplicationOAuth2InstallParams].
  factory ApplicationOAuth2InstallParams.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApplicationOAuth2InstallParams',
      json,
      () => ApplicationOAuth2InstallParams(
        scopes: (json['scopes'] as List?)
            ?.map<OAuth2Scopes>((e) => OAuth2Scopes.fromJson(e as String))
            .toList(),
        permissions: json['permissions'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationOAuth2InstallParams? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationOAuth2InstallParams.fromJson(json);
  }

  final List<OAuth2Scopes>? scopes;
  final int? permissions;

  /// Converts an [ApplicationOAuth2InstallParams] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'scopes': scopes?.map((e) => e.toJson()).toList(),
      'permissions': permissions,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(scopes), permissions]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationOAuth2InstallParams &&
        listsEqual(scopes, other.scopes) &&
        permissions == other.permissions;
  }
}
