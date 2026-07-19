/// The level of permission to grant the access token to manage the email
/// addresses belonging to a user.
enum AppPermissionsEmailAddresses {
  read._('read'),
  write._('write');

  const AppPermissionsEmailAddresses._(this.value);

  /// Creates a AppPermissionsEmailAddresses from a json value.
  factory AppPermissionsEmailAddresses.fromJson(String json) {
    return AppPermissionsEmailAddresses.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsEmailAddresses value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsEmailAddresses? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsEmailAddresses.fromJson(json);
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
