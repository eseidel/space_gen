/// The level of permission to grant the access token to manage Dependabot
/// secrets.
enum AppPermissionsDependabotSecrets {
  read._('read'),
  write._('write');

  const AppPermissionsDependabotSecrets._(this.value);

  /// Creates a AppPermissionsDependabotSecrets from a json value.
  factory AppPermissionsDependabotSecrets.fromJson(String json) {
    return AppPermissionsDependabotSecrets.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsDependabotSecrets value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsDependabotSecrets? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsDependabotSecrets.fromJson(json);
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
