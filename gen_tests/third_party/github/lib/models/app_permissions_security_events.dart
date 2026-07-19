/// The level of permission to grant the access token to view and manage
/// security events like code scanning alerts.
enum AppPermissionsSecurityEvents {
  read._('read'),
  write._('write');

  const AppPermissionsSecurityEvents._(this.value);

  /// Creates a AppPermissionsSecurityEvents from a json value.
  factory AppPermissionsSecurityEvents.fromJson(String json) {
    return AppPermissionsSecurityEvents.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsSecurityEvents value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsSecurityEvents? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsSecurityEvents.fromJson(json);
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
