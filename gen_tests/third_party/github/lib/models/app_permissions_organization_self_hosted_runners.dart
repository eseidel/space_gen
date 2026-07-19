/// The level of permission to grant the access token to view and manage GitHub
/// Actions self-hosted runners available to an organization.
enum AppPermissionsOrganizationSelfHostedRunners {
  read._('read'),
  write._('write');

  const AppPermissionsOrganizationSelfHostedRunners._(this.value);

  /// Creates a AppPermissionsOrganizationSelfHostedRunners from a json value.
  factory AppPermissionsOrganizationSelfHostedRunners.fromJson(String json) {
    return AppPermissionsOrganizationSelfHostedRunners.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationSelfHostedRunners value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationSelfHostedRunners? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationSelfHostedRunners.fromJson(json);
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
