/// The time that the alert was last updated in ISO 8601 format:
/// `YYYY-MM-DDTHH:MM:SSZ`.
extension type const AlertUpdatedAt._(DateTime value) {
  const AlertUpdatedAt(this.value);

  factory AlertUpdatedAt.fromJson(String json) =>
      AlertUpdatedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertUpdatedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertUpdatedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
