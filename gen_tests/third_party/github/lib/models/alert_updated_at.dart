// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
