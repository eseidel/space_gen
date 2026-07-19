import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_commit_committer}
/// Information about the Git committer
/// {@endtemplate}
@immutable
class SimpleCommitCommitter {
  /// {@macro simple_commit_committer}
  const SimpleCommitCommitter({required this.name, required this.email});

  /// Converts a `Map<String, dynamic>` to a [SimpleCommitCommitter].
  factory SimpleCommitCommitter.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleCommitCommitter',
      json,
      () => SimpleCommitCommitter(
        name: json['name'] as String,
        email: json['email'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleCommitCommitter? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleCommitCommitter.fromJson(json);
  }

  /// Name of the commit's committer
  /// Example: `'Monalisa Octocat'`
  final String name;

  /// Git email address of the commit's committer
  /// Example: `'monalisa.octocat@example.com'`
  final String email;

  /// Converts a [SimpleCommitCommitter] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }

  @override
  int get hashCode => Object.hashAll([name, email]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleCommitCommitter &&
        name == other.name &&
        email == other.email;
  }
}
