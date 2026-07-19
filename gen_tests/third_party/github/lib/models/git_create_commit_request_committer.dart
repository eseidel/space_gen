import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template git_create_commit_request_committer}
/// Information about the person who is making the commit. By default,
/// `committer` will use the information set in `author`. See the `author` and
/// `committer` object below for details.
/// {@endtemplate}
@immutable
class GitCreateCommitRequestCommitter {
  /// {@macro git_create_commit_request_committer}
  const GitCreateCommitRequestCommitter({this.name, this.email, this.date});

  /// Converts a `Map<String, dynamic>` to a [GitCreateCommitRequestCommitter].
  factory GitCreateCommitRequestCommitter.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateCommitRequestCommitter',
      json,
      () => GitCreateCommitRequestCommitter(
        name: json['name'] as String?,
        email: json['email'] as String?,
        date: maybeParseDateTime(json['date'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateCommitRequestCommitter? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GitCreateCommitRequestCommitter.fromJson(json);
  }

  /// The name of the author (or committer) of the commit
  final String? name;

  /// The email of the author (or committer) of the commit
  final String? email;

  /// Indicates when this commit was authored (or committed). This is a
  /// timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? date;

  /// Converts a [GitCreateCommitRequestCommitter] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name, 'email': ?email, 'date': ?date?.toIso8601String()};
  }

  @override
  int get hashCode => Object.hashAll([name, email, date]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateCommitRequestCommitter &&
        name == other.name &&
        email == other.email &&
        date == other.date;
  }
}
