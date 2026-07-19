enum OrgsListPendingInvitationsParameter4 {
  all._('all'),
  member._('member'),
  scim._('scim');

  const OrgsListPendingInvitationsParameter4._(this.value);

  /// Creates a OrgsListPendingInvitationsParameter4 from a json value.
  factory OrgsListPendingInvitationsParameter4.fromJson(String json) {
    return OrgsListPendingInvitationsParameter4.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListPendingInvitationsParameter4 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListPendingInvitationsParameter4? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListPendingInvitationsParameter4.fromJson(json);
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
