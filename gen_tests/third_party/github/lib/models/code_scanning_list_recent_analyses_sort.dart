enum CodeScanningListRecentAnalysesSort {
  created._('created');

  const CodeScanningListRecentAnalysesSort._(this.value);

  /// Creates a CodeScanningListRecentAnalysesSort from a json value.
  factory CodeScanningListRecentAnalysesSort.fromJson(String json) {
    return CodeScanningListRecentAnalysesSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningListRecentAnalysesSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningListRecentAnalysesSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningListRecentAnalysesSort.fromJson(json);
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
