import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_or_update_file_contents_request_author.dart';
import 'package:github/models/repos_create_or_update_file_contents_request_committer.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateOrUpdateFileContentsRequest {
  const ReposCreateOrUpdateFileContentsRequest({
    required this.message,
    required this.content,
    this.sha,
    this.branch,
    this.committer,
    this.author,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateOrUpdateFileContentsRequest].
  factory ReposCreateOrUpdateFileContentsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateOrUpdateFileContentsRequest',
      json,
      () => ReposCreateOrUpdateFileContentsRequest(
        message: json['message'] as String,
        content: json['content'] as String,
        sha: json['sha'] as String?,
        branch: json['branch'] as String?,
        committer:
            ReposCreateOrUpdateFileContentsRequestCommitter.maybeFromJson(
              json['committer'] as Map<String, dynamic>?,
            ),
        author: ReposCreateOrUpdateFileContentsRequestAuthor.maybeFromJson(
          json['author'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateOrUpdateFileContentsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateOrUpdateFileContentsRequest.fromJson(json);
  }

  /// The commit message.
  final String message;

  /// The new file content, using Base64 encoding.
  final String content;

  /// **Required if you are updating a file**. The blob SHA of the file being
  /// replaced.
  final String? sha;

  /// The branch name. Default: the repository’s default branch.
  final String? branch;

  /// The person that committed the file. Default: the authenticated user.
  final ReposCreateOrUpdateFileContentsRequestCommitter? committer;

  /// The author of the file. Default: The `committer` or the authenticated
  /// user if you omit `committer`.
  final ReposCreateOrUpdateFileContentsRequestAuthor? author;

  /// Converts a [ReposCreateOrUpdateFileContentsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'content': content,
      if (sha != null) 'sha': sha,
      if (branch != null) 'branch': branch,
      if (committer != null) 'committer': committer?.toJson(),
      if (author != null) 'author': author?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([message, content, sha, branch, committer, author]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateOrUpdateFileContentsRequest &&
        message == other.message &&
        content == other.content &&
        sha == other.sha &&
        branch == other.branch &&
        committer == other.committer &&
        author == other.author;
  }
}
