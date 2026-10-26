enum ReactionsListForIssueContent {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForIssueContent._(this.value);

  /// Creates a ReactionsListForIssueContent from a json value.
  factory ReactionsListForIssueContent.fromJson(String json) {
    return ReactionsListForIssueContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForIssueContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForIssueContent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsListForIssueContent.fromJson(json);
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
