enum IssuesListMilestonesSort {
  dueOn._('due_on'),
  completeness._('completeness');

  const IssuesListMilestonesSort._(this.value);

  /// Creates a IssuesListMilestonesSort from a json value.
  factory IssuesListMilestonesSort.fromJson(String json) {
    return IssuesListMilestonesSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListMilestonesSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListMilestonesSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListMilestonesSort.fromJson(json);
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
