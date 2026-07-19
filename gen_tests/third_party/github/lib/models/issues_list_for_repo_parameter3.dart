enum IssuesListForRepoParameter3 {
  open._('open'),
  closed._('closed'),
  all._('all');

  const IssuesListForRepoParameter3._(this.value);

  /// Creates a IssuesListForRepoParameter3 from a json value.
  factory IssuesListForRepoParameter3.fromJson(String json) {
    return IssuesListForRepoParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IssuesListForRepoParameter3 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListForRepoParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListForRepoParameter3.fromJson(json);
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
