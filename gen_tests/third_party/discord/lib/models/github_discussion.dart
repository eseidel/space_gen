import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_user.dart';
import 'package:meta/meta.dart';

@immutable
class GithubDiscussion {
  GithubDiscussion({
    required this.title,
    required this.number,
    required this.htmlUrl,
    required this.user,
    this.answerHtmlUrl,
    this.body,
  }) {
    title.validate(maxLength: 152133);
    body?.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubDiscussion].
  factory GithubDiscussion.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubDiscussion',
      json,
      () => GithubDiscussion(
        title: json['title'] as String,
        number: json['number'] as int,
        htmlUrl: Uri.parse(json['html_url'] as String),
        answerHtmlUrl: maybeParseUri(json['answer_html_url'] as String?),
        body: json['body'] as String?,
        user: GithubUser.fromJson(json['user'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubDiscussion? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubDiscussion.fromJson(json);
  }

  final String title;
  final int number;
  final Uri htmlUrl;
  final Uri? answerHtmlUrl;
  final String? body;
  final GithubUser user;

  /// Converts a [GithubDiscussion] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'number': number,
      'html_url': htmlUrl.toString(),
      'answer_html_url': answerHtmlUrl?.toString(),
      'body': body,
      'user': user.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([title, number, htmlUrl, answerHtmlUrl, body, user]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubDiscussion &&
        title == other.title &&
        number == other.number &&
        htmlUrl == other.htmlUrl &&
        answerHtmlUrl == other.answerHtmlUrl &&
        body == other.body &&
        user == other.user;
  }
}
