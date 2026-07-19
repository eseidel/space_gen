// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The severity level at which code scanning results that raise alerts block a
/// reference update. For more information on alert severity levels, see "[About
/// code scanning
/// alerts](https://docs.github.com/code-security/code-scanning/managing-code-scanning-alerts/about-code-scanning-alerts#about-alert-severity-and-security-severity-levels)."
enum RepositoryRuleParamsCodeScanningToolAlertsThreshold {
  none._('none'),
  errors._('errors'),
  errorsAndWarnings._('errors_and_warnings'),
  all._('all');

  const RepositoryRuleParamsCodeScanningToolAlertsThreshold._(this.value);

  /// Creates a RepositoryRuleParamsCodeScanningToolAlertsThreshold from a json value.
  factory RepositoryRuleParamsCodeScanningToolAlertsThreshold.fromJson(
    String json,
  ) {
    return RepositoryRuleParamsCodeScanningToolAlertsThreshold.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown RepositoryRuleParamsCodeScanningToolAlertsThreshold value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleParamsCodeScanningToolAlertsThreshold? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleParamsCodeScanningToolAlertsThreshold.fromJson(json);
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
