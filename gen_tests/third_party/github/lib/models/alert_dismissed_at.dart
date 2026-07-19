/// The time that the alert was dismissed in ISO 8601 format:
/// `YYYY-MM-DDTHH:MM:SSZ`.
extension type const AlertDismissedAt._(DateTime value) {
  const AlertDismissedAt(this.value);

  factory AlertDismissedAt.fromJson(String json) =>
      AlertDismissedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertDismissedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertDismissedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
