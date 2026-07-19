/// The baseline permission that all organization members have on this project.
/// Only present if owner is an organization.
enum ProjectOrganizationPermission {
  read._('read'),
  write._('write'),
  admin._('admin'),
  none._('none');

  const ProjectOrganizationPermission._(this.value);

  /// Creates a ProjectOrganizationPermission from a json value.
  factory ProjectOrganizationPermission.fromJson(String json) {
    return ProjectOrganizationPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectOrganizationPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectOrganizationPermission? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ProjectOrganizationPermission.fromJson(json);
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
