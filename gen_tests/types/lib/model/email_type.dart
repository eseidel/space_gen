// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
extension type const EmailType._(String value) {
  const EmailType(this.value);

  factory EmailType.fromJson(String json) => EmailType(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EmailType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return EmailType.fromJson(json);
  }

  String toJson() => value;
}
