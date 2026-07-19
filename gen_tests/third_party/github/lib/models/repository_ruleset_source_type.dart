/// The type of the source of the ruleset
enum RepositoryRulesetSourceType {
  repository._('Repository'),
  organization._('Organization'),
  enterprise._('Enterprise');

  const RepositoryRulesetSourceType._(this.value);

  /// Creates a RepositoryRulesetSourceType from a json value.
  factory RepositoryRulesetSourceType.fromJson(String json) {
    return RepositoryRulesetSourceType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRulesetSourceType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRulesetSourceType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetSourceType.fromJson(json);
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
