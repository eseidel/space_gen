extension type const UuidType._(String value) {
  const UuidType(this.value);

  factory UuidType.fromJson(String json) => UuidType(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UuidType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UuidType.fromJson(json);
  }

  String toJson() => value;
}
