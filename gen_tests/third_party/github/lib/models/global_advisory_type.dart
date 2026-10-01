// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The type of advisory.
enum GlobalAdvisoryType {
  reviewed._('reviewed'),
  unreviewed._('unreviewed'),
  malware._('malware');

  const GlobalAdvisoryType._(this.value);

  /// Creates a GlobalAdvisoryType from a json value.
  factory GlobalAdvisoryType.fromJson(String json) {
    return GlobalAdvisoryType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown GlobalAdvisoryType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GlobalAdvisoryType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GlobalAdvisoryType.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
