import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_team_discussion_comment_in_org_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForTeamDiscussionCommentInOrgRequest {
  const ReactionsCreateForTeamDiscussionCommentInOrgRequest({
    required this.content,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReactionsCreateForTeamDiscussionCommentInOrgRequest].
  factory ReactionsCreateForTeamDiscussionCommentInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReactionsCreateForTeamDiscussionCommentInOrgRequest',
      json,
      () => ReactionsCreateForTeamDiscussionCommentInOrgRequest(
        content:
            ReactionsCreateForTeamDiscussionCommentInOrgRequestContent.fromJson(
              json['content'] as String,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForTeamDiscussionCommentInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForTeamDiscussionCommentInOrgRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the team discussion comment.
  final ReactionsCreateForTeamDiscussionCommentInOrgRequestContent content;

  /// Converts a [ReactionsCreateForTeamDiscussionCommentInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForTeamDiscussionCommentInOrgRequest &&
        content == other.content;
  }
}
