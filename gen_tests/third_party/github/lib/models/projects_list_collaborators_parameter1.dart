enum ProjectsListCollaboratorsParameter1 {
  outside._('outside'),
  direct._('direct'),
  all._('all');

  const ProjectsListCollaboratorsParameter1._(this.value);

  /// Creates a ProjectsListCollaboratorsParameter1 from a json value.
  factory ProjectsListCollaboratorsParameter1.fromJson(String json) {
    return ProjectsListCollaboratorsParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsListCollaboratorsParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListCollaboratorsParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListCollaboratorsParameter1.fromJson(json);
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
