// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The role that this user should have in the team.
enum TeamsAddOrUpdateMembershipForUserInOrgRequestRole {
  member._('member'),
  maintainer._('maintainer');

  const TeamsAddOrUpdateMembershipForUserInOrgRequestRole._(this.value);

  /// Creates a TeamsAddOrUpdateMembershipForUserInOrgRequestRole from a json value.
  factory TeamsAddOrUpdateMembershipForUserInOrgRequestRole.fromJson(
    String json,
  ) {
    return TeamsAddOrUpdateMembershipForUserInOrgRequestRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsAddOrUpdateMembershipForUserInOrgRequestRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsAddOrUpdateMembershipForUserInOrgRequestRole? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return TeamsAddOrUpdateMembershipForUserInOrgRequestRole.fromJson(json);
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
