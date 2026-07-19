/// The level of permission to grant the access token to manage organization
/// projects and projects public preview (where available).
enum AppPermissionsOrganizationProjects {
  read._('read'),
  write._('write'),
  admin._('admin');

  const AppPermissionsOrganizationProjects._(this.value);

  /// Creates a AppPermissionsOrganizationProjects from a json value.
  factory AppPermissionsOrganizationProjects.fromJson(String json) {
    return AppPermissionsOrganizationProjects.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationProjects value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationProjects? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationProjects.fromJson(json);
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
