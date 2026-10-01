// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/messages/timeline_reviewed_event_links_pull_request.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/timeline_reviewed_event_links_html.dart';
import 'package:meta/meta.dart';

@immutable
class TimelineReviewedEventLinks {
  const TimelineReviewedEventLinks({
    required this.html,
    required this.pullRequest,
  });

  /// Converts a `Map<String, dynamic>` to a [TimelineReviewedEventLinks].
  factory TimelineReviewedEventLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineReviewedEventLinks',
      json,
      () => TimelineReviewedEventLinks(
        html: TimelineReviewedEventLinksHtml.fromJson(
          json['html'] as Map<String, dynamic>,
        ),
        pullRequest: TimelineReviewedEventLinksPullRequest.fromJson(
          json['pull_request'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineReviewedEventLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TimelineReviewedEventLinks.fromJson(json);
  }

  final TimelineReviewedEventLinksHtml html;
  final TimelineReviewedEventLinksPullRequest pullRequest;

  /// Converts a [TimelineReviewedEventLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'html': html.toJson(), 'pull_request': pullRequest.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([html, pullRequest]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineReviewedEventLinks &&
        html == other.html &&
        pullRequest == other.pullRequest;
  }
}
