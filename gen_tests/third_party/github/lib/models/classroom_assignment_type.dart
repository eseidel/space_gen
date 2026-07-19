/// Whether it's a group assignment or individual assignment.
/// Example: `'individual'`
enum ClassroomAssignmentType {
  individual._('individual'),
  group._('group');

  const ClassroomAssignmentType._(this.value);

  /// Creates a ClassroomAssignmentType from a json value.
  factory ClassroomAssignmentType.fromJson(String json) {
    return ClassroomAssignmentType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ClassroomAssignmentType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ClassroomAssignmentType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ClassroomAssignmentType.fromJson(json);
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
