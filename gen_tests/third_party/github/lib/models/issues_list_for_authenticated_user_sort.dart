enum IssuesListForAuthenticatedUserSort {
  created._('created'),
  updated._('updated'),
  comments._('comments');

  const IssuesListForAuthenticatedUserSort._(this.value);

  /// Creates a IssuesListForAuthenticatedUserSort from a json value.
  factory IssuesListForAuthenticatedUserSort.fromJson(String json) {
    return IssuesListForAuthenticatedUserSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForAuthenticatedUserSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForAuthenticatedUserSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForAuthenticatedUserSort.fromJson(json);
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
