import 'package:github/model_helpers.dart';
import 'package:github/models/git_commit_author.dart';
import 'package:github/models/git_commit_committer.dart';
import 'package:github/models/git_commit_parents_inner.dart';
import 'package:github/models/git_commit_tree.dart';
import 'package:github/models/git_commit_verification.dart';
import 'package:meta/meta.dart';

/// {@template git_commit}
/// Git Commit
/// Low-level Git commit operations within a repository
/// {@endtemplate}
@immutable
class GitCommit {
  /// {@macro git_commit}
  const GitCommit({
    required this.sha,
    required this.nodeId,
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.parents,
    required this.verification,
    required this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [GitCommit].
  factory GitCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCommit',
      json,
      () => GitCommit(
        sha: json['sha'] as String,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        author: GitCommitAuthor.fromJson(
          json['author'] as Map<String, dynamic>,
        ),
        committer: GitCommitCommitter.fromJson(
          json['committer'] as Map<String, dynamic>,
        ),
        message: json['message'] as String,
        tree: GitCommitTree.fromJson(json['tree'] as Map<String, dynamic>),
        parents: (json['parents'] as List)
            .map<GitCommitParentsInner>(
              (e) => GitCommitParentsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        verification: GitCommitVerification.fromJson(
          json['verification'] as Map<String, dynamic>,
        ),
        htmlUrl: Uri.parse(json['html_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCommit.fromJson(json);
  }

  /// SHA for the commit
  /// Example: `'7638417db6d59f3c431d3e1f261cc637155684cd'`
  final String sha;
  final String nodeId;
  final Uri url;

  /// Identifying information for the git-user
  final GitCommitAuthor author;

  /// Identifying information for the git-user
  final GitCommitCommitter committer;

  /// Message describing the purpose of the commit
  /// Example: `'Fix #42'`
  final String message;
  final GitCommitTree tree;
  final List<GitCommitParentsInner> parents;
  final GitCommitVerification verification;
  final Uri htmlUrl;

  /// Converts a [GitCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sha': sha,
      'node_id': nodeId,
      'url': url.toString(),
      'author': author.toJson(),
      'committer': committer.toJson(),
      'message': message,
      'tree': tree.toJson(),
      'parents': parents.map((e) => e.toJson()).toList(),
      'verification': verification.toJson(),
      'html_url': htmlUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    sha,
    nodeId,
    url,
    author,
    committer,
    message,
    tree,
    listHash(parents),
    verification,
    htmlUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCommit &&
        sha == other.sha &&
        nodeId == other.nodeId &&
        url == other.url &&
        author == other.author &&
        committer == other.committer &&
        message == other.message &&
        tree == other.tree &&
        listsEqual(parents, other.parents) &&
        verification == other.verification &&
        htmlUrl == other.htmlUrl;
  }
}
