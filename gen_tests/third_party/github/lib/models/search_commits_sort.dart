enum SearchCommitsSort {
  authorDate._('author-date'),
  committerDate._('committer-date');

  const SearchCommitsSort._(this.value);

  /// Creates a SearchCommitsSort from a json value.
  factory SearchCommitsSort.fromJson(String json) {
    return SearchCommitsSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchCommitsSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchCommitsSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchCommitsSort.fromJson(json);
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
