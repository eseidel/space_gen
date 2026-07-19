import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_create_or_update_file_contents_request_author}
/// The author of the file. Default: The `committer` or the authenticated user
/// if you omit `committer`.
/// {@endtemplate}
@immutable
class ReposCreateOrUpdateFileContentsRequestAuthor {
  /// {@macro repos_create_or_update_file_contents_request_author}
  const ReposCreateOrUpdateFileContentsRequestAuthor({
    required this.name,
    required this.email,
    this.date,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateOrUpdateFileContentsRequestAuthor].
  factory ReposCreateOrUpdateFileContentsRequestAuthor.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateOrUpdateFileContentsRequestAuthor',
      json,
      () => ReposCreateOrUpdateFileContentsRequestAuthor(
        name: json['name'] as String,
        email: json['email'] as String,
        date: json['date'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateOrUpdateFileContentsRequestAuthor? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateOrUpdateFileContentsRequestAuthor.fromJson(json);
  }

  /// The name of the author or committer of the commit. You'll receive a
  /// `422` status code if `name` is omitted.
  final String name;

  /// The email of the author or committer of the commit. You'll receive a
  /// `422` status code if `email` is omitted.
  final String email;

  /// Example: `'"2013-01-15T17:13:22+05:00"'`
  final String? date;

  /// Converts a [ReposCreateOrUpdateFileContentsRequestAuthor]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'date': ?date};
  }

  @override
  int get hashCode => Object.hashAll([name, email, date]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateOrUpdateFileContentsRequestAuthor &&
        name == other.name &&
        email == other.email &&
        date == other.date;
  }
}
