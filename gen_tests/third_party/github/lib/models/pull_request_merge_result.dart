import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template pull_request_merge_result}
/// Pull Request Merge Result
/// Pull Request Merge Result
/// {@endtemplate}
@immutable
class PullRequestMergeResult {
  /// {@macro pull_request_merge_result}
  const PullRequestMergeResult({
    required this.sha,
    required this.merged,
    required this.message,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestMergeResult].
  factory PullRequestMergeResult.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestMergeResult',
      json,
      () => PullRequestMergeResult(
        sha: json['sha'] as String,
        merged: json['merged'] as bool,
        message: json['message'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestMergeResult? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestMergeResult.fromJson(json);
  }

  final String sha;
  final bool merged;
  final String message;

  /// Converts a [PullRequestMergeResult] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'merged': merged, 'message': message};
  }

  @override
  int get hashCode => Object.hashAll([sha, merged, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestMergeResult &&
        sha == other.sha &&
        merged == other.merged &&
        message == other.message;
  }
}
