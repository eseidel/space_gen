/// The level of permission to grant the access token to manage just a single
/// file.
enum AppPermissionsSingleFile {
  read._('read'),
  write._('write');

  const AppPermissionsSingleFile._(this.value);

  /// Creates a AppPermissionsSingleFile from a json value.
  factory AppPermissionsSingleFile.fromJson(String json) {
    return AppPermissionsSingleFile.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsSingleFile value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsSingleFile? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsSingleFile.fromJson(json);
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
