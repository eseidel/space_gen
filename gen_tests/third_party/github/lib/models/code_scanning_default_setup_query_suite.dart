/// CodeQL query suite to be used.
enum CodeScanningDefaultSetupQuerySuite {
  default_._('default'),
  extended._('extended');

  const CodeScanningDefaultSetupQuerySuite._(this.value);

  /// Creates a CodeScanningDefaultSetupQuerySuite from a json value.
  factory CodeScanningDefaultSetupQuerySuite.fromJson(String json) {
    return CodeScanningDefaultSetupQuerySuite.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupQuerySuite value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupQuerySuite? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupQuerySuite.fromJson(json);
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
