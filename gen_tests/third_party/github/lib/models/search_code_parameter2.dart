enum SearchCodeParameter2 {
  desc._('desc'),
  asc._('asc');

  const SearchCodeParameter2._(this.value);

  /// Creates a SearchCodeParameter2 from a json value.
  factory SearchCodeParameter2.fromJson(String json) {
    return SearchCodeParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchCodeParameter2 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchCodeParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchCodeParameter2.fromJson(json);
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
