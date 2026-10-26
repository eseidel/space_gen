enum ProjectsListForOrgState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const ProjectsListForOrgState._(this.value);

  /// Creates a ProjectsListForOrgState from a json value.
  factory ProjectsListForOrgState.fromJson(String json) {
    return ProjectsListForOrgState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ProjectsListForOrgState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListForOrgState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListForOrgState.fromJson(json);
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
