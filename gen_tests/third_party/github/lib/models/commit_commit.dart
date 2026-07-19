// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/commit_commit_tree.dart';
import 'package:github/models/git_user.dart';
import 'package:github/models/verification.dart';
import 'package:meta/meta.dart';

@immutable
class CommitCommit {
  const CommitCommit({
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.commentCount,
    required this.tree,
    this.verification,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitCommit].
  factory CommitCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitCommit',
      json,
      () => CommitCommit(
        url: Uri.parse(json['url'] as String),
        author: GitUser.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        committer: GitUser.maybeFromJson(
          checkedKey(json, 'committer') as Map<String, dynamic>?,
        ),
        message: json['message'] as String,
        commentCount: json['comment_count'] as int,
        tree: CommitCommitTree.fromJson(json['tree'] as Map<String, dynamic>),
        verification: Verification.maybeFromJson(
          json['verification'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitCommit.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final Uri url;

  /// Git User
  /// Metaproperties for Git author/committer information.
  final GitUser? author;

  /// Git User
  /// Metaproperties for Git author/committer information.
  final GitUser? committer;

  /// Example: `'Fix all the bugs'`
  final String message;

  /// Example: `0`
  final int commentCount;
  final CommitCommitTree tree;

  /// Verification
  final Verification? verification;

  /// Converts a [CommitCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'author': author?.toJson(),
      'committer': committer?.toJson(),
      'message': message,
      'comment_count': commentCount,
      'tree': tree.toJson(),
      if (verification != null) 'verification': verification?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    author,
    committer,
    message,
    commentCount,
    tree,
    verification,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitCommit &&
        url == other.url &&
        author == other.author &&
        committer == other.committer &&
        message == other.message &&
        commentCount == other.commentCount &&
        tree == other.tree &&
        verification == other.verification;
  }
}
