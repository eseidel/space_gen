/// The level of permission to grant the access token for GitHub Actions
/// workflows, workflow runs, and artifacts.
enum AppPermissionsActions {
  read._('read'),
  write._('write');

  const AppPermissionsActions._(this.value);

  /// Creates a AppPermissionsActions from a json value.
  factory AppPermissionsActions.fromJson(String json) {
    return AppPermissionsActions.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsActions value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsActions? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsActions.fromJson(json);
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
