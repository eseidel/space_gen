// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_team_discussion_comment_legacy_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForTeamDiscussionCommentLegacyRequest {
  const ReactionsCreateForTeamDiscussionCommentLegacyRequest({
    required this.content,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReactionsCreateForTeamDiscussionCommentLegacyRequest].
  factory ReactionsCreateForTeamDiscussionCommentLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReactionsCreateForTeamDiscussionCommentLegacyRequest',
      json,
      () => ReactionsCreateForTeamDiscussionCommentLegacyRequest(
        content:
            ReactionsCreateForTeamDiscussionCommentLegacyRequestContent.fromJson(
              json['content'] as String,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForTeamDiscussionCommentLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForTeamDiscussionCommentLegacyRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the team discussion comment.
  final ReactionsCreateForTeamDiscussionCommentLegacyRequestContent content;

  /// Converts a [ReactionsCreateForTeamDiscussionCommentLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForTeamDiscussionCommentLegacyRequest &&
        content == other.content;
  }
}
