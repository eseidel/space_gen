import 'package:github/model_helpers.dart';
import 'package:github/models/app_permissions.dart';
import 'package:github/models/scoped_installation_repository_selection.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template scoped_installation}
/// Scoped Installation
/// {@endtemplate}
@immutable
class ScopedInstallation {
  /// {@macro scoped_installation}
  const ScopedInstallation({
    required this.permissions,
    required this.repositorySelection,
    required this.singleFileName,
    required this.repositoriesUrl,
    required this.account,
    this.hasMultipleSingleFiles,
    this.singleFilePaths,
  });

  /// Converts a `Map<String, dynamic>` to a [ScopedInstallation].
  factory ScopedInstallation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScopedInstallation',
      json,
      () => ScopedInstallation(
        permissions: AppPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>,
        ),
        repositorySelection: ScopedInstallationRepositorySelection.fromJson(
          json['repository_selection'] as String,
        ),
        singleFileName: checkedKey(json, 'single_file_name') as String?,
        hasMultipleSingleFiles: json['has_multiple_single_files'] as bool?,
        singleFilePaths: (json['single_file_paths'] as List?)?.cast<String>(),
        repositoriesUrl: Uri.parse(json['repositories_url'] as String),
        account: SimpleUser.fromJson(json['account'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScopedInstallation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScopedInstallation.fromJson(json);
  }

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
  final AppPermissions permissions;

  /// Describe whether all repositories have been selected or there's a
  /// selection involved
  final ScopedInstallationRepositorySelection repositorySelection;

  /// Example: `'config.yaml'`
  final String? singleFileName;

  /// Example: `true`
  final bool? hasMultipleSingleFiles;

  /// Example: `'config.yml'`
  /// Example: `'.github/issue_TEMPLATE.md'`
  final List<String>? singleFilePaths;

  /// Example: `'https://api.github.com/users/octocat/repos'`
  final Uri repositoriesUrl;

  /// Simple User
  /// A GitHub user.
  final SimpleUser account;

  /// Converts a [ScopedInstallation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'permissions': permissions.toJson(),
      'repository_selection': repositorySelection.toJson(),
      'single_file_name': singleFileName,
      'has_multiple_single_files': hasMultipleSingleFiles,
      'single_file_paths': singleFilePaths,
      'repositories_url': repositoriesUrl.toString(),
      'account': account.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    permissions,
    repositorySelection,
    singleFileName,
    hasMultipleSingleFiles,
    listHash(singleFilePaths),
    repositoriesUrl,
    account,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScopedInstallation &&
        permissions == other.permissions &&
        repositorySelection == other.repositorySelection &&
        singleFileName == other.singleFileName &&
        hasMultipleSingleFiles == other.hasMultipleSingleFiles &&
        listsEqual(singleFilePaths, other.singleFilePaths) &&
        repositoriesUrl == other.repositoriesUrl &&
        account == other.account;
  }
}
