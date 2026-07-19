/// The severity of the alert.
enum CodeScanningAlertRuleSeverity {
  none._('none'),
  note._('note'),
  warning._('warning'),
  error._('error');

  const CodeScanningAlertRuleSeverity._(this.value);

  /// Creates a CodeScanningAlertRuleSeverity from a json value.
  factory CodeScanningAlertRuleSeverity.fromJson(String json) {
    return CodeScanningAlertRuleSeverity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertRuleSeverity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertRuleSeverity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertRuleSeverity.fromJson(json);
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
