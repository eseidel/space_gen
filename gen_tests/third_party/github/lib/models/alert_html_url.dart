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
