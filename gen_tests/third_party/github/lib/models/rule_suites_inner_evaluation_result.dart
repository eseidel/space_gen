/// The result of the rule evaluations for rules with the `active` and
/// `evaluate` enforcement statuses, demonstrating whether rules would pass or
/// fail if all rules in the rule suite were `active`.
enum RuleSuitesInnerEvaluationResult {
  pass._('pass'),
  fail._('fail'),
  bypass._('bypass');

  const RuleSuitesInnerEvaluationResult._(this.value);

  /// Creates a RuleSuitesInnerEvaluationResult from a json value.
  factory RuleSuitesInnerEvaluationResult.fromJson(String json) {
    return RuleSuitesInnerEvaluationResult.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RuleSuitesInnerEvaluationResult value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RuleSuitesInnerEvaluationResult? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RuleSuitesInnerEvaluationResult.fromJson(json);
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
