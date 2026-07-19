import 'package:github/model_helpers.dart';
import 'package:github/models/repos_delete_file_request_author.dart';
import 'package:github/models/repos_delete_file_request_committer.dart';
import 'package:meta/meta.dart';

@immutable
class ReposDeleteFileRequest {
  const ReposDeleteFileRequest({
    required this.message,
    required this.sha,
    this.branch,
    this.committer,
    this.author,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposDeleteFileRequest].
  factory ReposDeleteFileRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposDeleteFileRequest',
      json,
      () => ReposDeleteFileRequest(
        message: json['message'] as String,
        sha: json['sha'] as String,
        branch: json['branch'] as String?,
        committer: ReposDeleteFileRequestCommitter.maybeFromJson(
          json['committer'] as Map<String, dynamic>?,
        ),
        author: ReposDeleteFileRequestAuthor.maybeFromJson(
          json['author'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposDeleteFileRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposDeleteFileRequest.fromJson(json);
  }

  /// The commit message.
  final String message;

  /// The blob SHA of the file being deleted.
  final String sha;

  /// The branch name. Default: the repository’s default branch
  final String? branch;

  /// object containing information about the committer.
  final ReposDeleteFileRequestCommitter? committer;

  /// object containing information about the author.
  final ReposDeleteFileRequestAuthor? author;

  /// Converts a [ReposDeleteFileRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'sha': sha,
      'branch': ?branch,
      'committer': ?committer?.toJson(),
      'author': ?author?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([message, sha, branch, committer, author]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposDeleteFileRequest &&
        message == other.message &&
        sha == other.sha &&
        branch == other.branch &&
        committer == other.committer &&
        author == other.author;
  }
}
