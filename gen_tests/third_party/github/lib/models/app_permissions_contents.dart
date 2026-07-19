/// The level of permission to grant the access token for repository contents,
/// commits, branches, downloads, releases, and merges.
enum AppPermissionsContents {
  read._('read'),
  write._('write');

  const AppPermissionsContents._(this.value);

  /// Creates a AppPermissionsContents from a json value.
  factory AppPermissionsContents.fromJson(String json) {
    return AppPermissionsContents.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsContents value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsContents? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsContents.fromJson(json);
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
