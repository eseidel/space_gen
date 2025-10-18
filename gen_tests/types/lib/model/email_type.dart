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
