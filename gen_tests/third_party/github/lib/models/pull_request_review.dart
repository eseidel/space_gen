import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/pull_request_review_links.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template pull_request_review}
/// Pull Request Review
/// Pull Request Reviews are reviews on pull requests.
/// {@endtemplate}
@immutable
class PullRequestReview {
  /// {@macro pull_request_review}
  const PullRequestReview({
    required this.id,
    required this.nodeId,
    required this.user,
    required this.body,
    required this.state,
    required this.htmlUrl,
    required this.pullRequestUrl,
    required this.links,
    required this.commitId,
    required this.authorAssociation,
    this.submittedAt,
    this.bodyHtml,
    this.bodyText,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestReview].
  factory PullRequestReview.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestReview',
      json,
      () => PullRequestReview(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        body: json['body'] as String,
        state: json['state'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        pullRequestUrl: Uri.parse(json['pull_request_url'] as String),
        links: PullRequestReviewLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
        submittedAt: maybeParseDateTime(json['submitted_at'] as String?),
        commitId: checkedKey(json, 'commit_id') as String?,
        bodyHtml: json['body_html'] as String?,
        bodyText: json['body_text'] as String?,
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReview? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReview.fromJson(json);
  }

  /// Unique identifier of the review
  /// Example: `42`
  final int id;

  /// Example: `'MDE3OlB1bGxSZXF1ZXN0UmV2aWV3ODA='`
  final String nodeId;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// The text of the review.
  /// Example: `'This looks great.'`
  final String body;

  /// Example: `'CHANGES_REQUESTED'`
  final String state;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/pull/12#pullrequestreview-80'`
  final Uri htmlUrl;

  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/12'`
  final Uri pullRequestUrl;
  final PullRequestReviewLinks links;
  final DateTime? submittedAt;

  /// A commit SHA for the review. If the commit object was garbage collected
  /// or forcibly deleted, then it no longer exists in Git and this value will
  /// be `null`.
  /// Example: `'54bb654c9e6025347f57900a4a5c2313a96b8035'`
  final String? commitId;
  final String? bodyHtml;
  final String? bodyText;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;

  /// Converts a [PullRequestReview] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'user': user?.toJson(),
      'body': body,
      'state': state,
      'html_url': htmlUrl.toString(),
      'pull_request_url': pullRequestUrl.toString(),
      '_links': links.toJson(),
      if (submittedAt != null) 'submitted_at': submittedAt?.toIso8601String(),
      'commit_id': commitId,
      if (bodyHtml != null) 'body_html': bodyHtml,
      if (bodyText != null) 'body_text': bodyText,
      'author_association': authorAssociation.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    user,
    body,
    state,
    htmlUrl,
    pullRequestUrl,
    links,
    submittedAt,
    commitId,
    bodyHtml,
    bodyText,
    authorAssociation,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReview &&
        id == other.id &&
        nodeId == other.nodeId &&
        user == other.user &&
        body == other.body &&
        state == other.state &&
        htmlUrl == other.htmlUrl &&
        pullRequestUrl == other.pullRequestUrl &&
        links == other.links &&
        submittedAt == other.submittedAt &&
        commitId == other.commitId &&
        bodyHtml == other.bodyHtml &&
        bodyText == other.bodyText &&
        authorAssociation == other.authorAssociation;
  }
}
