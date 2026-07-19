import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsCreateForRepoRequest {
  const ProjectsCreateForRepoRequest({required this.name, this.body});

  /// Converts a `Map<String, dynamic>` to a [ProjectsCreateForRepoRequest].
  factory ProjectsCreateForRepoRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsCreateForRepoRequest',
      json,
      () => ProjectsCreateForRepoRequest(
        name: json['name'] as String,
        body: json['body'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateForRepoRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateForRepoRequest.fromJson(json);
  }

  /// The name of the project.
  final String name;

  /// The description of the project.
  final String? body;

  /// Converts a [ProjectsCreateForRepoRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'body': body};
  }

  @override
  int get hashCode => Object.hashAll([name, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateForRepoRequest &&
        name == other.name &&
        body == other.body;
  }
}
