/// The role to give the user in the organization. Can be one of:
///  * `admin` - The user will become an owner of the organization.
///  * `member` - The user will become a non-owner member of the organization.
enum OrgsSetMembershipForUserRequestRole {
  admin._('admin'),
  member._('member');

  const OrgsSetMembershipForUserRequestRole._(this.value);

  /// Creates a OrgsSetMembershipForUserRequestRole from a json value.
  factory OrgsSetMembershipForUserRequestRole.fromJson(String json) {
    return OrgsSetMembershipForUserRequestRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsSetMembershipForUserRequestRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsSetMembershipForUserRequestRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsSetMembershipForUserRequestRole.fromJson(json);
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
