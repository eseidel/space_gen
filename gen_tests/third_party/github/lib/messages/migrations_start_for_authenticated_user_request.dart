// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/migrations_start_for_authenticated_user_request_exclude_inner.dart';
import 'package:meta/meta.dart';

@immutable
class MigrationsStartForAuthenticatedUserRequest {
  const MigrationsStartForAuthenticatedUserRequest({
    required this.repositories,
    this.lockRepositories,
    this.excludeMetadata,
    this.excludeGitData,
    this.excludeAttachments,
    this.excludeReleases,
    this.excludeOwnerProjects,
    this.orgMetadataOnly = false,
    this.exclude,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MigrationsStartForAuthenticatedUserRequest].
  factory MigrationsStartForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MigrationsStartForAuthenticatedUserRequest',
      json,
      () => MigrationsStartForAuthenticatedUserRequest(
        lockRepositories: json['lock_repositories'] as bool?,
        excludeMetadata: json['exclude_metadata'] as bool?,
        excludeGitData: json['exclude_git_data'] as bool?,
        excludeAttachments: json['exclude_attachments'] as bool?,
        excludeReleases: json['exclude_releases'] as bool?,
        excludeOwnerProjects: json['exclude_owner_projects'] as bool?,
        orgMetadataOnly: (json['org_metadata_only'] as bool?) ?? false,
        exclude: (json['exclude'] as List?)
            ?.map<MigrationsStartForAuthenticatedUserRequestExcludeInner>(
              (e) =>
                  MigrationsStartForAuthenticatedUserRequestExcludeInner.fromJson(
                    e as String,
                  ),
            )
            .toList(),
        repositories: (json['repositories'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MigrationsStartForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsStartForAuthenticatedUserRequest.fromJson(json);
  }

  /// Lock the repositories being migrated at the start of the migration
  /// Example: `true`
  final bool? lockRepositories;

  /// Indicates whether metadata should be excluded and only git source should
  /// be included for the migration.
  /// Example: `true`
  final bool? excludeMetadata;

  /// Indicates whether the repository git data should be excluded from the
  /// migration.
  /// Example: `true`
  final bool? excludeGitData;

  /// Do not include attachments in the migration
  /// Example: `true`
  final bool? excludeAttachments;

  /// Do not include releases in the migration
  /// Example: `true`
  final bool? excludeReleases;

  /// Indicates whether projects owned by the organization or users should be
  /// excluded.
  /// Example: `true`
  final bool? excludeOwnerProjects;

  /// Indicates whether this should only include organization metadata
  /// (repositories array should be empty and will ignore other flags).
  /// Example: `true`
  final bool orgMetadataOnly;

  /// Exclude attributes from the API response to improve performance
  /// Example: `'repositories'`
  final List<MigrationsStartForAuthenticatedUserRequestExcludeInner>? exclude;
  final List<String> repositories;

  /// Converts a [MigrationsStartForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'lock_repositories': lockRepositories,
      'exclude_metadata': excludeMetadata,
      'exclude_git_data': excludeGitData,
      'exclude_attachments': excludeAttachments,
      'exclude_releases': excludeReleases,
      'exclude_owner_projects': excludeOwnerProjects,
      'org_metadata_only': orgMetadataOnly,
      'exclude': exclude?.map((e) => e.toJson()).toList(),
      'repositories': repositories,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    lockRepositories,
    excludeMetadata,
    excludeGitData,
    excludeAttachments,
    excludeReleases,
    excludeOwnerProjects,
    orgMetadataOnly,
    listHash(exclude),
    listHash(repositories),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MigrationsStartForAuthenticatedUserRequest &&
        lockRepositories == other.lockRepositories &&
        excludeMetadata == other.excludeMetadata &&
        excludeGitData == other.excludeGitData &&
        excludeAttachments == other.excludeAttachments &&
        excludeReleases == other.excludeReleases &&
        excludeOwnerProjects == other.excludeOwnerProjects &&
        orgMetadataOnly == other.orgMetadataOnly &&
        listsEqual(exclude, other.exclude) &&
        listsEqual(repositories, other.repositories);
  }
}
