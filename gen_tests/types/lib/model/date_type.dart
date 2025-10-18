extension type const DateType._(String value) {
  const DateType(this.value);

  factory DateType.fromJson(String json) => DateType(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DateType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DateType.fromJson(json);
  }

  String toJson() => value;
}
