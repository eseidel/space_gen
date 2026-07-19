// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The severity level at which code scanning results that raise security alerts
/// block a reference update. For more information on security severity levels,
/// see "[About code scanning
/// alerts](https://docs.github.com/code-security/code-scanning/managing-code-scanning-alerts/about-code-scanning-alerts#about-alert-severity-and-security-severity-levels)."
enum RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold {
  none._('none'),
  critical._('critical'),
  highOrHigher._('high_or_higher'),
  mediumOrHigher._('medium_or_higher'),
  all._('all');

  const RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold._(
    this.value,
  );

  /// Creates a RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold from a json value.
  factory RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold.fromJson(
    String json,
  ) {
    return RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold.fromJson(
      json,
    );
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
