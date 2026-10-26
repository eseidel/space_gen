enum IssuesListForOrgFilter {
  assigned._('assigned'),
  created._('created'),
  mentioned._('mentioned'),
  subscribed._('subscribed'),
  repos._('repos'),
  all._('all');

  const IssuesListForOrgFilter._(this.value);

  /// Creates a IssuesListForOrgFilter from a json value.
  factory IssuesListForOrgFilter.fromJson(String json) {
    return IssuesListForOrgFilter.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListForOrgFilter value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForOrgFilter? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForOrgFilter.fromJson(json);
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
