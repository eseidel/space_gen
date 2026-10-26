enum SearchLabelsSort {
  created._('created'),
  updated._('updated');

  const SearchLabelsSort._(this.value);

  /// Creates a SearchLabelsSort from a json value.
  factory SearchLabelsSort.fromJson(String json) {
    return SearchLabelsSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchLabelsSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchLabelsSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchLabelsSort.fromJson(json);
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
