import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_classroom_user}
/// Simple Classroom User
/// A GitHub user simplified for Classroom.
/// {@endtemplate}
@immutable
class SimpleClassroomUser {
  /// {@macro simple_classroom_user}
  const SimpleClassroomUser({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleClassroomUser].
  factory SimpleClassroomUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleClassroomUser',
      json,
      () => SimpleClassroomUser(
        id: json['id'] as int,
        login: json['login'] as String,
        avatarUrl: Uri.parse(json['avatar_url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleClassroomUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleClassroomUser.fromJson(json);
  }

  /// Example: `1`
  final int id;

  /// Example: `'octocat'`
  final String login;

  /// Example: `'https://github.com/images/error/octocat_happy.gif'`
  final Uri avatarUrl;

  /// Example: `'https://github.com/octocat'`
  final Uri htmlUrl;

  /// Converts a [SimpleClassroomUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'avatar_url': avatarUrl.toString(),
      'html_url': htmlUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, login, avatarUrl, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleClassroomUser &&
        id == other.id &&
        login == other.login &&
        avatarUrl == other.avatarUrl &&
        htmlUrl == other.htmlUrl;
  }
}
