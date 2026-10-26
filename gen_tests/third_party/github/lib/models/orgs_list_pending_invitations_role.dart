enum OrgsListPendingInvitationsRole {
  all._('all'),
  admin._('admin'),
  directMember._('direct_member'),
  billingManager._('billing_manager'),
  hiringManager._('hiring_manager');

  const OrgsListPendingInvitationsRole._(this.value);

  /// Creates a OrgsListPendingInvitationsRole from a json value.
  factory OrgsListPendingInvitationsRole.fromJson(String json) {
    return OrgsListPendingInvitationsRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListPendingInvitationsRole value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListPendingInvitationsRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListPendingInvitationsRole.fromJson(json);
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
