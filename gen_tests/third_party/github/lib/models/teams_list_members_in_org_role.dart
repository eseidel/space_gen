enum TeamsListMembersInOrgRole {
  member._('member'),
  maintainer._('maintainer'),
  all._('all');

  const TeamsListMembersInOrgRole._(this.value);

  /// Creates a TeamsListMembersInOrgRole from a json value.
  factory TeamsListMembersInOrgRole.fromJson(String json) {
    return TeamsListMembersInOrgRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsListMembersInOrgRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsListMembersInOrgRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsListMembersInOrgRole.fromJson(json);
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
