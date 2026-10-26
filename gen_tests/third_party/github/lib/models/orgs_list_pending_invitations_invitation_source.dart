enum OrgsListPendingInvitationsInvitationSource {
  all._('all'),
  member._('member'),
  scim._('scim');

  const OrgsListPendingInvitationsInvitationSource._(this.value);

  /// Creates a OrgsListPendingInvitationsInvitationSource from a json value.
  factory OrgsListPendingInvitationsInvitationSource.fromJson(String json) {
    return OrgsListPendingInvitationsInvitationSource.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListPendingInvitationsInvitationSource value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListPendingInvitationsInvitationSource? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListPendingInvitationsInvitationSource.fromJson(json);
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
