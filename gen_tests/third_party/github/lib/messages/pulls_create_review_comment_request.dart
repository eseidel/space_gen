// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/pulls_create_review_comment_request_side.dart';
import 'package:github/models/pulls_create_review_comment_request_start_side.dart';
import 'package:github/models/pulls_create_review_comment_request_subject_type.dart';
import 'package:meta/meta.dart';

@immutable
class PullsCreateReviewCommentRequest {
  const PullsCreateReviewCommentRequest({
    required this.body,
    required this.commitId,
    required this.path,
    @deprecated this.position,
    this.side,
    this.line,
    this.startLine,
    this.startSide,
    this.inReplyTo,
    this.subjectType,
  });

  /// Converts a `Map<String, dynamic>` to a [PullsCreateReviewCommentRequest].
  factory PullsCreateReviewCommentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsCreateReviewCommentRequest',
      json,
      () => PullsCreateReviewCommentRequest(
        body: json['body'] as String,
        commitId: json['commit_id'] as String,
        path: json['path'] as String,
        position: json['position'] as int?,
        side: PullsCreateReviewCommentRequestSide.maybeFromJson(
          json['side'] as String?,
        ),
        line: json['line'] as int?,
        startLine: json['start_line'] as int?,
        startSide: PullsCreateReviewCommentRequestStartSide.maybeFromJson(
          json['start_side'] as String?,
        ),
        inReplyTo: json['in_reply_to'] as int?,
        subjectType: PullsCreateReviewCommentRequestSubjectType.maybeFromJson(
          json['subject_type'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsCreateReviewCommentRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsCreateReviewCommentRequest.fromJson(json);
  }

  /// The text of the review comment.
  final String body;

  /// The SHA of the commit needing a comment. Not using the latest commit SHA
  /// may render your comment outdated if a subsequent commit modifies the
  /// line you specify as the `position`.
  final String commitId;

  /// The relative path to the file that necessitates a comment.
  final String path;

  /// **This parameter is closing down. Use `line` instead**. The position in
  /// the diff where you want to add a review comment. Note this value is not
  /// the same as the line number in the file. The position value equals the
  /// number of lines down from the first "@@" hunk header in the file you
  /// want to add a comment. The line just below the "@@" line is position 1,
  /// the next line is position 2, and so on. The position in the diff
  /// continues to increase through lines of whitespace and additional hunks
  /// until the beginning of a new file.
  @deprecated
  final int? position;

  /// In a split diff view, the side of the diff that the pull request's
  /// changes appear on. Can be `LEFT` or `RIGHT`. Use `LEFT` for deletions
  /// that appear in red. Use `RIGHT` for additions that appear in green or
  /// unchanged lines that appear in white and are shown for context. For a
  /// multi-line comment, side represents whether the last line of the comment
  /// range is a deletion or addition. For more information, see "[Diff view
  /// options](https://docs.github.com/articles/about-comparing-branches-in-pull-requests#diff-view-options)"
  /// in the GitHub Help documentation.
  final PullsCreateReviewCommentRequestSide? side;

  /// **Required unless using `subject_type:file`**. The line of the blob in
  /// the pull request diff that the comment applies to. For a multi-line
  /// comment, the last line of the range that your comment applies to.
  final int? line;

  /// **Required when using multi-line comments unless using `in_reply_to`**.
  /// The `start_line` is the first line in the pull request diff that your
  /// multi-line comment applies to. To learn more about multi-line comments,
  /// see "[Commenting on a pull
  /// request](https://docs.github.com/articles/commenting-on-a-pull-request#adding-line-comments-to-a-pull-request)"
  /// in the GitHub Help documentation.
  final int? startLine;

  /// **Required when using multi-line comments unless using `in_reply_to`**.
  /// The `start_side` is the starting side of the diff that the comment
  /// applies to. Can be `LEFT` or `RIGHT`. To learn more about multi-line
  /// comments, see "[Commenting on a pull
  /// request](https://docs.github.com/articles/commenting-on-a-pull-request#adding-line-comments-to-a-pull-request)"
  /// in the GitHub Help documentation. See `side` in this table for
  /// additional context.
  final PullsCreateReviewCommentRequestStartSide? startSide;

  /// The ID of the review comment to reply to. To find the ID of a review
  /// comment with ["List review comments on a pull
  /// request"](#list-review-comments-on-a-pull-request). When specified, all
  /// parameters other than `body` in the request body are ignored.
  /// Example: `2`
  final int? inReplyTo;

  /// The level at which the comment is targeted.
  final PullsCreateReviewCommentRequestSubjectType? subjectType;

  /// Converts a [PullsCreateReviewCommentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'commit_id': commitId,
      'path': path,
      'position': position,
      'side': side?.toJson(),
      'line': line,
      'start_line': startLine,
      'start_side': startSide?.toJson(),
      'in_reply_to': inReplyTo,
      'subject_type': subjectType?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    body,
    commitId,
    path,
    position,
    side,
    line,
    startLine,
    startSide,
    inReplyTo,
    subjectType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsCreateReviewCommentRequest &&
        body == other.body &&
        commitId == other.commitId &&
        path == other.path &&
        position == other.position &&
        side == other.side &&
        line == other.line &&
        startLine == other.startLine &&
        startSide == other.startSide &&
        inReplyTo == other.inReplyTo &&
        subjectType == other.subjectType;
  }
}
