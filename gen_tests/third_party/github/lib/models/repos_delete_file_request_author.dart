import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_delete_file_request_author}
/// object containing information about the author.
/// {@endtemplate}
@immutable
class ReposDeleteFileRequestAuthor {
  /// {@macro repos_delete_file_request_author}
  const ReposDeleteFileRequestAuthor({this.name, this.email});

  /// Converts a `Map<String, dynamic>` to a [ReposDeleteFileRequestAuthor].
  factory ReposDeleteFileRequestAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposDeleteFileRequestAuthor',
      json,
      () => ReposDeleteFileRequestAuthor(
        name: json['name'] as String?,
        email: json['email'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposDeleteFileRequestAuthor? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposDeleteFileRequestAuthor.fromJson(json);
  }

  /// The name of the author (or committer) of the commit
  final String? name;

  /// The email of the author (or committer) of the commit
  final String? email;

  /// Converts a [ReposDeleteFileRequestAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name, 'email': ?email};
  }

  @override
  int get hashCode => Object.hashAll([name, email]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposDeleteFileRequestAuthor &&
        name == other.name &&
        email == other.email;
  }
}
