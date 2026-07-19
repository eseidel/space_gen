import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template project_collaborator_permission}
/// Project Collaborator Permission
/// Project Collaborator Permission
/// {@endtemplate}
@immutable
class ProjectCollaboratorPermission {
  /// {@macro project_collaborator_permission}
  const ProjectCollaboratorPermission({
    required this.permission,
    required this.user,
  });

  /// Converts a `Map<String, dynamic>` to a [ProjectCollaboratorPermission].
  factory ProjectCollaboratorPermission.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectCollaboratorPermission',
      json,
      () => ProjectCollaboratorPermission(
        permission: json['permission'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectCollaboratorPermission? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectCollaboratorPermission.fromJson(json);
  }

  final String permission;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Converts a [ProjectCollaboratorPermission] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'permission': permission, 'user': user?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([permission, user]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectCollaboratorPermission &&
        permission == other.permission &&
        user == other.user;
  }
}
