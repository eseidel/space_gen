import 'package:github/model_helpers.dart';
import 'package:github/models/link.dart';
import 'package:meta/meta.dart';

@immutable
class ReviewCommentLinks {
  const ReviewCommentLinks({
    required this.self,
    required this.html,
    required this.pullRequest,
  });

  /// Converts a `Map<String, dynamic>` to a [ReviewCommentLinks].
  factory ReviewCommentLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReviewCommentLinks',
      json,
      () => ReviewCommentLinks(
        self: Link.fromJson(json['self'] as Map<String, dynamic>),
        html: Link.fromJson(json['html'] as Map<String, dynamic>),
        pullRequest: Link.fromJson(
          json['pull_request'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewCommentLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReviewCommentLinks.fromJson(json);
  }

  /// Link
  /// Hypermedia Link
  final Link self;

  /// Link
  /// Hypermedia Link
  final Link html;

  /// Link
  /// Hypermedia Link
  final Link pullRequest;

  /// Converts a [ReviewCommentLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'self': self.toJson(),
      'html': html.toJson(),
      'pull_request': pullRequest.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([self, html, pullRequest]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewCommentLinks &&
        self == other.self &&
        html == other.html &&
        pullRequest == other.pullRequest;
  }
}
