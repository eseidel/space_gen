extension type const Priority._(int value) {
  const Priority(this.value);

  factory Priority.fromJson(int json) => Priority(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Priority? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return Priority.fromJson(json);
  }

  int toJson() => value;
}
