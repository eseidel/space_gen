// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsCreateDiscussionCommentLegacyRequest {
  const TeamsCreateDiscussionCommentLegacyRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsCreateDiscussionCommentLegacyRequest].
  factory TeamsCreateDiscussionCommentLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsCreateDiscussionCommentLegacyRequest',
      json,
      () => TeamsCreateDiscussionCommentLegacyRequest(
        body: json['body'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsCreateDiscussionCommentLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsCreateDiscussionCommentLegacyRequest.fromJson(json);
  }

  /// The discussion comment's body text.
  final String body;

  /// Converts a [TeamsCreateDiscussionCommentLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsCreateDiscussionCommentLegacyRequest &&
        body == other.body;
  }
}
