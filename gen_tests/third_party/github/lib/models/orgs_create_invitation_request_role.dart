/// The role for the new member.
/// * `admin` - Organization owners with full administrative rights to the
/// organization and complete access to all repositories and teams.
/// * `direct_member` - Non-owner organization members with ability to see other
/// members and join teams by invitation.
/// * `billing_manager` - Non-owner organization members with ability to manage
/// the billing settings of your organization.
/// * `reinstate` - The previous role assigned to the invitee before they were
/// removed from your organization. Can be one of the roles listed above. Only
/// works if the invitee was previously part of your organization.
enum OrgsCreateInvitationRequestRole {
  admin._('admin'),
  directMember._('direct_member'),
  billingManager._('billing_manager'),
  reinstate._('reinstate');

  const OrgsCreateInvitationRequestRole._(this.value);

  /// Creates a OrgsCreateInvitationRequestRole from a json value.
  factory OrgsCreateInvitationRequestRole.fromJson(String json) {
    return OrgsCreateInvitationRequestRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsCreateInvitationRequestRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsCreateInvitationRequestRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsCreateInvitationRequestRole.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
