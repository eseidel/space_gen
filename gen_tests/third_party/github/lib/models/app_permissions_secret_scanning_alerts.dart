/// The level of permission to grant the access token to view and manage secret
/// scanning alerts.
enum AppPermissionsSecretScanningAlerts {
  read._('read'),
  write._('write');

  const AppPermissionsSecretScanningAlerts._(this.value);

  /// Creates a AppPermissionsSecretScanningAlerts from a json value.
  factory AppPermissionsSecretScanningAlerts.fromJson(String json) {
    return AppPermissionsSecretScanningAlerts.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsSecretScanningAlerts value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsSecretScanningAlerts? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsSecretScanningAlerts.fromJson(json);
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
