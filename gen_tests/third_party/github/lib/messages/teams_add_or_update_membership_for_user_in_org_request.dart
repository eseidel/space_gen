import 'package:github/model_helpers.dart';
import 'package:github/models/teams_add_or_update_membership_for_user_in_org_request_role.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsAddOrUpdateMembershipForUserInOrgRequest {
  const TeamsAddOrUpdateMembershipForUserInOrgRequest({this.role = .member});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsAddOrUpdateMembershipForUserInOrgRequest].
  factory TeamsAddOrUpdateMembershipForUserInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsAddOrUpdateMembershipForUserInOrgRequest',
      json,
      () => TeamsAddOrUpdateMembershipForUserInOrgRequest(
        role:
            TeamsAddOrUpdateMembershipForUserInOrgRequestRole.maybeFromJson(
              json['role'] as String?,
            ) ??
            .member,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateMembershipForUserInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateMembershipForUserInOrgRequest.fromJson(json);
  }

  /// The role that this user should have in the team.
  final TeamsAddOrUpdateMembershipForUserInOrgRequestRole role;

  /// Converts a [TeamsAddOrUpdateMembershipForUserInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'role': role.toJson()};
  }

  @override
  int get hashCode => role.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsAddOrUpdateMembershipForUserInOrgRequest &&
        role == other.role;
  }
}
