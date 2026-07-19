import 'package:github/model_helpers.dart';
import 'package:github/models/collaborator.dart';
import 'package:meta/meta.dart';

/// {@template repository_collaborator_permission}
/// Repository Collaborator Permission
/// Repository Collaborator Permission
/// {@endtemplate}
@immutable
class RepositoryCollaboratorPermission {
  /// {@macro repository_collaborator_permission}
  const RepositoryCollaboratorPermission({
    required this.permission,
    required this.roleName,
    required this.user,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryCollaboratorPermission].
  factory RepositoryCollaboratorPermission.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryCollaboratorPermission',
      json,
      () => RepositoryCollaboratorPermission(
        permission: json['permission'] as String,
        roleName: json['role_name'] as String,
        user: Collaborator.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryCollaboratorPermission? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryCollaboratorPermission.fromJson(json);
  }

  final String permission;

  /// Example: `'admin'`
  final String roleName;

  /// Collaborator
  /// Collaborator
  final Collaborator? user;

  /// Converts a [RepositoryCollaboratorPermission] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'permission': permission,
      'role_name': roleName,
      'user': user?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([permission, roleName, user]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryCollaboratorPermission &&
        permission == other.permission &&
        roleName == other.roleName &&
        user == other.user;
  }
}
