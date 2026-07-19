import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsUpdateDiscussionLegacyRequest {
  const TeamsUpdateDiscussionLegacyRequest({this.title, this.body});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsUpdateDiscussionLegacyRequest].
  factory TeamsUpdateDiscussionLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsUpdateDiscussionLegacyRequest',
      json,
      () => TeamsUpdateDiscussionLegacyRequest(
        title: json['title'] as String?,
        body: json['body'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsUpdateDiscussionLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateDiscussionLegacyRequest.fromJson(json);
  }

  /// The discussion post's title.
  final String? title;

  /// The discussion post's body text.
  final String? body;

  /// Converts a [TeamsUpdateDiscussionLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (title != null) 'title': title, if (body != null) 'body': body};
  }

  @override
  int get hashCode => Object.hashAll([title, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsUpdateDiscussionLegacyRequest &&
        title == other.title &&
        body == other.body;
  }
}
