// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
