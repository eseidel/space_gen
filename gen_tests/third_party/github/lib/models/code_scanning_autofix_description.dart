// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The description of an autofix.
extension type const CodeScanningAutofixDescription._(String value) {
  const CodeScanningAutofixDescription(this.value);

  factory CodeScanningAutofixDescription.fromJson(String json) =>
      CodeScanningAutofixDescription(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAutofixDescription? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAutofixDescription.fromJson(json);
  }

  String toJson() => value;
}
