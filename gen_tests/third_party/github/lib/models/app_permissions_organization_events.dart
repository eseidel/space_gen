/// The level of permission to grant the access token to view events triggered
/// by an activity in an organization.
enum AppPermissionsOrganizationEvents {
  read._('read');

  const AppPermissionsOrganizationEvents._(this.value);

  /// Creates a AppPermissionsOrganizationEvents from a json value.
  factory AppPermissionsOrganizationEvents.fromJson(String json) {
    return AppPermissionsOrganizationEvents.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationEvents value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationEvents? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationEvents.fromJson(json);
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
