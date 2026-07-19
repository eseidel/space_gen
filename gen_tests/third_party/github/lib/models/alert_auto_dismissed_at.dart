/// The time that the alert was auto-dismissed in ISO 8601 format:
/// `YYYY-MM-DDTHH:MM:SSZ`.
extension type const AlertAutoDismissedAt._(DateTime value) {
  const AlertAutoDismissedAt(this.value);

  factory AlertAutoDismissedAt.fromJson(String json) =>
      AlertAutoDismissedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertAutoDismissedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertAutoDismissedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
