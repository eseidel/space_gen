// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template secret_scanning_location_discussion_comment}
/// Represents a 'discussion_comment' secret scanning location type. This
/// location type shows that a secret was detected in a comment on a discussion.
/// {@endtemplate}
@immutable
class SecretScanningLocationDiscussionComment {
  /// {@macro secret_scanning_location_discussion_comment}
  const SecretScanningLocationDiscussionComment({
    required this.discussionCommentUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningLocationDiscussionComment].
  factory SecretScanningLocationDiscussionComment.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningLocationDiscussionComment',
      json,
      () => SecretScanningLocationDiscussionComment(
        discussionCommentUrl: Uri.parse(
          json['discussion_comment_url'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocationDiscussionComment? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocationDiscussionComment.fromJson(json);
  }

  /// The API URL to get the discussion comment where the secret was detected.
  /// Example:
  /// `'https://github.com/community/community/discussions/39082#discussioncomment-4158232'`
  final Uri discussionCommentUrl;

  /// Converts a [SecretScanningLocationDiscussionComment]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'discussion_comment_url': discussionCommentUrl.toString()};
  }

  @override
  int get hashCode => discussionCommentUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocationDiscussionComment &&
        discussionCommentUrl == other.discussionCommentUrl;
  }
}
