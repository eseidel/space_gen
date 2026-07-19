enum RepositoryRuleCommitterEmailPatternType {
  committerEmailPattern._('committer_email_pattern');

  const RepositoryRuleCommitterEmailPatternType._(this.value);

  /// Creates a RepositoryRuleCommitterEmailPatternType from a json value.
  factory RepositoryRuleCommitterEmailPatternType.fromJson(String json) {
    return RepositoryRuleCommitterEmailPatternType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleCommitterEmailPatternType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleCommitterEmailPatternType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCommitterEmailPatternType.fromJson(json);
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
