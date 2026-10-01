// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The result of the rule evaluations for rules with the `active` enforcement
/// status.
enum RuleSuiteResult {
  pass._('pass'),
  fail._('fail'),
  bypass._('bypass');

  const RuleSuiteResult._(this.value);

  /// Creates a RuleSuiteResult from a json value.
  factory RuleSuiteResult.fromJson(String json) {
    return RuleSuiteResult.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown RuleSuiteResult value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RuleSuiteResult? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RuleSuiteResult.fromJson(json);
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
