/// The GUID of the tool used to generate the code scanning analysis, if
/// provided in the uploaded SARIF data.
extension type const CodeScanningAnalysisToolGuid._(String value) {
  const CodeScanningAnalysisToolGuid(this.value);

  factory CodeScanningAnalysisToolGuid.fromJson(String json) =>
      CodeScanningAnalysisToolGuid(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisToolGuid? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisToolGuid.fromJson(json);
  }

  String toJson() => value;
}
