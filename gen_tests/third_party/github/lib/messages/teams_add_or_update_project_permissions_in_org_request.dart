// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/teams_add_or_update_project_permissions_in_org_request_permission.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsAddOrUpdateProjectPermissionsInOrgRequest {
  const TeamsAddOrUpdateProjectPermissionsInOrgRequest({this.permission});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsAddOrUpdateProjectPermissionsInOrgRequest].
  factory TeamsAddOrUpdateProjectPermissionsInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsAddOrUpdateProjectPermissionsInOrgRequest',
      json,
      () => TeamsAddOrUpdateProjectPermissionsInOrgRequest(
        permission:
            TeamsAddOrUpdateProjectPermissionsInOrgRequestPermission.maybeFromJson(
              json['permission'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateProjectPermissionsInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateProjectPermissionsInOrgRequest.fromJson(json);
  }

  /// The permission to grant to the team for this project. Default: the
  /// team's `permission` attribute will be used to determine what permission
  /// to grant the team on this project. Note that, if you choose not to pass
  /// any parameters, you'll need to set `Content-Length` to zero when calling
  /// this endpoint. For more information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  final TeamsAddOrUpdateProjectPermissionsInOrgRequestPermission? permission;

  /// Converts a [TeamsAddOrUpdateProjectPermissionsInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'permission': ?permission?.toJson()};
  }

  @override
  int get hashCode => permission.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsAddOrUpdateProjectPermissionsInOrgRequest &&
        permission == other.permission;
  }
}
