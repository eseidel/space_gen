// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
