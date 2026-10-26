enum OrgsListMembersFilter {
  n2faDisabled._('2fa_disabled'),
  n2faInsecure._('2fa_insecure'),
  all._('all');

  const OrgsListMembersFilter._(this.value);

  /// Creates a OrgsListMembersFilter from a json value.
  factory OrgsListMembersFilter.fromJson(String json) {
    return OrgsListMembersFilter.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown OrgsListMembersFilter value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListMembersFilter? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListMembersFilter.fromJson(json);
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
