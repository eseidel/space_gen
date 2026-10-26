enum IssuesListSort {
  created._('created'),
  updated._('updated'),
  comments._('comments');

  const IssuesListSort._(this.value);

  /// Creates a IssuesListSort from a json value.
  factory IssuesListSort.fromJson(String json) {
    return IssuesListSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListSort.fromJson(json);
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
