enum ReactionsListForTeamDiscussionInOrgContent {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForTeamDiscussionInOrgContent._(this.value);

  /// Creates a ReactionsListForTeamDiscussionInOrgContent from a json value.
  factory ReactionsListForTeamDiscussionInOrgContent.fromJson(String json) {
    return ReactionsListForTeamDiscussionInOrgContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForTeamDiscussionInOrgContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForTeamDiscussionInOrgContent? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsListForTeamDiscussionInOrgContent.fromJson(json);
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
