enum SearchUsersSort {
  followers._('followers'),
  repositories._('repositories'),
  joined._('joined');

  const SearchUsersSort._(this.value);

  /// Creates a SearchUsersSort from a json value.
  factory SearchUsersSort.fromJson(String json) {
    return SearchUsersSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SearchUsersSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchUsersSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchUsersSort.fromJson(json);
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
