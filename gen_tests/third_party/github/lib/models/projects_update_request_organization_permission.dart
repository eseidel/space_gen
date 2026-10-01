// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The baseline permission that all organization members have on this project
enum ProjectsUpdateRequestOrganizationPermission {
  read._('read'),
  write._('write'),
  admin._('admin'),
  none._('none');

  const ProjectsUpdateRequestOrganizationPermission._(this.value);

  /// Creates a ProjectsUpdateRequestOrganizationPermission from a json value.
  factory ProjectsUpdateRequestOrganizationPermission.fromJson(String json) {
    return ProjectsUpdateRequestOrganizationPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ProjectsUpdateRequestOrganizationPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ProjectsUpdateRequestOrganizationPermission? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsUpdateRequestOrganizationPermission.fromJson(json);
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
