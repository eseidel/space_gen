/// The media type used to serialize the payloads. Supported values include
/// `json` and `form`. The default is `form`.
/// Example: `'"json"'`
extension type const WebhookConfigContentType._(String value) {
  const WebhookConfigContentType(this.value);

  factory WebhookConfigContentType.fromJson(String json) =>
      WebhookConfigContentType(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookConfigContentType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WebhookConfigContentType.fromJson(json);
  }

  String toJson() => value;
}
