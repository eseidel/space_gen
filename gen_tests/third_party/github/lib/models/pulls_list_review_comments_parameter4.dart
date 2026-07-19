enum PullsListReviewCommentsParameter4 {
  asc._('asc'),
  desc._('desc');

  const PullsListReviewCommentsParameter4._(this.value);

  /// Creates a PullsListReviewCommentsParameter4 from a json value.
  factory PullsListReviewCommentsParameter4.fromJson(String json) {
    return PullsListReviewCommentsParameter4.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsListReviewCommentsParameter4 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListReviewCommentsParameter4? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListReviewCommentsParameter4.fromJson(json);
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
