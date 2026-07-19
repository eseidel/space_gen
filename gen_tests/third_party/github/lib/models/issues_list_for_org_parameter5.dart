enum IssuesListForOrgParameter5 {
  created._('created'),
  updated._('updated'),
  comments._('comments');

  const IssuesListForOrgParameter5._(this.value);

  /// Creates a IssuesListForOrgParameter5 from a json value.
  factory IssuesListForOrgParameter5.fromJson(String json) {
    return IssuesListForOrgParameter5.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForOrgParameter5 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForOrgParameter5? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForOrgParameter5.fromJson(json);
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
