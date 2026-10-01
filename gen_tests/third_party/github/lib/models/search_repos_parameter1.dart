// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum SearchReposParameter1 {
  stars._('stars'),
  forks._('forks'),
  helpWantedIssues._('help-wanted-issues'),
  updated._('updated');

  const SearchReposParameter1._(this.value);

  /// Creates a SearchReposParameter1 from a json value.
  factory SearchReposParameter1.fromJson(String json) {
    return SearchReposParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchReposParameter1 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchReposParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchReposParameter1.fromJson(json);
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
