// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The Git reference, formatted as `refs/pull/<number>/merge`,
/// `refs/pull/<number>/head`,
/// `refs/heads/<branch name>` or simply `<branch name>`.
extension type const CodeScanningRef._(String value) {
  const CodeScanningRef(this.value);

  factory CodeScanningRef.fromJson(String json) => CodeScanningRef(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningRef? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningRef.fromJson(json);
  }

  String toJson() => value;
}
