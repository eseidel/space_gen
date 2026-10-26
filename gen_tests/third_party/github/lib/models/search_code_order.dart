enum SearchCodeOrder {
  desc._('desc'),
  asc._('asc');

  const SearchCodeOrder._(this.value);

  /// Creates a SearchCodeOrder from a json value.
  factory SearchCodeOrder.fromJson(String json) {
    return SearchCodeOrder.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchCodeOrder value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchCodeOrder? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchCodeOrder.fromJson(json);
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
