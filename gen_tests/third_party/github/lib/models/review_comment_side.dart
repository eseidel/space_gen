/// The side of the first line of the range for a multi-line comment.
enum ReviewCommentSide {
  left._('LEFT'),
  right._('RIGHT');

  const ReviewCommentSide._(this.value);

  /// Creates a ReviewCommentSide from a json value.
  factory ReviewCommentSide.fromJson(String json) {
    return ReviewCommentSide.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ReviewCommentSide value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReviewCommentSide? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReviewCommentSide.fromJson(json);
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
