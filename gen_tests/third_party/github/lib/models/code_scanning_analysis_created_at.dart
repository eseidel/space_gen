/// The time that the analysis was created in ISO 8601 format:
/// `YYYY-MM-DDTHH:MM:SSZ`.
extension type const CodeScanningAnalysisCreatedAt._(DateTime value) {
  const CodeScanningAnalysisCreatedAt(this.value);

  factory CodeScanningAnalysisCreatedAt.fromJson(String json) =>
      CodeScanningAnalysisCreatedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisCreatedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisCreatedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
