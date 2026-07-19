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
