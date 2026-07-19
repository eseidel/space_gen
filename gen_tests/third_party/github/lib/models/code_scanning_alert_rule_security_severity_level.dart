/// The security severity of the alert.
enum CodeScanningAlertRuleSecuritySeverityLevel {
  low._('low'),
  medium._('medium'),
  high._('high'),
  critical._('critical');

  const CodeScanningAlertRuleSecuritySeverityLevel._(this.value);

  /// Creates a CodeScanningAlertRuleSecuritySeverityLevel from a json value.
  factory CodeScanningAlertRuleSecuritySeverityLevel.fromJson(String json) {
    return CodeScanningAlertRuleSecuritySeverityLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertRuleSecuritySeverityLevel value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertRuleSecuritySeverityLevel? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertRuleSecuritySeverityLevel.fromJson(json);
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
