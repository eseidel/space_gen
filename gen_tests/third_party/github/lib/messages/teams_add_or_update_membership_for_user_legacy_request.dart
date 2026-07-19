import 'package:github/model_helpers.dart';
import 'package:github/models/teams_add_or_update_membership_for_user_legacy_request_role.dart';
import 'package:meta/meta.dart';

@immutable
class TeamsAddOrUpdateMembershipForUserLegacyRequest {
  const TeamsAddOrUpdateMembershipForUserLegacyRequest({this.role = .member});

  /// Converts a `Map<String, dynamic>` to a
  /// [TeamsAddOrUpdateMembershipForUserLegacyRequest].
  factory TeamsAddOrUpdateMembershipForUserLegacyRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TeamsAddOrUpdateMembershipForUserLegacyRequest',
      json,
      () => TeamsAddOrUpdateMembershipForUserLegacyRequest(
        role:
            TeamsAddOrUpdateMembershipForUserLegacyRequestRole.maybeFromJson(
              json['role'] as String?,
            ) ??
            .member,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateMembershipForUserLegacyRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateMembershipForUserLegacyRequest.fromJson(json);
  }

  /// The role that this user should have in the team.
  final TeamsAddOrUpdateMembershipForUserLegacyRequestRole role;

  /// Converts a [TeamsAddOrUpdateMembershipForUserLegacyRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'role': role.toJson()};
  }

  @override
  int get hashCode => role.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsAddOrUpdateMembershipForUserLegacyRequest &&
        role == other.role;
  }
}
