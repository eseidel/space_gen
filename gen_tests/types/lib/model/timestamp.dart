extension type const Timestamp._(DateTime value) {
  const Timestamp(this.value);

  factory Timestamp.fromJson(String json) => Timestamp(DateTime.parse(json));

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Timestamp? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return Timestamp.fromJson(json);
  }

  String toJson() => value.toIso8601String();
}
