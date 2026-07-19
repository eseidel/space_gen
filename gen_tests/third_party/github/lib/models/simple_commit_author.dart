import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_commit_author}
/// Information about the Git author
/// {@endtemplate}
@immutable
class SimpleCommitAuthor {
  /// {@macro simple_commit_author}
  const SimpleCommitAuthor({required this.name, required this.email});

  /// Converts a `Map<String, dynamic>` to a [SimpleCommitAuthor].
  factory SimpleCommitAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleCommitAuthor',
      json,
      () => SimpleCommitAuthor(
        name: json['name'] as String,
        email: json['email'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleCommitAuthor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleCommitAuthor.fromJson(json);
  }

  /// Name of the commit's author
  /// Example: `'Monalisa Octocat'`
  final String name;

  /// Git email address of the commit's author
  /// Example: `'monalisa.octocat@example.com'`
  final String email;

  /// Converts a [SimpleCommitAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  @override
  int get hashCode => Object.hashAll([name, email]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleCommitAuthor &&
        name == other.name &&
        email == other.email;
  }
}
