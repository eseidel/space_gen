/// The permission to grant the collaborator.
/// Example: `'write'`
enum ProjectsAddCollaboratorRequestPermission {
  read._('read'),
  write._('write'),
  admin._('admin');

  const ProjectsAddCollaboratorRequestPermission._(this.value);

  /// Creates a ProjectsAddCollaboratorRequestPermission from a json value.
  factory ProjectsAddCollaboratorRequestPermission.fromJson(String json) {
    return ProjectsAddCollaboratorRequestPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsAddCollaboratorRequestPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsAddCollaboratorRequestPermission? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectsAddCollaboratorRequestPermission.fromJson(json);
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
