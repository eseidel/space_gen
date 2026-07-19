enum AllowedMentionTypes {
  /// Controls role mentions
  users._('users'),

  /// Controls user mentions
  roles._('roles'),

  /// Controls @everyone and @here mentions
  everyone._('everyone');

  const AllowedMentionTypes._(this.value);

  /// Creates a AllowedMentionTypes from a json value.
  factory AllowedMentionTypes.fromJson(String json) {
    return AllowedMentionTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AllowedMentionTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AllowedMentionTypes? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AllowedMentionTypes.fromJson(json);
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
