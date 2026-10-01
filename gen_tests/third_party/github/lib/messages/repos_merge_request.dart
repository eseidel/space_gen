// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposMergeRequest {
  const ReposMergeRequest({
    required this.base,
    required this.head,
    this.commitMessage,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposMergeRequest].
  factory ReposMergeRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposMergeRequest',
      json,
      () => ReposMergeRequest(
        base: json['base'] as String,
        head: json['head'] as String,
        commitMessage: json['commit_message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposMergeRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposMergeRequest.fromJson(json);
  }

  /// The name of the base branch that the head will be merged into.
  final String base;

  /// The head to merge. This can be a branch name or a commit SHA1.
  final String head;

  /// Commit message to use for the merge commit. If omitted, a default
  /// message will be used.
  final String? commitMessage;

  /// Converts a [ReposMergeRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'base': base, 'head': head, 'commit_message': ?commitMessage};
  }

  @override
  int get hashCode => Object.hashAll([base, head, commitMessage]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposMergeRequest &&
        base == other.base &&
        head == other.head &&
        commitMessage == other.commitMessage;
  }
}
