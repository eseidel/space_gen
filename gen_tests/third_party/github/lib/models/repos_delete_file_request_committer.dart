import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repos_delete_file_request_committer}
/// object containing information about the committer.
/// {@endtemplate}
@immutable
class ReposDeleteFileRequestCommitter {
  /// {@macro repos_delete_file_request_committer}
  const ReposDeleteFileRequestCommitter({this.name, this.email});

  /// Converts a `Map<String, dynamic>` to a [ReposDeleteFileRequestCommitter].
  factory ReposDeleteFileRequestCommitter.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposDeleteFileRequestCommitter',
      json,
      () => ReposDeleteFileRequestCommitter(
        name: json['name'] as String?,
        email: json['email'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposDeleteFileRequestCommitter? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposDeleteFileRequestCommitter.fromJson(json);
  }

  /// The name of the author (or committer) of the commit
  final String? name;

  /// The email of the author (or committer) of the commit
  final String? email;

  /// Converts a [ReposDeleteFileRequestCommitter] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (name != null) 'name': name, if (email != null) 'email': email};
  }

  @override
  int get hashCode => Object.hashAll([name, email]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposDeleteFileRequestCommitter &&
        name == other.name &&
        email == other.email;
  }
}
