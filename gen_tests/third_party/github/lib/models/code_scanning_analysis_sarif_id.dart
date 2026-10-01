// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// An identifier for the upload.
/// Example: `'6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53'`
extension type const CodeScanningAnalysisSarifId._(String value) {
  const CodeScanningAnalysisSarifId(this.value);

  factory CodeScanningAnalysisSarifId.fromJson(String json) =>
      CodeScanningAnalysisSarifId(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisSarifId? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisSarifId.fromJson(json);
  }

  String toJson() => value;
}
