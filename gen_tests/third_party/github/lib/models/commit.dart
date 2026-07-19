// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/commit_author.dart';
import 'package:github/models/commit_commit.dart';
import 'package:github/models/commit_committer.dart';
import 'package:github/models/commit_parents_inner.dart';
import 'package:github/models/commit_stats.dart';
import 'package:github/models/diff_entry.dart';
import 'package:meta/meta.dart';

/// {@template commit}
/// Commit
/// Commit
/// {@endtemplate}
@immutable
class Commit {
  /// {@macro commit}
  const Commit({
    required this.url,
    required this.sha,
    required this.nodeId,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
    required this.author,
    required this.committer,
    required this.parents,
    this.stats,
    this.files,
  });

  /// Converts a `Map<String, dynamic>` to a [Commit].
  factory Commit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Commit',
      json,
      () => Commit(
        url: Uri.parse(json['url'] as String),
        sha: json['sha'] as String,
        nodeId: json['node_id'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        commentsUrl: Uri.parse(json['comments_url'] as String),
        commit: CommitCommit.fromJson(json['commit'] as Map<String, dynamic>),
        author: CommitAuthor.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        committer: CommitCommitter.maybeFromJson(
          checkedKey(json, 'committer') as Map<String, dynamic>?,
        ),
        parents: (json['parents'] as List)
            .map<CommitParentsInner>(
              (e) => CommitParentsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        stats: CommitStats.maybeFromJson(
          json['stats'] as Map<String, dynamic>?,
        ),
        files: (json['files'] as List?)
            ?.map<DiffEntry>(
              (e) => DiffEntry.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Commit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Commit.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final Uri url;

  /// Example: `'6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final String sha;

  /// Example:
  /// `'MDY6Q29tbWl0NmRjYjA5YjViNTc4NzVmMzM0ZjYxYWViZWQ2OTVlMmU0MTkzZGI1ZQ=='`
  final String nodeId;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/commit/6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final Uri htmlUrl;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e/comments'`
  final Uri commentsUrl;
  final CommitCommit commit;
  final CommitAuthor? author;
  final CommitCommitter? committer;
  final List<CommitParentsInner> parents;
  final CommitStats? stats;
  final List<DiffEntry>? files;

  /// Converts a [Commit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'sha': sha,
      'node_id': nodeId,
      'html_url': htmlUrl.toString(),
      'comments_url': commentsUrl.toString(),
      'commit': commit.toJson(),
      'author': author?.toJson(),
      'committer': committer?.toJson(),
      'parents': parents.map((e) => e.toJson()).toList(),
      'stats': stats?.toJson(),
      'files': files?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    sha,
    nodeId,
    htmlUrl,
    commentsUrl,
    commit,
    author,
    committer,
    listHash(parents),
    stats,
    listHash(files),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Commit &&
        url == other.url &&
        sha == other.sha &&
        nodeId == other.nodeId &&
        htmlUrl == other.htmlUrl &&
        commentsUrl == other.commentsUrl &&
        commit == other.commit &&
        author == other.author &&
        committer == other.committer &&
        listsEqual(parents, other.parents) &&
        stats == other.stats &&
        listsEqual(files, other.files);
  }
}
