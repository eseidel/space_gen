import 'package:github/model_helpers.dart';
import 'package:github/models/projects_add_collaborator_request_permission.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsAddCollaboratorRequest {
  const ProjectsAddCollaboratorRequest({
    this.permission = ProjectsAddCollaboratorRequestPermission.write,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectsAddCollaboratorRequest].
  factory ProjectsAddCollaboratorRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsAddCollaboratorRequest',
      json,
      () => ProjectsAddCollaboratorRequest(
        permission:
            ProjectsAddCollaboratorRequestPermission.maybeFromJson(
              json['permission'] as String?,
            ) ??
            ProjectsAddCollaboratorRequestPermission.write,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsAddCollaboratorRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsAddCollaboratorRequest.fromJson(json);
  }

  /// The permission to grant the collaborator.
  /// Example: `'write'`
  final ProjectsAddCollaboratorRequestPermission permission;

  /// Converts a [ProjectsAddCollaboratorRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'permission': permission.toJson()};
  }

  @override
  int get hashCode => permission.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsAddCollaboratorRequest &&
        permission == other.permission;
  }
}
