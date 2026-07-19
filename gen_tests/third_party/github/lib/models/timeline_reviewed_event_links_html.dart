import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TimelineReviewedEventLinksHtml {
  const TimelineReviewedEventLinksHtml({required this.href});

  /// Converts a `Map<String, dynamic>` to a [TimelineReviewedEventLinksHtml].
  factory TimelineReviewedEventLinksHtml.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineReviewedEventLinksHtml',
      json,
      () => TimelineReviewedEventLinksHtml(href: json['href'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineReviewedEventLinksHtml? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineReviewedEventLinksHtml.fromJson(json);
  }

  final String href;

  /// Converts a [TimelineReviewedEventLinksHtml] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineReviewedEventLinksHtml && href == other.href;
  }
}
