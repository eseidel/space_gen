/// Whether it's a Group Assignment or Individual Assignment.
/// Example: `'individual'`
enum SimpleClassroomAssignmentType {
  individual._('individual'),
  group._('group');

  const SimpleClassroomAssignmentType._(this.value);

  /// Creates a SimpleClassroomAssignmentType from a json value.
  factory SimpleClassroomAssignmentType.fromJson(String json) {
    return SimpleClassroomAssignmentType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SimpleClassroomAssignmentType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SimpleClassroomAssignmentType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SimpleClassroomAssignmentType.fromJson(json);
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
