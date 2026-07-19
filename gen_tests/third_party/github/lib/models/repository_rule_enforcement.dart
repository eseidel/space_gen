/// The enforcement level of the ruleset. `evaluate` allows admins to test rules
/// before enforcing them. Admins can view insights on the Rule Insights page
/// (`evaluate` is only available with GitHub Enterprise).
enum RepositoryRuleEnforcement {
  disabled._('disabled'),
  active._('active'),
  evaluate._('evaluate');

  const RepositoryRuleEnforcement._(this.value);

  /// Creates a RepositoryRuleEnforcement from a json value.
  factory RepositoryRuleEnforcement.fromJson(String json) {
    return RepositoryRuleEnforcement.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleEnforcement value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleEnforcement? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleEnforcement.fromJson(json);
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
