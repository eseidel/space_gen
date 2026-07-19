import 'package:github/model_helpers.dart';
import 'package:github/models/commit_search_result_item_commit_author.dart';
import 'package:github/models/commit_search_result_item_commit_tree.dart';
import 'package:github/models/git_user.dart';
import 'package:github/models/verification.dart';
import 'package:meta/meta.dart';

@immutable
class CommitSearchResultItemCommit {
  const CommitSearchResultItemCommit({
    required this.author,
    required this.committer,
    required this.commentCount,
    required this.message,
    required this.tree,
    required this.url,
    this.verification,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitSearchResultItemCommit].
  factory CommitSearchResultItemCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitSearchResultItemCommit',
      json,
      () => CommitSearchResultItemCommit(
        author: CommitSearchResultItemCommitAuthor.fromJson(
          json['author'] as Map<String, dynamic>,
        ),
        committer: GitUser.maybeFromJson(
          checkedKey(json, 'committer') as Map<String, dynamic>?,
        ),
        commentCount: json['comment_count'] as int,
        message: json['message'] as String,
        tree: CommitSearchResultItemCommitTree.fromJson(
          json['tree'] as Map<String, dynamic>,
        ),
        url: Uri.parse(json['url'] as String),
        verification: Verification.maybeFromJson(
          json['verification'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitSearchResultItemCommit? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CommitSearchResultItemCommit.fromJson(json);
  }

  final CommitSearchResultItemCommitAuthor author;

  /// Git User
  /// Metaproperties for Git author/committer information.
  final GitUser? committer;
  final int commentCount;
  final String message;
  final CommitSearchResultItemCommitTree tree;
  final Uri url;

  /// Verification
  final Verification? verification;

  /// Converts a [CommitSearchResultItemCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'author': author.toJson(),
      'committer': committer?.toJson(),
      'comment_count': commentCount,
      'message': message,
      'tree': tree.toJson(),
      'url': url.toString(),
      'verification': verification?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    author,
    committer,
    commentCount,
    message,
    tree,
    url,
    verification,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitSearchResultItemCommit &&
        author == other.author &&
        committer == other.committer &&
        commentCount == other.commentCount &&
        message == other.message &&
        tree == other.tree &&
        url == other.url &&
        verification == other.verification;
  }
}
