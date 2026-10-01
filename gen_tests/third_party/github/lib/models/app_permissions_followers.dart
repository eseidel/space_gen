// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The level of permission to grant the access token to manage the followers
/// belonging to a user.
enum AppPermissionsFollowers {
  read._('read'),
  write._('write');

  const AppPermissionsFollowers._(this.value);

  /// Creates a AppPermissionsFollowers from a json value.
  factory AppPermissionsFollowers.fromJson(String json) {
    return AppPermissionsFollowers.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AppPermissionsFollowers value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsFollowers? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AppPermissionsFollowers.fromJson(json);
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
