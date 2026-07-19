/// The result of the rule evaluations for rules with the `active` and
/// `evaluate` enforcement statuses, demonstrating whether rules would pass or
/// fail if all rules in the rule suite were `active`. Null if no rules with
/// `evaluate` enforcement status were run.
enum RuleSuiteEvaluationResult {
  pass._('pass'),
  fail._('fail'),
  bypass._('bypass');

  const RuleSuiteEvaluationResult._(this.value);

  /// Creates a RuleSuiteEvaluationResult from a json value.
  factory RuleSuiteEvaluationResult.fromJson(String json) {
    return RuleSuiteEvaluationResult.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RuleSuiteEvaluationResult value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RuleSuiteEvaluationResult? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RuleSuiteEvaluationResult.fromJson(json);
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
