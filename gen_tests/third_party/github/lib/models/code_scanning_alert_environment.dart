/// Identifies the variable values associated with the environment in which the
/// analysis that generated this alert instance was performed, such as the
/// language that was analyzed.
extension type const CodeScanningAlertEnvironment._(String value) {
  const CodeScanningAlertEnvironment(this.value);

  factory CodeScanningAlertEnvironment.fromJson(String json) =>
      CodeScanningAlertEnvironment(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertEnvironment? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertEnvironment.fromJson(json);
  }

  String toJson() => value;
}
