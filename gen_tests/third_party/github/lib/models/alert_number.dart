/// The security alert number.
extension type const AlertNumber._(int value) {
  const AlertNumber(this.value);

  factory AlertNumber.fromJson(int json) => AlertNumber(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AlertNumber? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AlertNumber.fromJson(json);
  }

  int toJson() => value;
}
