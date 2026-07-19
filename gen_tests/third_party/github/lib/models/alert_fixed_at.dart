/// The time that the alert was no longer detected and was considered fixed in
/// ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
extension type const AlertFixedAt._(DateTime value) {
  const AlertFixedAt(this.value);

  factory AlertFixedAt.fromJson(String json) =>
      AlertFixedAt(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertFixedAt? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertFixedAt.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
