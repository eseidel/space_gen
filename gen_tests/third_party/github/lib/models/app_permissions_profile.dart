/// The level of permission to grant the access token to manage the profile
/// settings belonging to a user.
enum AppPermissionsProfile {
  write._('write');

  const AppPermissionsProfile._(this.value);

  /// Creates a AppPermissionsProfile from a json value.
  factory AppPermissionsProfile.fromJson(String json) {
    return AppPermissionsProfile.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsProfile value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsProfile? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsProfile.fromJson(json);
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
