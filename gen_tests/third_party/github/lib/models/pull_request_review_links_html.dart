// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestReviewLinksHtml {
  const PullRequestReviewLinksHtml({required this.href});

  /// Converts a `Map<String, dynamic>` to a [PullRequestReviewLinksHtml].
  factory PullRequestReviewLinksHtml.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestReviewLinksHtml',
      json,
      () => PullRequestReviewLinksHtml(href: json['href'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewLinksHtml? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewLinksHtml.fromJson(json);
  }

  final String href;

  /// Converts a [PullRequestReviewLinksHtml] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewLinksHtml && href == other.href;
  }
}
