/// The REST API URL of the analysis resource.
extension type const CodeScanningAnalysisUrl._(Uri value) {
  const CodeScanningAnalysisUrl(this.value);

  factory CodeScanningAnalysisUrl.fromJson(String json) =>
      CodeScanningAnalysisUrl(Uri.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisUrl.fromJson(json);
  }

  String toJson() => value.toString();
}
