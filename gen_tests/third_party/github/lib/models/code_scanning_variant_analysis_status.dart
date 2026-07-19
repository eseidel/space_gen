/// The new status of the CodeQL variant analysis repository task.
enum CodeScanningVariantAnalysisStatus {
  pending._('pending'),
  inProgress._('in_progress'),
  succeeded._('succeeded'),
  failed._('failed'),
  canceled._('canceled'),
  timedOut._('timed_out');

  const CodeScanningVariantAnalysisStatus._(this.value);

  /// Creates a CodeScanningVariantAnalysisStatus from a json value.
  factory CodeScanningVariantAnalysisStatus.fromJson(String json) {
    return CodeScanningVariantAnalysisStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningVariantAnalysisStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisStatus.fromJson(json);
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
