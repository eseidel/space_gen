import 'package:github/model_helpers.dart';
import 'package:github/models/file_commit_commit_author.dart';
import 'package:github/models/file_commit_commit_committer.dart';
import 'package:github/models/file_commit_commit_parents_inner.dart';
import 'package:github/models/file_commit_commit_tree.dart';
import 'package:github/models/file_commit_commit_verification.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitCommit {
  const FileCommitCommit({
    this.sha,
    this.nodeId,
    this.url,
    this.htmlUrl,
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.parents,
    this.verification,
  });

  /// Converts a `Map<String, dynamic>` to a [FileCommitCommit].
  factory FileCommitCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitCommit',
      json,
      () => FileCommitCommit(
        sha: json['sha'] as String?,
        nodeId: json['node_id'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        author: FileCommitCommitAuthor.maybeFromJson(
          json['author'] as Map<String, dynamic>?,
        ),
        committer: FileCommitCommitCommitter.maybeFromJson(
          json['committer'] as Map<String, dynamic>?,
        ),
        message: json['message'] as String?,
        tree: FileCommitCommitTree.maybeFromJson(
          json['tree'] as Map<String, dynamic>?,
        ),
        parents: (json['parents'] as List?)
            ?.map<FileCommitCommitParentsInner>(
              (e) => FileCommitCommitParentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        verification: FileCommitCommitVerification.maybeFromJson(
          json['verification'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileCommitCommit.fromJson(json);
  }

  final String? sha;
  final String? nodeId;
  final String? url;
  final String? htmlUrl;
  final FileCommitCommitAuthor? author;
  final FileCommitCommitCommitter? committer;
  final String? message;
  final FileCommitCommitTree? tree;
  final List<FileCommitCommitParentsInner>? parents;
  final FileCommitCommitVerification? verification;

  /// Converts a [FileCommitCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'sha': sha,
      'node_id': nodeId,
      'url': url,
      'html_url': htmlUrl,
      'author': author?.toJson(),
      'committer': committer?.toJson(),
      'message': message,
      'tree': tree?.toJson(),
      'parents': parents?.map((e) => e.toJson()).toList(),
      'verification': verification?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    sha,
    nodeId,
    url,
    htmlUrl,
    author,
    committer,
    message,
    tree,
    listHash(parents),
    verification,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommitCommit &&
        sha == other.sha &&
        nodeId == other.nodeId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        author == other.author &&
        committer == other.committer &&
        message == other.message &&
        tree == other.tree &&
        listsEqual(parents, other.parents) &&
        verification == other.verification;
  }
}
