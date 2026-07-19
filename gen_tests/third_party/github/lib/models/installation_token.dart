import 'package:github/model_helpers.dart';
import 'package:github/models/app_permissions.dart';
import 'package:github/models/installation_token_repository_selection.dart';
import 'package:github/models/repository.dart';
import 'package:meta/meta.dart';

/// {@template installation_token}
/// Installation Token
/// Authentication token for a GitHub App installed on a user or org.
/// {@endtemplate}
@immutable
class InstallationToken {
  /// {@macro installation_token}
  const InstallationToken({
    required this.token,
    required this.expiresAt,
    this.permissions,
    this.repositorySelection,
    this.repositories,
    this.singleFile,
    this.hasMultipleSingleFiles,
    this.singleFilePaths,
  });

  /// Converts a `Map<String, dynamic>` to an [InstallationToken].
  factory InstallationToken.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallationToken',
      json,
      () => InstallationToken(
        token: json['token'] as String,
        expiresAt: json['expires_at'] as String,
        permissions: AppPermissions.maybeFromJson(
          json['permissions'] as Map<String, dynamic>?,
        ),
        repositorySelection: InstallationTokenRepositorySelection.maybeFromJson(
          json['repository_selection'] as String?,
        ),
        repositories: (json['repositories'] as List?)
            ?.map<Repository>(
              (e) => Repository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        singleFile: json['single_file'] as String?,
        hasMultipleSingleFiles: json['has_multiple_single_files'] as bool?,
        singleFilePaths: (json['single_file_paths'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallationToken? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InstallationToken.fromJson(json);
  }

  final String token;
  final String expiresAt;

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
  final InstallationTokenRepositorySelection? repositorySelection;
  final List<Repository>? repositories;

  /// Example: `'README.md'`
  final String? singleFile;

  /// Example: `true`
  final bool? hasMultipleSingleFiles;

  /// Example: `'config.yml'`
  /// Example: `'.github/issue_TEMPLATE.md'`
  final List<String>? singleFilePaths;

  /// Converts an [InstallationToken] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expires_at': expiresAt,
      if (permissions != null) 'permissions': permissions?.toJson(),
      if (repositorySelection != null)
        'repository_selection': repositorySelection?.toJson(),
      if (repositories != null)
        'repositories': repositories?.map((e) => e.toJson()).toList(),
      if (singleFile != null) 'single_file': singleFile,
      if (hasMultipleSingleFiles != null)
        'has_multiple_single_files': hasMultipleSingleFiles,
      if (singleFilePaths != null) 'single_file_paths': singleFilePaths,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    token,
    expiresAt,
    permissions,
    repositorySelection,
    listHash(repositories),
    singleFile,
    hasMultipleSingleFiles,
    listHash(singleFilePaths),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallationToken &&
        token == other.token &&
        expiresAt == other.expiresAt &&
        permissions == other.permissions &&
        repositorySelection == other.repositorySelection &&
        listsEqual(repositories, other.repositories) &&
        singleFile == other.singleFile &&
        hasMultipleSingleFiles == other.hasMultipleSingleFiles &&
        listsEqual(singleFilePaths, other.singleFilePaths);
  }
}
