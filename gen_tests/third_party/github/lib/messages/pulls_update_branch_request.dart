import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsUpdateBranchRequest {
  const PullsUpdateBranchRequest({this.expectedHeadSha});

  /// Converts a `Map<String, dynamic>` to a [PullsUpdateBranchRequest].
  factory PullsUpdateBranchRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsUpdateBranchRequest',
      json,
      () => PullsUpdateBranchRequest(
        expectedHeadSha: json['expected_head_sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsUpdateBranchRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsUpdateBranchRequest.fromJson(json);
  }

  /// The expected SHA of the pull request's HEAD ref. This is the most recent
  /// commit on the pull request's branch. If the expected SHA does not match
  /// the pull request's HEAD, you will receive a `422 Unprocessable Entity`
  /// status. You can use the "[List
  /// commits](https://docs.github.com/rest/commits/commits#list-commits)"
  /// endpoint to find the most recent commit SHA. Default: SHA of the pull
  /// request's current HEAD ref.
  final String? expectedHeadSha;

  /// Converts a [PullsUpdateBranchRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'expected_head_sha': expectedHeadSha};
  }

  @override
  int get hashCode => expectedHeadSha.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsUpdateBranchRequest &&
        expectedHeadSha == other.expectedHeadSha;
  }
}
