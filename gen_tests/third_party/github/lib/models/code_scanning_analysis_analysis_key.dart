// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Identifies the configuration under which the analysis was executed. For
/// example, in GitHub Actions this includes the workflow filename and job name.
extension type const CodeScanningAnalysisAnalysisKey._(String value) {
  const CodeScanningAnalysisAnalysisKey(this.value);

  factory CodeScanningAnalysisAnalysisKey.fromJson(String json) =>
      CodeScanningAnalysisAnalysisKey(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisAnalysisKey? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisAnalysisKey.fromJson(json);
  }

  String toJson() => value;
}
