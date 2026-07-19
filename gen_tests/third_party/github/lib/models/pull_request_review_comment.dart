import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/pull_request_review_comment_links.dart';
import 'package:github/models/pull_request_review_comment_side.dart';
import 'package:github/models/pull_request_review_comment_start_side.dart';
import 'package:github/models/pull_request_review_comment_subject_type.dart';
import 'package:github/models/reaction_rollup.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template pull_request_review_comment}
/// Pull Request Review Comment
/// Pull Request Review Comments are comments on a portion of the Pull Request's
/// diff.
/// {@endtemplate}
@immutable
class PullRequestReviewComment {
  /// {@macro pull_request_review_comment}
  const PullRequestReviewComment({
    required this.url,
    required this.pullRequestReviewId,
    required this.id,
    required this.nodeId,
    required this.diffHunk,
    required this.path,
    required this.commitId,
    required this.originalCommitId,
    required this.user,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.htmlUrl,
    required this.pullRequestUrl,
    required this.authorAssociation,
    required this.links,
    this.position,
    this.originalPosition,
    this.inReplyToId,
    this.startLine,
    this.originalStartLine,
    this.startSide = PullRequestReviewCommentStartSide.right,
    this.line,
    this.originalLine,
    this.side = PullRequestReviewCommentSide.right,
    this.subjectType,
    this.reactions,
    this.bodyHtml,
    this.bodyText,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestReviewComment].
  factory PullRequestReviewComment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestReviewComment',
      json,
      () => PullRequestReviewComment(
        url: json['url'] as String,
        pullRequestReviewId: checkedKey(json, 'pull_request_review_id') as int?,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        diffHunk: json['diff_hunk'] as String,
        path: json['path'] as String,
        position: json['position'] as int?,
        originalPosition: json['original_position'] as int?,
        commitId: json['commit_id'] as String,
        originalCommitId: json['original_commit_id'] as String,
        inReplyToId: json['in_reply_to_id'] as int?,
        user: SimpleUser.fromJson(json['user'] as Map<String, dynamic>),
        body: json['body'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        pullRequestUrl: Uri.parse(json['pull_request_url'] as String),
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
        links: PullRequestReviewCommentLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
        startLine: json['start_line'] as int?,
        originalStartLine: json['original_start_line'] as int?,
        startSide: json.containsKey('start_side')
            ? PullRequestReviewCommentStartSide.maybeFromJson(
                json['start_side'] as String?,
              )
            : PullRequestReviewCommentStartSide.right,
        line: json['line'] as int?,
        originalLine: json['original_line'] as int?,
        side:
            PullRequestReviewCommentSide.maybeFromJson(
              json['side'] as String?,
            ) ??
            PullRequestReviewCommentSide.right,
        subjectType: PullRequestReviewCommentSubjectType.maybeFromJson(
          json['subject_type'] as String?,
        ),
        reactions: ReactionRollup.maybeFromJson(
          json['reactions'] as Map<String, dynamic>?,
        ),
        bodyHtml: json['body_html'] as String?,
        bodyText: json['body_text'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestReviewComment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestReviewComment.fromJson(json);
  }

  /// URL for the pull request review comment
  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/comments/1'`
  final String url;

  /// The ID of the pull request review to which the comment belongs.
  /// Example: `42`
  final int? pullRequestReviewId;

  /// The ID of the pull request review comment.
  /// Example: `1`
  final int id;

  /// The node ID of the pull request review comment.
  /// Example: `'MDI0OlB1bGxSZXF1ZXN0UmV2aWV3Q29tbWVudDEw'`
  final String nodeId;

  /// The diff of the line that the comment refers to.
  /// Example: `'@@ -16,33 +16,40 @@ public class Connection : IConnection...'`
  final String diffHunk;

  /// The relative path of the file to which the comment applies.
  /// Example: `'config/database.yaml'`
  final String path;

  /// The line index in the diff to which the comment applies. This field is
  /// closing down; use `line` instead.
  /// Example: `1`
  final int? position;

  /// The index of the original line in the diff to which the comment applies.
  /// This field is closing down; use `original_line` instead.
  /// Example: `4`
  final int? originalPosition;

  /// The SHA of the commit to which the comment applies.
  /// Example: `'6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final String commitId;

  /// The SHA of the original commit to which the comment applies.
  /// Example: `'9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840'`
  final String originalCommitId;

  /// The comment ID to reply to.
  /// Example: `8`
  final int? inReplyToId;

  /// Simple User
  /// A GitHub user.
  final SimpleUser user;

  /// The text of the comment.
  /// Example: `'We should probably include a check for null values here.'`
  final String body;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime createdAt;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime updatedAt;

  /// HTML URL for the pull request review comment.
  /// Example:
  /// `'https://github.com/octocat/Hello-World/pull/1#discussion-diff-1'`
  final Uri htmlUrl;

  /// URL for the pull request that the review comment belongs to.
  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/1'`
  final Uri pullRequestUrl;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;
  final PullRequestReviewCommentLinks links;

  /// The first line of the range for a multi-line comment.
  /// Example: `2`
  final int? startLine;

  /// The first line of the range for a multi-line comment.
  /// Example: `2`
  final int? originalStartLine;

  /// The side of the first line of the range for a multi-line comment.
  final PullRequestReviewCommentStartSide? startSide;

  /// The line of the blob to which the comment applies. The last line of the
  /// range for a multi-line comment
  /// Example: `2`
  final int? line;

  /// The line of the blob to which the comment applies. The last line of the
  /// range for a multi-line comment
  /// Example: `2`
  final int? originalLine;

  /// The side of the diff to which the comment applies. The side of the last
  /// line of the range for a multi-line comment
  final PullRequestReviewCommentSide side;

  /// The level at which the comment is targeted, can be a diff line or a
  /// file.
  final PullRequestReviewCommentSubjectType? subjectType;

  /// Reaction Rollup
  final ReactionRollup? reactions;

  /// Example: `'"<p>comment body</p>"'`
  final String? bodyHtml;

  /// Example: `'"comment body"'`
  final String? bodyText;

  /// Converts a [PullRequestReviewComment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'pull_request_review_id': pullRequestReviewId,
      'id': id,
      'node_id': nodeId,
      'diff_hunk': diffHunk,
      'path': path,
      'position': ?position,
      'original_position': ?originalPosition,
      'commit_id': commitId,
      'original_commit_id': originalCommitId,
      'in_reply_to_id': ?inReplyToId,
      'user': user.toJson(),
      'body': body,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'html_url': htmlUrl.toString(),
      'pull_request_url': pullRequestUrl.toString(),
      'author_association': authorAssociation.toJson(),
      '_links': links.toJson(),
      'start_line': startLine,
      'original_start_line': originalStartLine,
      'start_side': startSide?.toJson(),
      'line': ?line,
      'original_line': ?originalLine,
      'side': side.toJson(),
      'subject_type': ?subjectType?.toJson(),
      'reactions': ?reactions?.toJson(),
      'body_html': ?bodyHtml,
      'body_text': ?bodyText,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    pullRequestReviewId,
    id,
    nodeId,
    diffHunk,
    path,
    position,
    originalPosition,
    commitId,
    originalCommitId,
    inReplyToId,
    user,
    body,
    createdAt,
    updatedAt,
    htmlUrl,
    pullRequestUrl,
    authorAssociation,
    links,
    startLine,
    originalStartLine,
    startSide,
    line,
    originalLine,
    side,
    subjectType,
    reactions,
    bodyHtml,
    bodyText,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestReviewComment &&
        url == other.url &&
        pullRequestReviewId == other.pullRequestReviewId &&
        id == other.id &&
        nodeId == other.nodeId &&
        diffHunk == other.diffHunk &&
        path == other.path &&
        position == other.position &&
        originalPosition == other.originalPosition &&
        commitId == other.commitId &&
        originalCommitId == other.originalCommitId &&
        inReplyToId == other.inReplyToId &&
        user == other.user &&
        body == other.body &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        htmlUrl == other.htmlUrl &&
        pullRequestUrl == other.pullRequestUrl &&
        authorAssociation == other.authorAssociation &&
        links == other.links &&
        startLine == other.startLine &&
        originalStartLine == other.originalStartLine &&
        startSide == other.startSide &&
        line == other.line &&
        originalLine == other.originalLine &&
        side == other.side &&
        subjectType == other.subjectType &&
        reactions == other.reactions &&
        bodyHtml == other.bodyHtml &&
        bodyText == other.bodyText;
  }
}
