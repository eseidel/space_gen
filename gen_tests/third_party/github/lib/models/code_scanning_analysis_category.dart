// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Identifies the configuration under which the analysis was executed. Used to
/// distinguish between multiple analyses for the same tool and commit, but
/// performed on different languages or different parts of the code.
extension type const CodeScanningAnalysisCategory._(String value) {
  const CodeScanningAnalysisCategory(this.value);

  factory CodeScanningAnalysisCategory.fromJson(String json) =>
      CodeScanningAnalysisCategory(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisCategory? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisCategory.fromJson(json);
  }

  String toJson() => value;
}
