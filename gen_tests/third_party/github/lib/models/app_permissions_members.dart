/// The level of permission to grant the access token for organization teams and
/// members.
enum AppPermissionsMembers {
  read._('read'),
  write._('write');

  const AppPermissionsMembers._(this.value);

  /// Creates a AppPermissionsMembers from a json value.
  factory AppPermissionsMembers.fromJson(String json) {
    return AppPermissionsMembers.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsMembers value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsMembers? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsMembers.fromJson(json);
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
