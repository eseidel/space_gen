/// The name of the tool used to generate the code scanning analysis.
extension type const CodeScanningAnalysisToolName._(String value) {
  const CodeScanningAnalysisToolName(this.value);

  factory CodeScanningAnalysisToolName.fromJson(String json) =>
      CodeScanningAnalysisToolName(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisToolName? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisToolName.fromJson(json);
  }

  String toJson() => value;
}
