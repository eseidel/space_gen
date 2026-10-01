// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The REST API URL of the alert resource.
extension type const AlertUrl._(Uri value) {
  const AlertUrl(this.value);

  factory AlertUrl.fromJson(String json) => AlertUrl(Uri.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertUrl.fromJson(json);
  }

  String toJson() => value.toString();
}
