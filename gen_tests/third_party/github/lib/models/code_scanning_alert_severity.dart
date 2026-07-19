/// Severity of a code scanning alert.
enum CodeScanningAlertSeverity {
  critical._('critical'),
  high._('high'),
  medium._('medium'),
  low._('low'),
  warning._('warning'),
  note._('note'),
  error._('error');

  const CodeScanningAlertSeverity._(this.value);

  /// Creates a CodeScanningAlertSeverity from a json value.
  factory CodeScanningAlertSeverity.fromJson(String json) {
    return CodeScanningAlertSeverity.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertSeverity value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertSeverity? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertSeverity.fromJson(json);
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
