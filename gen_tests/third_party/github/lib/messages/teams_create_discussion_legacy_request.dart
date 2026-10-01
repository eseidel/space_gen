// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsCreateDiscussionLegacyRequest {
  const TeamsCreateDiscussionLegacyRequest({
    required this.title,
    required this.body,
    this.private = false,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsCreateDiscussionLegacyRequest].
  factory TeamsCreateDiscussionLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsCreateDiscussionLegacyRequest',
      json,
      () => TeamsCreateDiscussionLegacyRequest(
        title: json['title'] as String,
        body: json['body'] as String,
        private: (json['private'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsCreateDiscussionLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsCreateDiscussionLegacyRequest.fromJson(json);
  }

  /// The discussion post's title.
  final String title;

  /// The discussion post's body text.
  final String body;

  /// Private posts are only visible to team members, organization owners, and
  /// team maintainers. Public posts are visible to all members of the
  /// organization. Set to `true` to create a private post.
  final bool private;

  /// Converts a [TeamsCreateDiscussionLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body, 'private': private};
  }

  @override
  int get hashCode => Object.hashAll([title, body, private]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsCreateDiscussionLegacyRequest &&
        title == other.title &&
        body == other.body &&
        private == other.private;
  }
}
