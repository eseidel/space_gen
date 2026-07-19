import 'package:github/model_helpers.dart';
import 'package:github/models/pulls_merge_request_merge_method.dart';
import 'package:meta/meta.dart';

@immutable
class PullsMergeRequest {
  const PullsMergeRequest({
    this.commitTitle,
    this.commitMessage,
    this.sha,
    this.mergeMethod,
  });

  /// Converts a `Map<String, dynamic>` to a [PullsMergeRequest].
  factory PullsMergeRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsMergeRequest',
      json,
      () => PullsMergeRequest(
        commitTitle: json['commit_title'] as String?,
        commitMessage: json['commit_message'] as String?,
        sha: json['sha'] as String?,
        mergeMethod: PullsMergeRequestMergeMethod.maybeFromJson(
          json['merge_method'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsMergeRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsMergeRequest.fromJson(json);
  }

  /// Title for the automatic commit message.
  final String? commitTitle;

  /// Extra detail to append to automatic commit message.
  final String? commitMessage;

  /// SHA that pull request head must match to allow merge.
  final String? sha;

  /// The merge method to use.
  final PullsMergeRequestMergeMethod? mergeMethod;

  /// Converts a [PullsMergeRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'commit_title': commitTitle,
      'commit_message': commitMessage,
      'sha': sha,
      'merge_method': mergeMethod?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([commitTitle, commitMessage, sha, mergeMethod]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsMergeRequest &&
        commitTitle == other.commitTitle &&
        commitMessage == other.commitMessage &&
        sha == other.sha &&
        mergeMethod == other.mergeMethod;
  }
}
