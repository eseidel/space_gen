enum ReactionsListForIssueCommentContent {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForIssueCommentContent._(this.value);

  /// Creates a ReactionsListForIssueCommentContent from a json value.
  factory ReactionsListForIssueCommentContent.fromJson(String json) {
    return ReactionsListForIssueCommentContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForIssueCommentContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForIssueCommentContent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsListForIssueCommentContent.fromJson(json);
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
