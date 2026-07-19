enum IssuesListMilestonesParameter4 {
  asc._('asc'),
  desc._('desc');

  const IssuesListMilestonesParameter4._(this.value);

  /// Creates a IssuesListMilestonesParameter4 from a json value.
  factory IssuesListMilestonesParameter4.fromJson(String json) {
    return IssuesListMilestonesParameter4.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListMilestonesParameter4 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListMilestonesParameter4? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListMilestonesParameter4.fromJson(json);
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
