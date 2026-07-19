/// The side of the first line of the range for a multi-line comment.
enum ReviewCommentStartSide {
  left._('LEFT'),
  right._('RIGHT');

  const ReviewCommentStartSide._(this.value);

  /// Creates a ReviewCommentStartSide from a json value.
  factory ReviewCommentStartSide.fromJson(String json) {
    return ReviewCommentStartSide.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReviewCommentStartSide value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReviewCommentStartSide? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReviewCommentStartSide.fromJson(json);
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
