enum SearchReposSort {
  stars._('stars'),
  forks._('forks'),
  helpWantedIssues._('help-wanted-issues'),
  updated._('updated');

  const SearchReposSort._(this.value);

  /// Creates a SearchReposSort from a json value.
  factory SearchReposSort.fromJson(String json) {
    return SearchReposSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchReposSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchReposSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchReposSort.fromJson(json);
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
