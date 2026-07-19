import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsUpdateDiscussionCommentLegacyRequest {
  const TeamsUpdateDiscussionCommentLegacyRequest({required this.body});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsUpdateDiscussionCommentLegacyRequest].
  factory TeamsUpdateDiscussionCommentLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsUpdateDiscussionCommentLegacyRequest',
      json,
      () => TeamsUpdateDiscussionCommentLegacyRequest(
        body: json['body'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsUpdateDiscussionCommentLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateDiscussionCommentLegacyRequest.fromJson(json);
  }

  /// The discussion comment's body text.
  final String body;

  /// Converts a [TeamsUpdateDiscussionCommentLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'body': body};
  }

  @override
  int get hashCode => body.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsUpdateDiscussionCommentLegacyRequest &&
        body == other.body;
  }
}
