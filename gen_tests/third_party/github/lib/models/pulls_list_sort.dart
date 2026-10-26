enum PullsListSort {
  created._('created'),
  updated._('updated'),
  popularity._('popularity'),
  longRunning._('long-running');

  const PullsListSort._(this.value);

  /// Creates a PullsListSort from a json value.
  factory PullsListSort.fromJson(String json) {
    return PullsListSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown PullsListSort value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListSort.fromJson(json);
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
