enum OrgsListMembersParameter2 {
  all._('all'),
  admin._('admin'),
  member._('member');

  const OrgsListMembersParameter2._(this.value);

  /// Creates a OrgsListMembersParameter2 from a json value.
  factory OrgsListMembersParameter2.fromJson(String json) {
    return OrgsListMembersParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListMembersParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListMembersParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListMembersParameter2.fromJson(json);
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
