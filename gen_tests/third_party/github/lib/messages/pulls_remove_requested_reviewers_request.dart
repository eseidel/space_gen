import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsRemoveRequestedReviewersRequest {
  const PullsRemoveRequestedReviewersRequest({
    required this.reviewers,
    this.teamReviewers,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PullsRemoveRequestedReviewersRequest].
  factory PullsRemoveRequestedReviewersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullsRemoveRequestedReviewersRequest',
      json,
      () => PullsRemoveRequestedReviewersRequest(
        reviewers: (json['reviewers'] as List).cast<String>(),
        teamReviewers: (json['team_reviewers'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsRemoveRequestedReviewersRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsRemoveRequestedReviewersRequest.fromJson(json);
  }

  /// An array of user `login`s that will be removed.
  final List<String> reviewers;

  /// An array of team `slug`s that will be removed.
  final List<String>? teamReviewers;

  /// Converts a [PullsRemoveRequestedReviewersRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'reviewers': reviewers,
      if (teamReviewers != null) 'team_reviewers': teamReviewers,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(reviewers), listHash(teamReviewers)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsRemoveRequestedReviewersRequest &&
        listsEqual(reviewers, other.reviewers) &&
        listsEqual(teamReviewers, other.teamReviewers);
  }
}
