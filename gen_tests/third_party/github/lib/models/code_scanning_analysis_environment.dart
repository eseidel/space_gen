// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
