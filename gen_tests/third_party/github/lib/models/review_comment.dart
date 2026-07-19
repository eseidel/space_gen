import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/reaction_rollup.dart';
import 'package:github/models/review_comment_links.dart';
import 'package:github/models/review_comment_side.dart';
import 'package:github/models/review_comment_start_side.dart';
import 'package:github/models/review_comment_subject_type.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template review_comment}
/// Legacy Review Comment
/// Legacy Review Comment
/// {@endtemplate}
@immutable
class ReviewComment {
  /// {@macro review_comment}
  const ReviewComment({
    required this.url,
    required this.pullRequestReviewId,
    required this.id,
    required this.nodeId,
    required this.diffHunk,
    required this.path,
    required this.position,
    required this.originalPosition,
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
    this.inReplyToId,
    this.bodyText,
    this.bodyHtml,
    this.reactions,
    this.side = ReviewCommentSide.right,
    this.startSide = ReviewCommentStartSide.right,
    this.line,
    this.originalLine,
    this.startLine,
    this.originalStartLine,
    this.subjectType,
  });

  /// Converts a `Map<String, dynamic>` to a [ReviewComment].
  factory ReviewComment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReviewComment',
      json,
      () => ReviewComment(
        url: Uri.parse(json['url'] as String),
        pullRequestReviewId: checkedKey(json, 'pull_request_review_id') as int?,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        diffHunk: json['diff_hunk'] as String,
        path: json['path'] as String,
        position: checkedKey(json, 'position') as int?,
        originalPosition: json['original_position'] as int,
        commitId: json['commit_id'] as String,
        originalCommitId: json['original_commit_id'] as String,
        inReplyToId: json['in_reply_to_id'] as int?,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        body: json['body'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        pullRequestUrl: Uri.parse(json['pull_request_url'] as String),
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
        links: ReviewCommentLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
        bodyText: json['body_text'] as String?,
        bodyHtml: json['body_html'] as String?,
        reactions: ReactionRollup.maybeFromJson(
          json['reactions'] as Map<String, dynamic>?,
        ),
        side:
            ReviewCommentSide.maybeFromJson(json['side'] as String?) ??
            ReviewCommentSide.right,
        startSide:
            ReviewCommentStartSide.maybeFromJson(
              json['start_side'] as String?,
            ) ??
            ReviewCommentStartSide.right,
        line: json['line'] as int?,
        originalLine: json['original_line'] as int?,
        startLine: json['start_line'] as int?,
        originalStartLine: json['original_start_line'] as int?,
        subjectType: ReviewCommentSubjectType.maybeFromJson(
          json['subject_type'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReviewComment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReviewComment.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/pulls/comments/1'`
  final Uri url;

  /// Example: `42`
  final int? pullRequestReviewId;

  /// Example: `10`
  final int id;

  /// Example: `'MDI0OlB1bGxSZXF1ZXN0UmV2aWV3Q29tbWVudDEw'`
  final String nodeId;

  /// Example: `'@@ -16,33 +16,40 @@ public class Connection : IConnection...'`
  final String diffHunk;

  /// Example: `'file1.txt'`
  final String path;

  /// Example: `1`
  final int? position;

  /// Example: `4`
  final int originalPosition;

  /// Example: `'6dcb09b5b57875f334f61aebed695e2e4193db5e'`
  final String commitId;

  /// Example: `'9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840'`
  final String originalCommitId;

  /// Example: `8`
  final int? inReplyToId;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Example: `'Great stuff'`
  final String body;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime createdAt;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime updatedAt;

  /// Example:
  /// `'https://github.com/octocat/Hello-World/pull/1#discussion-diff-1'`
  final Uri htmlUrl;

  /// Example: `'https://api.github.com/repos/octocat/Hello-World/pulls/1'`
  final Uri pullRequestUrl;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;
  final ReviewCommentLinks links;
  final String? bodyText;
  final String? bodyHtml;

  /// Reaction Rollup
  final ReactionRollup? reactions;

  /// The side of the first line of the range for a multi-line comment.
  final ReviewCommentSide? side;

  /// The side of the first line of the range for a multi-line comment.
  final ReviewCommentStartSide? startSide;

  /// The line of the blob to which the comment applies. The last line of the
  /// range for a multi-line comment
  /// Example: `2`
  final int? line;

  /// The original line of the blob to which the comment applies. The last
  /// line of the range for a multi-line comment
  /// Example: `2`
  final int? originalLine;

  /// The first line of the range for a multi-line comment.
  /// Example: `2`
  final int? startLine;

  /// The original first line of the range for a multi-line comment.
  /// Example: `2`
  final int? originalStartLine;

  /// The level at which the comment is targeted, can be a diff line or a
  /// file.
  final ReviewCommentSubjectType? subjectType;

  /// Converts a [ReviewComment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'pull_request_review_id': pullRequestReviewId,
      'id': id,
      'node_id': nodeId,
      'diff_hunk': diffHunk,
      'path': path,
      'position': position,
      'original_position': originalPosition,
      'commit_id': commitId,
      'original_commit_id': originalCommitId,
      'in_reply_to_id': inReplyToId,
      'user': user?.toJson(),
      'body': body,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'html_url': htmlUrl.toString(),
      'pull_request_url': pullRequestUrl.toString(),
      'author_association': authorAssociation.toJson(),
      '_links': links.toJson(),
      'body_text': bodyText,
      'body_html': bodyHtml,
      'reactions': reactions?.toJson(),
      'side': side?.toJson(),
      'start_side': startSide?.toJson(),
      'line': line,
      'original_line': originalLine,
      'start_line': startLine,
      'original_start_line': originalStartLine,
      'subject_type': subjectType?.toJson(),
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
    bodyText,
    bodyHtml,
    reactions,
    side,
    startSide,
    line,
    originalLine,
    startLine,
    originalStartLine,
    subjectType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewComment &&
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
        bodyText == other.bodyText &&
        bodyHtml == other.bodyHtml &&
        reactions == other.reactions &&
        side == other.side &&
        startSide == other.startSide &&
        line == other.line &&
        originalLine == other.originalLine &&
        startLine == other.startLine &&
        originalStartLine == other.originalStartLine &&
        subjectType == other.subjectType;
  }
}
