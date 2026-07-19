enum IssuesListForOrgParameter2 {
  open._('open'),
  closed._('closed'),
  all._('all');

  const IssuesListForOrgParameter2._(this.value);

  /// Creates a IssuesListForOrgParameter2 from a json value.
  factory IssuesListForOrgParameter2.fromJson(String json) {
    return IssuesListForOrgParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForOrgParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForOrgParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForOrgParameter2.fromJson(json);
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
