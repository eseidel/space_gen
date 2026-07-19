/// The target of the ruleset
enum RepositoryRulesetTarget {
  branch._('branch'),
  tag._('tag'),
  push._('push'),
  repository._('repository');

  const RepositoryRulesetTarget._(this.value);

  /// Creates a RepositoryRulesetTarget from a json value.
  factory RepositoryRulesetTarget.fromJson(String json) {
    return RepositoryRulesetTarget.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown RepositoryRulesetTarget value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRulesetTarget? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetTarget.fromJson(json);
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
