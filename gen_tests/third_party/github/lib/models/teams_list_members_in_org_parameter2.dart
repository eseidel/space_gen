enum TeamsListMembersInOrgParameter2 {
  member._('member'),
  maintainer._('maintainer'),
  all._('all');

  const TeamsListMembersInOrgParameter2._(this.value);

  /// Creates a TeamsListMembersInOrgParameter2 from a json value.
  factory TeamsListMembersInOrgParameter2.fromJson(String json) {
    return TeamsListMembersInOrgParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsListMembersInOrgParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsListMembersInOrgParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsListMembersInOrgParameter2.fromJson(json);
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
