enum TeamMemberRoles {
  /// Admins have similar access as owners, except they cannot take
  /// destructive actions on the team or team-owned apps.
  admin._('admin'),

  /// Developers can access information about team-owned apps, like the client
  /// secret or public key. They can also take limited actions on team-owned
  /// apps, like configuring interaction endpoints or resetting the bot token.
  /// Members with the Developer role cannot manage the team or its members,
  /// or take destructive actions on team-owned apps.
  developer._('developer'),

  /// Read-only members can access information about a team and any team-owned
  /// apps. Some examples include getting the IDs of applications and
  /// exporting payout records. Members can also invite bots associated with
  /// team-owned apps that are marked private.
  readOnly._('read_only');

  const TeamMemberRoles._(this.value);

  /// Creates a TeamMemberRoles from a json value.
  factory TeamMemberRoles.fromJson(String json) {
    return TeamMemberRoles.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TeamMemberRoles value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamMemberRoles? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamMemberRoles.fromJson(json);
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
