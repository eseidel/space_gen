extension type const DateType._(DateTime value) {
  const DateType(this.value);

  factory DateType.fromJson(String json) => DateType(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DateType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DateType.fromJson(json);
  }

  String toJson() => value.toIso8601String().substring(0, 10);
}
