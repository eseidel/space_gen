// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// If provided, the `secret` will be used as the `key` to generate the HMAC hex
/// digest value for [delivery signature
/// headers](https://docs.github.com/webhooks/event-payloads/#delivery-headers).
/// Example: `'"********"'`
extension type const WebhookConfigSecret._(String value) {
  const WebhookConfigSecret(this.value);

  factory WebhookConfigSecret.fromJson(String json) =>
      WebhookConfigSecret(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookConfigSecret? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WebhookConfigSecret.fromJson(json);
  }

  String toJson() => value;
}
