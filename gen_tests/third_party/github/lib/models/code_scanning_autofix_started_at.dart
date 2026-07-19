/// The start time of an autofix in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
extension type const CodeScanningAutofixStartedAt._(DateTime value) {
  const CodeScanningAutofixStartedAt(this.value);

  factory CodeScanningAutofixStartedAt.fromJson(String json) =>
      CodeScanningAutofixStartedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAutofixStartedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAutofixStartedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
