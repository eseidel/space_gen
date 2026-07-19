import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_pull_request_review}
/// Represents a 'pull_request_review' secret scanning location type. This
/// location type shows that a secret was detected in a review on a pull
/// request.
/// {@endtemplate}
@immutable
class SecretScanningLocationPullRequestReview {
  /// {@macro secret_scanning_location_pull_request_review}
  const SecretScanningLocationPullRequestReview({
    required this.pullRequestReviewUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationPullRequestReview].
  factory SecretScanningLocationPullRequestReview.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationPullRequestReview',
      json,
      () => SecretScanningLocationPullRequestReview(
        pullRequestReviewUrl: Uri.parse(
          json['pull_request_review_url'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationPullRequestReview? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationPullRequestReview.fromJson(json);
  }

  /// The API URL to get the pull request review where the secret was
  /// detected.
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/2846/reviews/80'`
  final Uri pullRequestReviewUrl;

  /// Converts a [SecretScanningLocationPullRequestReview]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'pull_request_review_url': pullRequestReviewUrl.toString()};
  }

  @override
  int get hashCode => pullRequestReviewUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationPullRequestReview &&
        pullRequestReviewUrl == other.pullRequestReviewUrl;
  }
}
