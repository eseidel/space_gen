enum SearchCommitsParameter1 {
  authorDate._('author-date'),
  committerDate._('committer-date');

  const SearchCommitsParameter1._(this.value);

  /// Creates a SearchCommitsParameter1 from a json value.
  factory SearchCommitsParameter1.fromJson(String json) {
    return SearchCommitsParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchCommitsParameter1 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchCommitsParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchCommitsParameter1.fromJson(json);
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
