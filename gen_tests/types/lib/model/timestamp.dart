// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
extension type const Timestamp._(DateTime value) {
  const Timestamp(this.value);

  factory Timestamp.fromJson(String json) => Timestamp(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Timestamp? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return Timestamp.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
