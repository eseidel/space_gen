enum PullsListReviewCommentsDirection {
  asc._('asc'),
  desc._('desc');

  const PullsListReviewCommentsDirection._(this.value);

  /// Creates a PullsListReviewCommentsDirection from a json value.
  factory PullsListReviewCommentsDirection.fromJson(String json) {
    return PullsListReviewCommentsDirection.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown PullsListReviewCommentsDirection value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PullsListReviewCommentsDirection? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PullsListReviewCommentsDirection.fromJson(json);
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
