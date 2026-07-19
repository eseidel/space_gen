enum RepositoryRuleTagNamePatternType {
  tagNamePattern._('tag_name_pattern');

  const RepositoryRuleTagNamePatternType._(this.value);

  /// Creates a RepositoryRuleTagNamePatternType from a json value.
  factory RepositoryRuleTagNamePatternType.fromJson(String json) {
    return RepositoryRuleTagNamePatternType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleTagNamePatternType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleTagNamePatternType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleTagNamePatternType.fromJson(json);
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
