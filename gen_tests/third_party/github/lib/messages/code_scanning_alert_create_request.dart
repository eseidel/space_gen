// `avoid_positional_boolean_parameters` is correct for user-facing
// APIs but wrong for a newtype wrapper — the type name is the
// disambiguation. Suppress file-locally.
// ignore_for_file: avoid_positional_boolean_parameters

/// If `true`, attempt to create an alert dismissal request.
extension type const CodeScanningAlertCreateRequest._(bool value) {
  const CodeScanningAlertCreateRequest(this.value);

  factory CodeScanningAlertCreateRequest.fromJson(bool json) =>
      CodeScanningAlertCreateRequest(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertCreateRequest? maybeFromJson(bool? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertCreateRequest.fromJson(json);
  }

  bool toJson() => value;
}
