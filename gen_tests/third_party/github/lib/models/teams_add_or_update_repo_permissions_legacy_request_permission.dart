// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The permission to grant the team on this repository. If no permission is
/// specified, the team's `permission` attribute will be used to determine what
/// permission to grant the team on this repository.
enum TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission {
  pull._('pull'),
  push._('push'),
  admin._('admin');

  const TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission._(this.value);

  /// Creates a TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission from a json value.
  factory TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission.fromJson(
    String json,
  ) {
    return TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateRepoPermissionsLegacyRequestPermission.fromJson(
      json,
    );
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
