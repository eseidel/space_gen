enum CodeScanningVariantAnalysisStatus1 {
  inProgress._('in_progress'),
  succeeded._('succeeded'),
  failed._('failed'),
  cancelled._('cancelled');

  const CodeScanningVariantAnalysisStatus1._(this.value);

  /// Creates a CodeScanningVariantAnalysisStatus1 from a json value.
  factory CodeScanningVariantAnalysisStatus1.fromJson(String json) {
    return CodeScanningVariantAnalysisStatus1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningVariantAnalysisStatus1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisStatus1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisStatus1.fromJson(json);
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
