/// The time that the alert was created in ISO 8601 format:
/// `YYYY-MM-DDTHH:MM:SSZ`.
extension type const AlertCreatedAt._(DateTime value) {
  const AlertCreatedAt(this.value);

  factory AlertCreatedAt.fromJson(String json) =>
      AlertCreatedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertCreatedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertCreatedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
