enum ReactionsListForCommitCommentContent {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForCommitCommentContent._(this.value);

  /// Creates a ReactionsListForCommitCommentContent from a json value.
  factory ReactionsListForCommitCommentContent.fromJson(String json) {
    return ReactionsListForCommitCommentContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForCommitCommentContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForCommitCommentContent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsListForCommitCommentContent.fromJson(json);
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
