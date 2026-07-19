/// The level of permission to grant the access token to manage repository
/// secrets.
enum AppPermissionsSecrets {
  read._('read'),
  write._('write');

  const AppPermissionsSecrets._(this.value);

  /// Creates a AppPermissionsSecrets from a json value.
  factory AppPermissionsSecrets.fromJson(String json) {
    return AppPermissionsSecrets.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsSecrets value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsSecrets? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsSecrets.fromJson(json);
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
