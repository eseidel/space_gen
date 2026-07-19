import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsUpdateDiscussionInOrgRequest {
  const TeamsUpdateDiscussionInOrgRequest({this.title, this.body});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsUpdateDiscussionInOrgRequest].
  factory TeamsUpdateDiscussionInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsUpdateDiscussionInOrgRequest',
      json,
      () => TeamsUpdateDiscussionInOrgRequest(
        title: json['title'] as String?,
        body: json['body'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsUpdateDiscussionInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateDiscussionInOrgRequest.fromJson(json);
  }

  /// The discussion post's title.
  final String? title;

  /// The discussion post's body text.
  final String? body;

  /// Converts a [TeamsUpdateDiscussionInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': ?title, 'body': ?body};
  }

  @override
  int get hashCode => Object.hashAll([title, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsUpdateDiscussionInOrgRequest &&
        title == other.title &&
        body == other.body;
  }
}
