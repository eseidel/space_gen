enum CodeScanningListAlertsForOrgParameter9 {
  created._('created'),
  updated._('updated');

  const CodeScanningListAlertsForOrgParameter9._(this.value);

  /// Creates a CodeScanningListAlertsForOrgParameter9 from a json value.
  factory CodeScanningListAlertsForOrgParameter9.fromJson(String json) {
    return CodeScanningListAlertsForOrgParameter9.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningListAlertsForOrgParameter9 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningListAlertsForOrgParameter9? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningListAlertsForOrgParameter9.fromJson(json);
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
