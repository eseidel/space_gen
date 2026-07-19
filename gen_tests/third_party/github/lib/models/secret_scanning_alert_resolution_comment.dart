/// An optional comment when closing or reopening an alert. Cannot be updated or
/// deleted.
extension type const SecretScanningAlertResolutionComment._(String value) {
  const SecretScanningAlertResolutionComment(this.value);

  factory SecretScanningAlertResolutionComment.fromJson(String json) =>
      SecretScanningAlertResolutionComment(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningAlertResolutionComment? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningAlertResolutionComment.fromJson(json);
  }

  String toJson() => value;
}
