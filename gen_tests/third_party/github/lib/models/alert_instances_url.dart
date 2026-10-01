// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The REST API URL for fetching the list of instances for an alert.
extension type const AlertInstancesUrl._(Uri value) {
  const AlertInstancesUrl(this.value);

  factory AlertInstancesUrl.fromJson(String json) =>
      AlertInstancesUrl(Uri.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertInstancesUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AlertInstancesUrl.fromJson(json);
  }

  String toJson() => value.toString();
}
