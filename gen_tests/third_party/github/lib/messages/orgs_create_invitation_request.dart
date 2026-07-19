import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_create_invitation_request_role.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsCreateInvitationRequest {
  const OrgsCreateInvitationRequest({
    this.inviteeId,
    this.email,
    this.role = OrgsCreateInvitationRequestRole.directMember,
    this.teamIds,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsCreateInvitationRequest].
  factory OrgsCreateInvitationRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsCreateInvitationRequest',
      json,
      () => OrgsCreateInvitationRequest(
        inviteeId: json['invitee_id'] as int?,
        email: json['email'] as String?,
        role:
            OrgsCreateInvitationRequestRole.maybeFromJson(
              json['role'] as String?,
            ) ??
            OrgsCreateInvitationRequestRole.directMember,
        teamIds: (json['team_ids'] as List?)?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsCreateInvitationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsCreateInvitationRequest.fromJson(json);
  }

  /// **Required unless you provide `email`**. GitHub user ID for the person
  /// you are inviting.
  final int? inviteeId;

  /// **Required unless you provide `invitee_id`**. Email address of the
  /// person you are inviting, which can be an existing GitHub user.
  final String? email;

  /// The role for the new member.
  /// * `admin` - Organization owners with full administrative rights to the
  /// organization and complete access to all repositories and teams.
  /// * `direct_member` - Non-owner organization members with ability to see
  /// other members and join teams by invitation.
  /// * `billing_manager` - Non-owner organization members with ability to
  /// manage the billing settings of your organization.
  /// * `reinstate` - The previous role assigned to the invitee before they
  /// were removed from your organization. Can be one of the roles listed
  /// above. Only works if the invitee was previously part of your
  /// organization.
  final OrgsCreateInvitationRequestRole role;

  /// Specify IDs for the teams you want to invite new members to.
  final List<int>? teamIds;

  /// Converts an [OrgsCreateInvitationRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (inviteeId != null) 'invitee_id': inviteeId,
      if (email != null) 'email': email,
      'role': role.toJson(),
      if (teamIds != null) 'team_ids': teamIds,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([inviteeId, email, role, listHash(teamIds)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsCreateInvitationRequest &&
        inviteeId == other.inviteeId &&
        email == other.email &&
        role == other.role &&
        listsEqual(teamIds, other.teamIds);
  }
}
