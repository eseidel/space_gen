// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The level of permission to grant the access token for viewing and managing
/// fine-grained personal access tokens that have been approved by an
/// organization.
enum AppPermissionsOrganizationPersonalAccessTokenRequests {
  read._('read'),
  write._('write');

  const AppPermissionsOrganizationPersonalAccessTokenRequests._(this.value);

  /// Creates a AppPermissionsOrganizationPersonalAccessTokenRequests from a json value.
  factory AppPermissionsOrganizationPersonalAccessTokenRequests.fromJson(
    String json,
  ) {
    return AppPermissionsOrganizationPersonalAccessTokenRequests.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationPersonalAccessTokenRequests value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationPersonalAccessTokenRequests? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationPersonalAccessTokenRequests.fromJson(json);
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
