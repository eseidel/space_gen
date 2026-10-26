enum ProjectsListCollaboratorsAffiliation {
  outside._('outside'),
  direct._('direct'),
  all._('all');

  const ProjectsListCollaboratorsAffiliation._(this.value);

  /// Creates a ProjectsListCollaboratorsAffiliation from a json value.
  factory ProjectsListCollaboratorsAffiliation.fromJson(String json) {
    return ProjectsListCollaboratorsAffiliation.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsListCollaboratorsAffiliation value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsListCollaboratorsAffiliation? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsListCollaboratorsAffiliation.fromJson(json);
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
