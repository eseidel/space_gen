import 'package:github/model_helpers.dart';
import 'package:github/models/app_permissions.dart';
import 'package:meta/meta.dart';

@immutable
class AppsCreateInstallationAccessTokenRequest {
  const AppsCreateInstallationAccessTokenRequest({
    this.repositories,
    this.repositoryIds,
    this.permissions,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [AppsCreateInstallationAccessTokenRequest].
  factory AppsCreateInstallationAccessTokenRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'AppsCreateInstallationAccessTokenRequest',
      json,
      () => AppsCreateInstallationAccessTokenRequest(
        repositories: (json['repositories'] as List?)?.cast<String>(),
        repositoryIds: (json['repository_ids'] as List?)?.cast<int>(),
        permissions: AppPermissions.maybeFromJson(
          json['permissions'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsCreateInstallationAccessTokenRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppsCreateInstallationAccessTokenRequest.fromJson(json);
  }

  /// List of repository names that the token should have access to
  final List<String>? repositories;

  /// List of repository IDs that the token should have access to
  /// Example: `1`
  final List<int>? repositoryIds;

  /// App Permissions
  /// The permissions granted to the user access token.
  /// Example:
  /// ```json
  /// {
  ///   "contents": "read",
  ///   "issues": "read",
  ///   "deployments": "write",
  ///   "single_file": "read"
  /// }
  /// ```
  final AppPermissions? permissions;

  /// Converts an [AppsCreateInstallationAccessTokenRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (repositories != null) 'repositories': repositories,
      if (repositoryIds != null) 'repository_ids': repositoryIds,
      if (permissions != null) 'permissions': permissions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(repositories),
    listHash(repositoryIds),
    permissions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsCreateInstallationAccessTokenRequest &&
        listsEqual(repositories, other.repositories) &&
        listsEqual(repositoryIds, other.repositoryIds) &&
        permissions == other.permissions;
  }
}
