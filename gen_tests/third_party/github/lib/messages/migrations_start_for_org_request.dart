import 'package:github/model_helpers.dart';
import 'package:github/models/migrations_start_for_org_request_exclude_inner.dart';
import 'package:meta/meta.dart';

@immutable
class MigrationsStartForOrgRequest {
  const MigrationsStartForOrgRequest({
    required this.repositories,
    this.lockRepositories = false,
    this.excludeMetadata = false,
    this.excludeGitData = false,
    this.excludeAttachments = false,
    this.excludeReleases = false,
    this.excludeOwnerProjects = false,
    this.orgMetadataOnly = false,
    this.exclude,
  });

  /// Converts a `Map<String, dynamic>` to a [MigrationsStartForOrgRequest].
  factory MigrationsStartForOrgRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MigrationsStartForOrgRequest',
      json,
      () => MigrationsStartForOrgRequest(
        repositories: (json['repositories'] as List).cast<String>(),
        lockRepositories: (json['lock_repositories'] as bool?) ?? false,
        excludeMetadata: (json['exclude_metadata'] as bool?) ?? false,
        excludeGitData: (json['exclude_git_data'] as bool?) ?? false,
        excludeAttachments: (json['exclude_attachments'] as bool?) ?? false,
        excludeReleases: (json['exclude_releases'] as bool?) ?? false,
        excludeOwnerProjects:
            (json['exclude_owner_projects'] as bool?) ?? false,
        orgMetadataOnly: (json['org_metadata_only'] as bool?) ?? false,
        exclude: (json['exclude'] as List?)
            ?.map<MigrationsStartForOrgRequestExcludeInner>(
              (e) => MigrationsStartForOrgRequestExcludeInner.fromJson(
                e as String,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MigrationsStartForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsStartForOrgRequest.fromJson(json);
  }

  /// A list of arrays indicating which repositories should be migrated.
  final List<String> repositories;

  /// Indicates whether repositories should be locked (to prevent
  /// manipulation) while migrating data.
  /// Example: `true`
  final bool lockRepositories;

  /// Indicates whether metadata should be excluded and only git source should
  /// be included for the migration.
  final bool excludeMetadata;

  /// Indicates whether the repository git data should be excluded from the
  /// migration.
  final bool excludeGitData;

  /// Indicates whether attachments should be excluded from the migration (to
  /// reduce migration archive file size).
  /// Example: `true`
  final bool excludeAttachments;

  /// Indicates whether releases should be excluded from the migration (to
  /// reduce migration archive file size).
  /// Example: `true`
  final bool excludeReleases;

  /// Indicates whether projects owned by the organization or users should be
  /// excluded. from the migration.
  /// Example: `true`
  final bool excludeOwnerProjects;

  /// Indicates whether this should only include organization metadata
  /// (repositories array should be empty and will ignore other flags).
  /// Example: `true`
  final bool orgMetadataOnly;

  /// Exclude related items from being returned in the response in order to
  /// improve performance of the request.
  final List<MigrationsStartForOrgRequestExcludeInner>? exclude;

  /// Converts a [MigrationsStartForOrgRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'repositories': repositories,
      'lock_repositories': lockRepositories,
      'exclude_metadata': excludeMetadata,
      'exclude_git_data': excludeGitData,
      'exclude_attachments': excludeAttachments,
      'exclude_releases': excludeReleases,
      'exclude_owner_projects': excludeOwnerProjects,
      'org_metadata_only': orgMetadataOnly,
      'exclude': exclude?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(repositories),
    lockRepositories,
    excludeMetadata,
    excludeGitData,
    excludeAttachments,
    excludeReleases,
    excludeOwnerProjects,
    orgMetadataOnly,
    listHash(exclude),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MigrationsStartForOrgRequest &&
        listsEqual(repositories, other.repositories) &&
        lockRepositories == other.lockRepositories &&
        excludeMetadata == other.excludeMetadata &&
        excludeGitData == other.excludeGitData &&
        excludeAttachments == other.excludeAttachments &&
        excludeReleases == other.excludeReleases &&
        excludeOwnerProjects == other.excludeOwnerProjects &&
        orgMetadataOnly == other.orgMetadataOnly &&
        listsEqual(exclude, other.exclude);
  }
}
