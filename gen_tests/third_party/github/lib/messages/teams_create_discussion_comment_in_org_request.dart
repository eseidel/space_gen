import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsCreateDiscussionCommentInOrgRequest {
  const TeamsCreateDiscussionCommentInOrgRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsCreateDiscussionCommentInOrgRequest].
  factory TeamsCreateDiscussionCommentInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsCreateDiscussionCommentInOrgRequest',
      json,
      () => TeamsCreateDiscussionCommentInOrgRequest(
        body: json['body'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsCreateDiscussionCommentInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsCreateDiscussionCommentInOrgRequest.fromJson(json);
  }

  /// The discussion comment's body text.
  final String body;

  /// Converts a [TeamsCreateDiscussionCommentInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsCreateDiscussionCommentInOrgRequest &&
        body == other.body;
  }
}
