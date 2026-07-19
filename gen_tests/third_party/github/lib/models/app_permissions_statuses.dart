/// The level of permission to grant the access token for commit statuses.
enum AppPermissionsStatuses {
  read._('read'),
  write._('write');

  const AppPermissionsStatuses._(this.value);

  /// Creates a AppPermissionsStatuses from a json value.
  factory AppPermissionsStatuses.fromJson(String json) {
    return AppPermissionsStatuses.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsStatuses value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsStatuses? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsStatuses.fromJson(json);
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
