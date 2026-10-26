enum CodeScanningListAlertsForRepoSort {
  created._('created'),
  updated._('updated');

  const CodeScanningListAlertsForRepoSort._(this.value);

  /// Creates a CodeScanningListAlertsForRepoSort from a json value.
  factory CodeScanningListAlertsForRepoSort.fromJson(String json) {
    return CodeScanningListAlertsForRepoSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningListAlertsForRepoSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningListAlertsForRepoSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningListAlertsForRepoSort.fromJson(json);
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
