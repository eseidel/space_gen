import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MigrationsMapCommitAuthorRequest {
  const MigrationsMapCommitAuthorRequest({this.email, this.name});

  /// Converts a `Map<String, dynamic>` to a [MigrationsMapCommitAuthorRequest].
  factory MigrationsMapCommitAuthorRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MigrationsMapCommitAuthorRequest',
      json,
      () => MigrationsMapCommitAuthorRequest(
        email: json['email'] as String?,
        name: json['name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MigrationsMapCommitAuthorRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsMapCommitAuthorRequest.fromJson(json);
  }

  /// The new Git author email.
  final String? email;

  /// The new Git author name.
  final String? name;

  /// Converts a [MigrationsMapCommitAuthorRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'email': ?email, 'name': ?name};
  }

  @override
  int get hashCode => Object.hashAll([email, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MigrationsMapCommitAuthorRequest &&
        email == other.email &&
        name == other.name;
  }
}
