// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum SortingMode {
  relevance._('relevance'),
  timestamp._('timestamp');

  const SortingMode._(this.value);

  /// Creates a SortingMode from a json value.
  factory SortingMode.fromJson(String json) {
    return SortingMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown SortingMode value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SortingMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SortingMode.fromJson(json);
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
