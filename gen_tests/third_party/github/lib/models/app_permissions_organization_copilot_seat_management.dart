// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The level of permission to grant the access token for managing access to
/// GitHub Copilot for members of an organization with a Copilot Business
/// subscription. This property is in public preview and is subject to change.
enum AppPermissionsOrganizationCopilotSeatManagement {
  write._('write');

  const AppPermissionsOrganizationCopilotSeatManagement._(this.value);

  /// Creates a AppPermissionsOrganizationCopilotSeatManagement from a json value.
  factory AppPermissionsOrganizationCopilotSeatManagement.fromJson(
    String json,
  ) {
    return AppPermissionsOrganizationCopilotSeatManagement.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AppPermissionsOrganizationCopilotSeatManagement value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AppPermissionsOrganizationCopilotSeatManagement? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppPermissionsOrganizationCopilotSeatManagement.fromJson(json);
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
