/// The level of permission to grant the access token for custom organization
/// roles management.
enum AppPermissionsOrganizationCustomOrgRoles {
  read._('read'),
  write._('write');

  const AppPermissionsOrganizationCustomOrgRoles._(this.value);

  /// Creates a AppPermissionsOrganizationCustomOrgRoles from a json value.
  factory AppPermissionsOrganizationCustomOrgRoles.fromJson(String json) {
    return AppPermissionsOrganizationCustomOrgRoles.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationCustomOrgRoles value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationCustomOrgRoles? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationCustomOrgRoles.fromJson(json);
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
