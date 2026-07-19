/// The version of the tool used to generate the code scanning analysis.
extension type const CodeScanningAnalysisToolVersion._(String value) {
  const CodeScanningAnalysisToolVersion(this.value);

  factory CodeScanningAnalysisToolVersion.fromJson(String json) =>
      CodeScanningAnalysisToolVersion(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisToolVersion? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisToolVersion.fromJson(json);
  }

  String toJson() => value;
}
