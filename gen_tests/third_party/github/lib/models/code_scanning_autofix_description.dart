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
