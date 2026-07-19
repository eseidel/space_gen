enum CodeScanningListAlertsForRepoParameter11 {
  created._('created'),
  updated._('updated');

  const CodeScanningListAlertsForRepoParameter11._(this.value);

  /// Creates a CodeScanningListAlertsForRepoParameter11 from a json value.
  factory CodeScanningListAlertsForRepoParameter11.fromJson(String json) {
    return CodeScanningListAlertsForRepoParameter11.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningListAlertsForRepoParameter11 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningListAlertsForRepoParameter11? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningListAlertsForRepoParameter11.fromJson(json);
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
