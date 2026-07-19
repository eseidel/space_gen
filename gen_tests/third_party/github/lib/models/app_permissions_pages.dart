/// The level of permission to grant the access token to retrieve Pages
/// statuses, configuration, and builds, as well as create new builds.
enum AppPermissionsPages {
  read._('read'),
  write._('write');

  const AppPermissionsPages._(this.value);

  /// Creates a AppPermissionsPages from a json value.
  factory AppPermissionsPages.fromJson(String json) {
    return AppPermissionsPages.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsPages value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsPages? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsPages.fromJson(json);
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
