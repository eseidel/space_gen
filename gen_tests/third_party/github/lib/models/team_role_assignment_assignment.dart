/// Determines if the team has a direct, indirect, or mixed relationship to a
/// role
/// Example: `'direct'`
enum TeamRoleAssignmentAssignment {
  direct._('direct'),
  indirect._('indirect'),
  mixed._('mixed');

  const TeamRoleAssignmentAssignment._(this.value);

  /// Creates a TeamRoleAssignmentAssignment from a json value.
  factory TeamRoleAssignmentAssignment.fromJson(String json) {
    return TeamRoleAssignmentAssignment.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamRoleAssignmentAssignment value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamRoleAssignmentAssignment? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamRoleAssignmentAssignment.fromJson(json);
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
