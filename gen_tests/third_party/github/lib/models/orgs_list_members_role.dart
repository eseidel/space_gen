enum OrgsListMembersRole {
  all._('all'),
  admin._('admin'),
  member._('member');

  const OrgsListMembersRole._(this.value);

  /// Creates a OrgsListMembersRole from a json value.
  factory OrgsListMembersRole.fromJson(String json) {
    return OrgsListMembersRole.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown OrgsListMembersRole value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListMembersRole? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListMembersRole.fromJson(json);
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
