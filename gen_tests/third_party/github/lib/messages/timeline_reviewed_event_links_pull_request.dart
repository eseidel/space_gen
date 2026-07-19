import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TimelineReviewedEventLinksPullRequest {
  const TimelineReviewedEventLinksPullRequest({required this.href});

  /// Converts a `Map<String, dynamic>` to a
  /// [TimelineReviewedEventLinksPullRequest].
  factory TimelineReviewedEventLinksPullRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TimelineReviewedEventLinksPullRequest',
      json,
      () => TimelineReviewedEventLinksPullRequest(href: json['href'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineReviewedEventLinksPullRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineReviewedEventLinksPullRequest.fromJson(json);
  }

  final String href;

  /// Converts a [TimelineReviewedEventLinksPullRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineReviewedEventLinksPullRequest && href == other.href;
  }
}
