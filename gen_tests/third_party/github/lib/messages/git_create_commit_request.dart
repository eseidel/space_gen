import 'package:github/model_helpers.dart';
import 'package:github/models/git_create_commit_request_author.dart';
import 'package:github/models/git_create_commit_request_committer.dart';
import 'package:meta/meta.dart';

@immutable
class GitCreateCommitRequest {
  const GitCreateCommitRequest({
    required this.message,
    required this.tree,
    this.parents,
    this.author,
    this.committer,
    this.signature,
  });

  /// Converts a `Map<String, dynamic>` to a [GitCreateCommitRequest].
  factory GitCreateCommitRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateCommitRequest',
      json,
      () => GitCreateCommitRequest(
        message: json['message'] as String,
        tree: json['tree'] as String,
        parents: (json['parents'] as List?)?.cast<String>(),
        author: GitCreateCommitRequestAuthor.maybeFromJson(
          json['author'] as Map<String, dynamic>?,
        ),
        committer: GitCreateCommitRequestCommitter.maybeFromJson(
          json['committer'] as Map<String, dynamic>?,
        ),
        signature: json['signature'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateCommitRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateCommitRequest.fromJson(json);
  }

  /// The commit message
  final String message;

  /// The SHA of the tree object this commit points to
  final String tree;

  /// The full SHAs of the commits that were the parents of this commit. If
  /// omitted or empty, the commit will be written as a root commit. For a
  /// single parent, an array of one SHA should be provided; for a merge
  /// commit, an array of more than one should be provided.
  final List<String>? parents;

  /// Information about the author of the commit. By default, the `author`
  /// will be the authenticated user and the current date. See the `author`
  /// and `committer` object below for details.
  final GitCreateCommitRequestAuthor? author;

  /// Information about the person who is making the commit. By default,
  /// `committer` will use the information set in `author`. See the `author`
  /// and `committer` object below for details.
  final GitCreateCommitRequestCommitter? committer;

  /// The [PGP signature](https://en.wikipedia.org/wiki/Pretty_Good_Privacy)
  /// of the commit. GitHub adds the signature to the `gpgsig` header of the
  /// created commit. For a commit signature to be verifiable by Git or
  /// GitHub, it must be an ASCII-armored detached PGP signature over the
  /// string commit as it would be written to the object database. To pass a
  /// `signature` parameter, you need to first manually create a valid PGP
  /// signature, which can be complicated. You may find it easier to [use the
  /// command
  /// line](https://git-scm.com/book/id/v2/Git-Tools-Signing-Your-Work) to
  /// create signed commits.
  final String? signature;

  /// Converts a [GitCreateCommitRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'tree': tree,
      if (parents != null) 'parents': parents,
      if (author != null) 'author': author?.toJson(),
      if (committer != null) 'committer': committer?.toJson(),
      if (signature != null) 'signature': signature,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    message,
    tree,
    listHash(parents),
    author,
    committer,
    signature,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateCommitRequest &&
        message == other.message &&
        tree == other.tree &&
        listsEqual(parents, other.parents) &&
        author == other.author &&
        committer == other.committer &&
        signature == other.signature;
  }
}
