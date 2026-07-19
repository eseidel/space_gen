/// The level of permission to grant the access token for checks on code.
enum AppPermissionsChecks {
  read._('read'),
  write._('write');

  const AppPermissionsChecks._(this.value);

  /// Creates a AppPermissionsChecks from a json value.
  factory AppPermissionsChecks.fromJson(String json) {
    return AppPermissionsChecks.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsChecks value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsChecks? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsChecks.fromJson(json);
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
