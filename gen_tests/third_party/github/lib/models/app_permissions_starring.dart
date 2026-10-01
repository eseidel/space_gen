// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The level of permission to grant the access token to list and manage
/// repositories a user is starring.
enum AppPermissionsStarring {
  read._('read'),
  write._('write');

  const AppPermissionsStarring._(this.value);

  /// Creates a AppPermissionsStarring from a json value.
  factory AppPermissionsStarring.fromJson(String json) {
    return AppPermissionsStarring.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsStarring value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsStarring? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsStarring.fromJson(json);
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
