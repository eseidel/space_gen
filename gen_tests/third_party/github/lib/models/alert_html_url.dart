// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The GitHub URL of the alert resource.
extension type const AlertHtmlUrl._(Uri value) {
  const AlertHtmlUrl(this.value);

  factory AlertHtmlUrl.fromJson(String json) => AlertHtmlUrl(Uri.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertHtmlUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertHtmlUrl.fromJson(json);
  }

  String toJson() => value.toString();
}
