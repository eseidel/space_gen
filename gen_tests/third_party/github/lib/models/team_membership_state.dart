/// The state of the user's membership in the team.
enum TeamMembershipState {
  active._('active'),
  pending._('pending');

  const TeamMembershipState._(this.value);

  /// Creates a TeamMembershipState from a json value.
  factory TeamMembershipState.fromJson(String json) {
    return TeamMembershipState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TeamMembershipState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamMembershipState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamMembershipState.fromJson(json);
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
