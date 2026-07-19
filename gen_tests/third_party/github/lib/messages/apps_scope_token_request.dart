import 'package:github/model_helpers.dart';
import 'package:github/models/app_permissions.dart';
import 'package:meta/meta.dart';

@immutable
class AppsScopeTokenRequest {
  const AppsScopeTokenRequest({
    required this.accessToken,
    this.target,
    this.targetId,
    this.repositories,
    this.repositoryIds,
    this.permissions,
  });

  /// Converts a `Map<String, dynamic>` to an [AppsScopeTokenRequest].
  factory AppsScopeTokenRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AppsScopeTokenRequest',
      json,
      () => AppsScopeTokenRequest(
        accessToken: json['access_token'] as String,
        target: json['target'] as String?,
        targetId: json['target_id'] as int?,
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
  static AppsScopeTokenRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AppsScopeTokenRequest.fromJson(json);
  }

  /// The access token used to authenticate to the GitHub API.
  /// Example: `'e72e16c7e42f292c6912e7710c838347ae178b4a'`
  final String accessToken;

  /// The name of the user or organization to scope the user access token to.
  /// **Required** unless `target_id` is specified.
  /// Example: `'octocat'`
  final String? target;

  /// The ID of the user or organization to scope the user access token to.
  /// **Required** unless `target` is specified.
  /// Example: `1`
  final int? targetId;

  /// The list of repository names to scope the user access token to.
  /// `repositories` may not be specified if `repository_ids` is specified.
  final List<String>? repositories;

  /// The list of repository IDs to scope the user access token to.
  /// `repository_ids` may not be specified if `repositories` is specified.
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

  /// Converts an [AppsScopeTokenRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'target': target,
      'target_id': targetId,
      'repositories': repositories,
      'repository_ids': repositoryIds,
      'permissions': permissions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    accessToken,
    target,
    targetId,
    listHash(repositories),
    listHash(repositoryIds),
    permissions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsScopeTokenRequest &&
        accessToken == other.accessToken &&
        target == other.target &&
        targetId == other.targetId &&
        listsEqual(repositories, other.repositories) &&
        listsEqual(repositoryIds, other.repositoryIds) &&
        permissions == other.permissions;
  }
}
