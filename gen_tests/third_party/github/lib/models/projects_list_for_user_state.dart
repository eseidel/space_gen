enum ProjectsListForUserState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const ProjectsListForUserState._(this.value);

  /// Creates a ProjectsListForUserState from a json value.
  factory ProjectsListForUserState.fromJson(String json) {
    return ProjectsListForUserState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsListForUserState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListForUserState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListForUserState.fromJson(json);
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
