enum IssuesListForOrgParameter1 {
  assigned._('assigned'),
  created._('created'),
  mentioned._('mentioned'),
  subscribed._('subscribed'),
  repos._('repos'),
  all._('all');

  const IssuesListForOrgParameter1._(this.value);

  /// Creates a IssuesListForOrgParameter1 from a json value.
  factory IssuesListForOrgParameter1.fromJson(String json) {
    return IssuesListForOrgParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForOrgParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForOrgParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForOrgParameter1.fromJson(json);
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
