enum IssuesListFilter {
  assigned._('assigned'),
  created._('created'),
  mentioned._('mentioned'),
  subscribed._('subscribed'),
  repos._('repos'),
  all._('all');

  const IssuesListFilter._(this.value);

  /// Creates a IssuesListFilter from a json value.
  factory IssuesListFilter.fromJson(String json) {
    return IssuesListFilter.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListFilter value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListFilter? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListFilter.fromJson(json);
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
