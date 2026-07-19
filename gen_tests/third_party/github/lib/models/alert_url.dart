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
