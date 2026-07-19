/// The level of permission to grant the access token to view and edit custom
/// properties for a repository, when allowed by the property.
enum AppPermissionsRepositoryCustomProperties {
  read._('read'),
  write._('write');

  const AppPermissionsRepositoryCustomProperties._(this.value);

  /// Creates a AppPermissionsRepositoryCustomProperties from a json value.
  factory AppPermissionsRepositoryCustomProperties.fromJson(String json) {
    return AppPermissionsRepositoryCustomProperties.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsRepositoryCustomProperties value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsRepositoryCustomProperties? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsRepositoryCustomProperties.fromJson(json);
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
