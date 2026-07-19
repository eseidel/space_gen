// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// A Base64 string representing the SARIF file to upload. You must first
/// compress your SARIF file using
/// [`gzip`](http://www.gnu.org/software/gzip/manual/gzip.html) and then
/// translate the contents of the file into a Base64 encoding string. For more
/// information, see "[SARIF support for code
/// scanning](https://docs.github.com/code-security/secure-coding/sarif-support-for-code-scanning)."
extension type const CodeScanningAnalysisSarifFile._(String value) {
  const CodeScanningAnalysisSarifFile(this.value);

  factory CodeScanningAnalysisSarifFile.fromJson(String json) =>
      CodeScanningAnalysisSarifFile(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAnalysisSarifFile? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAnalysisSarifFile.fromJson(json);
  }

  String toJson() => value;
}
