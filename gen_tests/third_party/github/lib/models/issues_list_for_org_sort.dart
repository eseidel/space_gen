enum IssuesListForOrgSort {
  created._('created'),
  updated._('updated'),
  comments._('comments');

  const IssuesListForOrgSort._(this.value);

  /// Creates a IssuesListForOrgSort from a json value.
  factory IssuesListForOrgSort.fromJson(String json) {
    return IssuesListForOrgSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListForOrgSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForOrgSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForOrgSort.fromJson(json);
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
