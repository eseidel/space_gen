// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
