// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
