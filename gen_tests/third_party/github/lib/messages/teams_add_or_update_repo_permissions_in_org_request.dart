import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsAddOrUpdateRepoPermissionsInOrgRequest {
  const TeamsAddOrUpdateRepoPermissionsInOrgRequest({this.permission});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsAddOrUpdateRepoPermissionsInOrgRequest].
  factory TeamsAddOrUpdateRepoPermissionsInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsAddOrUpdateRepoPermissionsInOrgRequest',
      json,
      () => TeamsAddOrUpdateRepoPermissionsInOrgRequest(
        permission: json['permission'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateRepoPermissionsInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateRepoPermissionsInOrgRequest.fromJson(json);
  }

  /// The permission to grant the team on this repository. We accept the
  /// following permissions to be set: `pull`, `triage`, `push`, `maintain`,
  /// `admin` and you can also specify a custom repository role name, if the
  /// owning organization has defined any. If no permission is specified, the
  /// team's `permission` attribute will be used to determine what permission
  /// to grant the team on this repository.
  final String? permission;

  /// Converts a [TeamsAddOrUpdateRepoPermissionsInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (permission != null) 'permission': permission};
  }

  @override
  int get hashCode => permission.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsAddOrUpdateRepoPermissionsInOrgRequest &&
        permission == other.permission;
  }
}
