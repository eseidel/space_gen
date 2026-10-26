enum TeamsListMembersLegacyRole {
  member._('member'),
  maintainer._('maintainer'),
  all._('all');

  const TeamsListMembersLegacyRole._(this.value);

  /// Creates a TeamsListMembersLegacyRole from a json value.
  factory TeamsListMembersLegacyRole.fromJson(String json) {
    return TeamsListMembersLegacyRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsListMembersLegacyRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsListMembersLegacyRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsListMembersLegacyRole.fromJson(json);
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
