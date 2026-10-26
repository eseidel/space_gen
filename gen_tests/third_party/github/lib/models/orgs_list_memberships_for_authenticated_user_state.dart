enum OrgsListMembershipsForAuthenticatedUserState {
  active._('active'),
  pending._('pending');

  const OrgsListMembershipsForAuthenticatedUserState._(this.value);

  /// Creates a OrgsListMembershipsForAuthenticatedUserState from a json value.
  factory OrgsListMembershipsForAuthenticatedUserState.fromJson(String json) {
    return OrgsListMembershipsForAuthenticatedUserState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListMembershipsForAuthenticatedUserState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListMembershipsForAuthenticatedUserState? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListMembershipsForAuthenticatedUserState.fromJson(json);
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
