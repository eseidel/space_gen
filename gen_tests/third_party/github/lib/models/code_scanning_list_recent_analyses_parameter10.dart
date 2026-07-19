enum CodeScanningListRecentAnalysesParameter10 {
  created._('created');

  const CodeScanningListRecentAnalysesParameter10._(this.value);

  /// Creates a CodeScanningListRecentAnalysesParameter10 from a json value.
  factory CodeScanningListRecentAnalysesParameter10.fromJson(String json) {
    return CodeScanningListRecentAnalysesParameter10.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningListRecentAnalysesParameter10 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningListRecentAnalysesParameter10? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningListRecentAnalysesParameter10.fromJson(json);
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
