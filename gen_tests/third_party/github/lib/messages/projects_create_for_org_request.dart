import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsCreateForOrgRequest {
  const ProjectsCreateForOrgRequest({required this.name, this.body});

  /// Converts a `Map<String, dynamic>` to a [ProjectsCreateForOrgRequest].
  factory ProjectsCreateForOrgRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsCreateForOrgRequest',
      json,
      () => ProjectsCreateForOrgRequest(
        name: json['name'] as String,
        body: json['body'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateForOrgRequest.fromJson(json);
  }

  /// The name of the project.
  final String name;

  /// The description of the project.
  final String? body;

  /// Converts a [ProjectsCreateForOrgRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'body': body};
  }

  @override
  int get hashCode => Object.hashAll([name, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateForOrgRequest &&
        name == other.name &&
        body == other.body;
  }
}
