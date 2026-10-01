// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
