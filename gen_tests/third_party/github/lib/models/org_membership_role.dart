/// The user's membership type in the organization.
/// Example: `'admin'`
enum OrgMembershipRole {
  admin._('admin'),
  member._('member'),
  billingManager._('billing_manager');

  const OrgMembershipRole._(this.value);

  /// Creates a OrgMembershipRole from a json value.
  factory OrgMembershipRole.fromJson(String json) {
    return OrgMembershipRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown OrgMembershipRole value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgMembershipRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgMembershipRole.fromJson(json);
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
