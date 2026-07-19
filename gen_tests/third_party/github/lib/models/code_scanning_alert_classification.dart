/// A classification of the file. For example to identify it as generated.
enum CodeScanningAlertClassification {
  source._('source'),
  generated._('generated'),
  test._('test'),
  library_._('library');

  const CodeScanningAlertClassification._(this.value);

  /// Creates a CodeScanningAlertClassification from a json value.
  factory CodeScanningAlertClassification.fromJson(String json) {
    return CodeScanningAlertClassification.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertClassification value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertClassification? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertClassification.fromJson(json);
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
