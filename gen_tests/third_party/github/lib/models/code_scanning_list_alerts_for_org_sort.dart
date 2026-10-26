enum CodeScanningListAlertsForOrgSort {
  created._('created'),
  updated._('updated');

  const CodeScanningListAlertsForOrgSort._(this.value);

  /// Creates a CodeScanningListAlertsForOrgSort from a json value.
  factory CodeScanningListAlertsForOrgSort.fromJson(String json) {
    return CodeScanningListAlertsForOrgSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningListAlertsForOrgSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningListAlertsForOrgSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningListAlertsForOrgSort.fromJson(json);
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
