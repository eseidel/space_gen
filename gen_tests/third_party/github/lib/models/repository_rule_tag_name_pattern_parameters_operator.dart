// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The operator to use for matching.
enum RepositoryRuleTagNamePatternParametersOperator {
  startsWith._('starts_with'),
  endsWith._('ends_with'),
  contains._('contains'),
  regex._('regex');

  const RepositoryRuleTagNamePatternParametersOperator._(this.value);

  /// Creates a RepositoryRuleTagNamePatternParametersOperator from a json value.
  factory RepositoryRuleTagNamePatternParametersOperator.fromJson(String json) {
    return RepositoryRuleTagNamePatternParametersOperator.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleTagNamePatternParametersOperator value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleTagNamePatternParametersOperator? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleTagNamePatternParametersOperator.fromJson(json);
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
