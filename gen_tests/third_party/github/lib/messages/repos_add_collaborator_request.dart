import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposAddCollaboratorRequest {
  const ReposAddCollaboratorRequest({this.permission = 'push'});

  /// Converts a `Map<String, dynamic>` to a [ReposAddCollaboratorRequest].
  factory ReposAddCollaboratorRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposAddCollaboratorRequest',
      json,
      () => ReposAddCollaboratorRequest(
        permission: (json['permission'] as String?) ?? 'push',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposAddCollaboratorRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposAddCollaboratorRequest.fromJson(json);
  }

  /// The permission to grant the collaborator. **Only valid on
  /// organization-owned repositories.** We accept the following permissions
  /// to be set: `pull`, `triage`, `push`, `maintain`, `admin` and you can
  /// also specify a custom repository role name, if the owning organization
  /// has defined any.
  final String? permission;

  /// Converts a [ReposAddCollaboratorRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'permission': permission};
  }

  @override
  int get hashCode => permission.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposAddCollaboratorRequest &&
        permission == other.permission;
  }
}
