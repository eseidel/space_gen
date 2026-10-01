// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum SearchCodeParameter1 {
  indexed._('indexed');

  const SearchCodeParameter1._(this.value);

  /// Creates a SearchCodeParameter1 from a json value.
  factory SearchCodeParameter1.fromJson(String json) {
    return SearchCodeParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchCodeParameter1 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchCodeParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchCodeParameter1.fromJson(json);
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
