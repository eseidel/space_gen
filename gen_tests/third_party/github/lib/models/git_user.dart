import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template git_user}
/// Git User
/// Metaproperties for Git author/committer information.
/// {@endtemplate}
@immutable
class GitUser {
  /// {@macro git_user}
  const GitUser({this.name, this.email, this.date});

  /// Converts a `Map<String, dynamic>` to a [GitUser].
  factory GitUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitUser',
      json,
      () => GitUser(
        name: json['name'] as String?,
        email: json['email'] as String?,
        date: json['date'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitUser.fromJson(json);
  }

  /// Example: `'"Chris Wanstrath"'`
  final String? name;

  /// Example: `'"chris@ozmm.org"'`
  final String? email;

  /// Example: `'"2007-10-29T02:42:39.000-07:00"'`
  final String? date;

  /// Converts a [GitUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (date != null) 'date': date,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, email, date]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitUser &&
        name == other.name &&
        email == other.email &&
        date == other.date;
  }
}
