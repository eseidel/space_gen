/// Identifies the variable values associated with the environment in which this
/// analysis was performed.
extension type const CodeScanningAnalysisEnvironment._(String value) {
  const CodeScanningAnalysisEnvironment(this.value);

  factory CodeScanningAnalysisEnvironment.fromJson(String json) =>
      CodeScanningAnalysisEnvironment(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisEnvironment? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisEnvironment.fromJson(json);
  }

  String toJson() => value;
}
