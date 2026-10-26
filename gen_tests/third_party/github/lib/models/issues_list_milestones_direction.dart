enum IssuesListMilestonesDirection {
  asc._('asc'),
  desc._('desc');

  const IssuesListMilestonesDirection._(this.value);

  /// Creates a IssuesListMilestonesDirection from a json value.
  factory IssuesListMilestonesDirection.fromJson(String json) {
    return IssuesListMilestonesDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListMilestonesDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListMilestonesDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListMilestonesDirection.fromJson(json);
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
