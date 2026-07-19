import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_user.dart';
import 'package:meta/meta.dart';

@immutable
class GithubIssue {
  const GithubIssue({
    required this.id,
    required this.number,
    required this.htmlUrl,
    required this.user,
    required this.title,
    this.body,
    this.pullRequest,
  });

  /// Converts a `Map<String, dynamic>` to a [GithubIssue].
  factory GithubIssue.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubIssue',
      json,
      () => GithubIssue(
        id: json['id'] as int,
        number: json['number'] as int,
        htmlUrl: Uri.parse(json['html_url'] as String),
        user: GithubUser.fromJson(json['user'] as Map<String, dynamic>),
        title: json['title'] as String,
        body: json['body'] as String?,
        pullRequest: json['pull_request'],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubIssue? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubIssue.fromJson(json);
  }

  final int id;
  final int number;
  final Uri htmlUrl;
  final GithubUser user;
  final String title;
  final String? body;
  final dynamic pullRequest;

  /// Converts a [GithubIssue] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'html_url': htmlUrl.toString(),
      'user': user.toJson(),
      'title': title,
      'body': body,
      if (pullRequest != null) 'pull_request': pullRequest,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, number, htmlUrl, user, title, body, pullRequest]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubIssue &&
        id == other.id &&
        number == other.number &&
        htmlUrl == other.htmlUrl &&
        user == other.user &&
        title == other.title &&
        body == other.body &&
        pullRequest == other.pullRequest;
  }
}
