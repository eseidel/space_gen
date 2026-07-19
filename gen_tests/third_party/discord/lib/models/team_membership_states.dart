enum TeamMembershipStates {
  /// User has been invited to the team.
  invited._(1),

  /// User has accepted the team invitation.
  accepted._(2);

  const TeamMembershipStates._(this.value);

  /// Creates a TeamMembershipStates from a json value.
  factory TeamMembershipStates.fromJson(int json) {
    return TeamMembershipStates.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TeamMembershipStates value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamMembershipStates? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return TeamMembershipStates.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
