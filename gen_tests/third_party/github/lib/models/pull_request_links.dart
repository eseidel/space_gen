import 'package:github/model_helpers.dart';
import 'package:github/models/link.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestLinks {
  const PullRequestLinks({
    required this.comments,
    required this.commits,
    required this.statuses,
    required this.html,
    required this.issue,
    required this.reviewComments,
    required this.reviewComment,
    required this.self,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestLinks].
  factory PullRequestLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestLinks',
      json,
      () => PullRequestLinks(
        comments: Link.fromJson(json['comments'] as Map<String, dynamic>),
        commits: Link.fromJson(json['commits'] as Map<String, dynamic>),
        statuses: Link.fromJson(json['statuses'] as Map<String, dynamic>),
        html: Link.fromJson(json['html'] as Map<String, dynamic>),
        issue: Link.fromJson(json['issue'] as Map<String, dynamic>),
        reviewComments: Link.fromJson(
          json['review_comments'] as Map<String, dynamic>,
        ),
        reviewComment: Link.fromJson(
          json['review_comment'] as Map<String, dynamic>,
        ),
        self: Link.fromJson(json['self'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestLinks.fromJson(json);
  }

  /// Link
  /// Hypermedia Link
  final Link comments;

  /// Link
  /// Hypermedia Link
  final Link commits;

  /// Link
  /// Hypermedia Link
  final Link statuses;

  /// Link
  /// Hypermedia Link
  final Link html;

  /// Link
  /// Hypermedia Link
  final Link issue;

  /// Link
  /// Hypermedia Link
  final Link reviewComments;

  /// Link
  /// Hypermedia Link
  final Link reviewComment;

  /// Link
  /// Hypermedia Link
  final Link self;

  /// Converts a [PullRequestLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'comments': comments.toJson(),
      'commits': commits.toJson(),
      'statuses': statuses.toJson(),
      'html': html.toJson(),
      'issue': issue.toJson(),
      'review_comments': reviewComments.toJson(),
      'review_comment': reviewComment.toJson(),
      'self': self.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    comments,
    commits,
    statuses,
    html,
    issue,
    reviewComments,
    reviewComment,
    self,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestLinks &&
        comments == other.comments &&
        commits == other.commits &&
        statuses == other.statuses &&
        html == other.html &&
        issue == other.issue &&
        reviewComments == other.reviewComments &&
        reviewComment == other.reviewComment &&
        self == other.self;
  }
}
