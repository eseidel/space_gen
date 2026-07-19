/// The level of permission to grant the access token to manage organization
/// secrets.
enum AppPermissionsOrganizationSecrets {
  read._('read'),
  write._('write');

  const AppPermissionsOrganizationSecrets._(this.value);

  /// Creates a AppPermissionsOrganizationSecrets from a json value.
  factory AppPermissionsOrganizationSecrets.fromJson(String json) {
    return AppPermissionsOrganizationSecrets.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationSecrets value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationSecrets? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationSecrets.fromJson(json);
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
