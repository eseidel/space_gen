enum PullsListParameter5 {
  created._('created'),
  updated._('updated'),
  popularity._('popularity'),
  longRunning._('long-running');

  const PullsListParameter5._(this.value);

  /// Creates a PullsListParameter5 from a json value.
  factory PullsListParameter5.fromJson(String json) {
    return PullsListParameter5.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PullsListParameter5 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListParameter5? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListParameter5.fromJson(json);
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
