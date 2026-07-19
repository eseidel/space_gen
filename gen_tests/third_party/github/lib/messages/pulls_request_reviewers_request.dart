import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsRequestReviewersRequest {
  const PullsRequestReviewersRequest({this.reviewers, this.teamReviewers});

  /// Converts a `Map<String, dynamic>` to a [PullsRequestReviewersRequest].
  factory PullsRequestReviewersRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsRequestReviewersRequest',
      json,
      () => PullsRequestReviewersRequest(
        reviewers: (json['reviewers'] as List?)?.cast<String>(),
        teamReviewers: (json['team_reviewers'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsRequestReviewersRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsRequestReviewersRequest.fromJson(json);
  }

  /// An array of user `login`s that will be requested.
  final List<String>? reviewers;

  /// An array of team `slug`s that will be requested.
  final List<String>? teamReviewers;

  /// Converts a [PullsRequestReviewersRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (reviewers != null) 'reviewers': reviewers,
      if (teamReviewers != null) 'team_reviewers': teamReviewers,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(reviewers), listHash(teamReviewers)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsRequestReviewersRequest &&
        listsEqual(reviewers, other.reviewers) &&
        listsEqual(teamReviewers, other.teamReviewers);
  }
}
