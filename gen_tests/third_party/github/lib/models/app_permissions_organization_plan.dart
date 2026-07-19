/// The level of permission to grant the access token for viewing an
/// organization's plan.
enum AppPermissionsOrganizationPlan {
  read._('read');

  const AppPermissionsOrganizationPlan._(this.value);

  /// Creates a AppPermissionsOrganizationPlan from a json value.
  factory AppPermissionsOrganizationPlan.fromJson(String json) {
    return AppPermissionsOrganizationPlan.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationPlan value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationPlan? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationPlan.fromJson(json);
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
