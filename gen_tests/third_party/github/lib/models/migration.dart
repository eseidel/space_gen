import 'package:github/model_helpers.dart';
import 'package:github/models/repository.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template migration}
/// Migration
/// A migration.
/// {@endtemplate}
@immutable
class Migration {
  /// {@macro migration}
  const Migration({
    required this.id,
    required this.owner,
    required this.guid,
    required this.state,
    required this.lockRepositories,
    required this.excludeMetadata,
    required this.excludeGitData,
    required this.excludeAttachments,
    required this.excludeReleases,
    required this.excludeOwnerProjects,
    required this.orgMetadataOnly,
    required this.repositories,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.nodeId,
    this.archiveUrl,
    this.exclude,
  });

  /// Converts a `Map<String, dynamic>` to a [Migration].
  factory Migration.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Migration',
      json,
      () => Migration(
        id: json['id'] as int,
        owner: SimpleUser.maybeFromJson(
          checkedKey(json, 'owner') as Map<String, dynamic>?,
        ),
        guid: json['guid'] as String,
        state: json['state'] as String,
        lockRepositories: json['lock_repositories'] as bool,
        excludeMetadata: json['exclude_metadata'] as bool,
        excludeGitData: json['exclude_git_data'] as bool,
        excludeAttachments: json['exclude_attachments'] as bool,
        excludeReleases: json['exclude_releases'] as bool,
        excludeOwnerProjects: json['exclude_owner_projects'] as bool,
        orgMetadataOnly: json['org_metadata_only'] as bool,
        repositories: (json['repositories'] as List)
            .map<Repository>(
              (e) => Repository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        url: Uri.parse(json['url'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        nodeId: json['node_id'] as String,
        archiveUrl: maybeParseUri(json['archive_url'] as String?),
        exclude: (json['exclude'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Migration? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Migration.fromJson(json);
  }

  /// Example: `79`
  final int id;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? owner;

  /// Example: `'0b989ba4-242f-11e5-81e1-c7b6966d2516'`
  final String guid;

  /// Example: `'pending'`
  final String state;

  /// Example: `true`
  final bool lockRepositories;
  final bool excludeMetadata;
  final bool excludeGitData;
  final bool excludeAttachments;
  final bool excludeReleases;
  final bool excludeOwnerProjects;
  final bool orgMetadataOnly;

  /// The repositories included in the migration. Only returned for export
  /// migrations.
  final List<Repository> repositories;

  /// Example: `'https://api.github.com/orgs/octo-org/migrations/79'`
  final Uri url;

  /// Example: `'2015-07-06T15:33:38-07:00'`
  final DateTime createdAt;

  /// Example: `'2015-07-06T15:33:38-07:00'`
  final DateTime updatedAt;
  final String nodeId;
  final Uri? archiveUrl;

  /// Exclude related items from being returned in the response in order to
  /// improve performance of the request. The array can include any of:
  /// `"repositories"`.
  final List<String>? exclude;

  /// Converts a [Migration] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner?.toJson(),
      'guid': guid,
      'state': state,
      'lock_repositories': lockRepositories,
      'exclude_metadata': excludeMetadata,
      'exclude_git_data': excludeGitData,
      'exclude_attachments': excludeAttachments,
      'exclude_releases': excludeReleases,
      'exclude_owner_projects': excludeOwnerProjects,
      'org_metadata_only': orgMetadataOnly,
      'repositories': repositories.map((e) => e.toJson()).toList(),
      'url': url.toString(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'node_id': nodeId,
      if (archiveUrl != null) 'archive_url': archiveUrl?.toString(),
      if (exclude != null) 'exclude': exclude,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    owner,
    guid,
    state,
    lockRepositories,
    excludeMetadata,
    excludeGitData,
    excludeAttachments,
    excludeReleases,
    excludeOwnerProjects,
    orgMetadataOnly,
    listHash(repositories),
    url,
    createdAt,
    updatedAt,
    nodeId,
    archiveUrl,
    listHash(exclude),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Migration &&
        id == other.id &&
        owner == other.owner &&
        guid == other.guid &&
        state == other.state &&
        lockRepositories == other.lockRepositories &&
        excludeMetadata == other.excludeMetadata &&
        excludeGitData == other.excludeGitData &&
        excludeAttachments == other.excludeAttachments &&
        excludeReleases == other.excludeReleases &&
        excludeOwnerProjects == other.excludeOwnerProjects &&
        orgMetadataOnly == other.orgMetadataOnly &&
        listsEqual(repositories, other.repositories) &&
        url == other.url &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        nodeId == other.nodeId &&
        archiveUrl == other.archiveUrl &&
        listsEqual(exclude, other.exclude);
  }
}
