// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The URL to which the payloads will be delivered.
/// Example: `'https://example.com/webhook'`
extension type const WebhookConfigUrl._(Uri value) {
  const WebhookConfigUrl(this.value);

  factory WebhookConfigUrl.fromJson(String json) =>
      WebhookConfigUrl(Uri.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookConfigUrl? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WebhookConfigUrl.fromJson(json);
  }

  String toJson() => value.toString();
}
