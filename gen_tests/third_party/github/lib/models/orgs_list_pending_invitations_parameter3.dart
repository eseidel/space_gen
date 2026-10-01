// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum OrgsListPendingInvitationsParameter3 {
  all._('all'),
  admin._('admin'),
  directMember._('direct_member'),
  billingManager._('billing_manager'),
  hiringManager._('hiring_manager');

  const OrgsListPendingInvitationsParameter3._(this.value);

  /// Creates a OrgsListPendingInvitationsParameter3 from a json value.
  factory OrgsListPendingInvitationsParameter3.fromJson(String json) {
    return OrgsListPendingInvitationsParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListPendingInvitationsParameter3 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListPendingInvitationsParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListPendingInvitationsParameter3.fromJson(json);
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
