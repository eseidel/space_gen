import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubUser {
  const GithubUser({
    required this.id,
    required this.login,
    required this.htmlUrl,
    required this.avatarUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [GithubUser].
  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubUser',
      json,
      () => GithubUser(
        id: json['id'] as int,
        login: json['login'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        avatarUrl: Uri.parse(json['avatar_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubUser.fromJson(json);
  }

  final int id;
  final String login;
  final Uri htmlUrl;
  final Uri avatarUrl;

  /// Converts a [GithubUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'html_url': htmlUrl.toString(),
      'avatar_url': avatarUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, login, htmlUrl, avatarUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubUser &&
        id == other.id &&
        login == other.login &&
        htmlUrl == other.htmlUrl &&
        avatarUrl == other.avatarUrl;
  }
}
