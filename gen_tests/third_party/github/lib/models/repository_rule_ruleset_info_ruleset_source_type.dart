/// The type of source for the ruleset that includes this rule.
enum RepositoryRuleRulesetInfoRulesetSourceType {
  repository._('Repository'),
  organization._('Organization');

  const RepositoryRuleRulesetInfoRulesetSourceType._(this.value);

  /// Creates a RepositoryRuleRulesetInfoRulesetSourceType from a json value.
  factory RepositoryRuleRulesetInfoRulesetSourceType.fromJson(String json) {
    return RepositoryRuleRulesetInfoRulesetSourceType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleRulesetInfoRulesetSourceType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleRulesetInfoRulesetSourceType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRulesetInfoRulesetSourceType.fromJson(json);
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
