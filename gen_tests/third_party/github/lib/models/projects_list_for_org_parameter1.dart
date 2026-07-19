enum ProjectsListForOrgParameter1 {
  open._('open'),
  closed._('closed'),
  all._('all');

  const ProjectsListForOrgParameter1._(this.value);

  /// Creates a ProjectsListForOrgParameter1 from a json value.
  factory ProjectsListForOrgParameter1.fromJson(String json) {
    return ProjectsListForOrgParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsListForOrgParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListForOrgParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListForOrgParameter1.fromJson(json);
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
