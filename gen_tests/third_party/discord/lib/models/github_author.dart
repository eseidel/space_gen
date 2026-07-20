import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubAuthor {
  GithubAuthor({required this.name, this.username}) {
    username?.validate(maxLength: 152133);
    name.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubAuthor].
  factory GithubAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubAuthor',
      json,
      () => GithubAuthor(
        username: json['username'] as String?,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubAuthor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubAuthor.fromJson(json);
  }

  final String? username;
  final String name;

  /// Converts a [GithubAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'username': username, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([username, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubAuthor &&
        username == other.username &&
        name == other.name;
  }
}
