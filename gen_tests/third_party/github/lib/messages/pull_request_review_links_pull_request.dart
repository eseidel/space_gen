import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewLinksPullRequest {
  const PullRequestReviewLinksPullRequest({required this.href});

  /// Converts a `Map<String, dynamic>` to a
  /// [PullRequestReviewLinksPullRequest].
  factory PullRequestReviewLinksPullRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PullRequestReviewLinksPullRequest',
      json,
      () => PullRequestReviewLinksPullRequest(href: json['href'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewLinksPullRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewLinksPullRequest.fromJson(json);
  }

  final String href;

  /// Converts a [PullRequestReviewLinksPullRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewLinksPullRequest && href == other.href;
  }
}
