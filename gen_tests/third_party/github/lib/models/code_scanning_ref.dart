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
