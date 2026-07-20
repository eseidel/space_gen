import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_user.dart';
import 'package:meta/meta.dart';

@immutable
class GithubReview {
  GithubReview({
    required this.user,
    required this.htmlUrl,
    required this.state,
    this.body,
  }) {
    body?.validate(maxLength: 152133);
    state.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubReview].
  factory GithubReview.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubReview',
      json,
      () => GithubReview(
        user: GithubUser.fromJson(json['user'] as Map<String, dynamic>),
        body: json['body'] as String?,
        htmlUrl: Uri.parse(json['html_url'] as String),
        state: json['state'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubReview? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubReview.fromJson(json);
  }

  final GithubUser user;
  final String? body;
  final Uri htmlUrl;
  final String state;

  /// Converts a [GithubReview] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'body': body,
      'html_url': htmlUrl.toString(),
      'state': state,
    };
  }

  @override
  int get hashCode => Object.hashAll([user, body, htmlUrl, state]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubReview &&
        user == other.user &&
        body == other.body &&
        htmlUrl == other.htmlUrl &&
        state == other.state;
  }
}
