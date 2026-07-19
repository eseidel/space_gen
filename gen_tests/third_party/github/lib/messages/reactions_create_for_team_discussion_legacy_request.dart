import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_team_discussion_legacy_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForTeamDiscussionLegacyRequest {
  const ReactionsCreateForTeamDiscussionLegacyRequest({required this.content});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReactionsCreateForTeamDiscussionLegacyRequest].
  factory ReactionsCreateForTeamDiscussionLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReactionsCreateForTeamDiscussionLegacyRequest',
      json,
      () => ReactionsCreateForTeamDiscussionLegacyRequest(
        content: ReactionsCreateForTeamDiscussionLegacyRequestContent.fromJson(
          json['content'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForTeamDiscussionLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForTeamDiscussionLegacyRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the team discussion.
  final ReactionsCreateForTeamDiscussionLegacyRequestContent content;

  /// Converts a [ReactionsCreateForTeamDiscussionLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForTeamDiscussionLegacyRequest &&
        content == other.content;
  }
}
