/// The level of permission to grant the access token for custom property
/// management.
enum AppPermissionsOrganizationCustomProperties {
  read._('read'),
  write._('write'),
  admin._('admin');

  const AppPermissionsOrganizationCustomProperties._(this.value);

  /// Creates a AppPermissionsOrganizationCustomProperties from a json value.
  factory AppPermissionsOrganizationCustomProperties.fromJson(String json) {
    return AppPermissionsOrganizationCustomProperties.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationCustomProperties value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationCustomProperties? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationCustomProperties.fromJson(json);
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
