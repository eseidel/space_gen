enum PullsListParameter6 {
  asc._('asc'),
  desc._('desc');

  const PullsListParameter6._(this.value);

  /// Creates a PullsListParameter6 from a json value.
  factory PullsListParameter6.fromJson(String json) {
    return PullsListParameter6.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PullsListParameter6 value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListParameter6? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListParameter6.fromJson(json);
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
