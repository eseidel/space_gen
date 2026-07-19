enum SearchLabelsParameter2 {
  created._('created'),
  updated._('updated');

  const SearchLabelsParameter2._(this.value);

  /// Creates a SearchLabelsParameter2 from a json value.
  factory SearchLabelsParameter2.fromJson(String json) {
    return SearchLabelsParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchLabelsParameter2 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchLabelsParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchLabelsParameter2.fromJson(json);
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
