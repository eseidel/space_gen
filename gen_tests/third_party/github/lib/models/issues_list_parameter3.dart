enum IssuesListParameter3 {
  created._('created'),
  updated._('updated'),
  comments._('comments');

  const IssuesListParameter3._(this.value);

  /// Creates a IssuesListParameter3 from a json value.
  factory IssuesListParameter3.fromJson(String json) {
    return IssuesListParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown IssuesListParameter3 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IssuesListParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return IssuesListParameter3.fromJson(json);
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
