/// Determines if the user has a direct, indirect, or mixed relationship to a
/// role
/// Example: `'direct'`
enum UserRoleAssignmentAssignment {
  direct._('direct'),
  indirect._('indirect'),
  mixed._('mixed');

  const UserRoleAssignmentAssignment._(this.value);

  /// Creates a UserRoleAssignmentAssignment from a json value.
  factory UserRoleAssignmentAssignment.fromJson(String json) {
    return UserRoleAssignmentAssignment.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown UserRoleAssignmentAssignment value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static UserRoleAssignmentAssignment? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UserRoleAssignmentAssignment.fromJson(json);
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
