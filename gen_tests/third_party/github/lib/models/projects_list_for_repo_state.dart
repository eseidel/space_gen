enum ProjectsListForRepoState {
  open._('open'),
  closed._('closed'),
  all._('all');

  const ProjectsListForRepoState._(this.value);

  /// Creates a ProjectsListForRepoState from a json value.
  factory ProjectsListForRepoState.fromJson(String json) {
    return ProjectsListForRepoState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsListForRepoState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListForRepoState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListForRepoState.fromJson(json);
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
