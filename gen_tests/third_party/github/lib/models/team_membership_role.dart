// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The role of the user in the team.
/// Example: `'member'`
enum TeamMembershipRole {
  member._('member'),
  maintainer._('maintainer');

  const TeamMembershipRole._(this.value);

  /// Creates a TeamMembershipRole from a json value.
  factory TeamMembershipRole.fromJson(String json) {
    return TeamMembershipRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TeamMembershipRole value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamMembershipRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamMembershipRole.fromJson(json);
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
