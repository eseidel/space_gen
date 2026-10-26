enum SearchIssuesAndPullRequestsSort {
  comments._('comments'),
  reactions._('reactions'),
  reactionsPlus1._('reactions-+1'),
  reactions1._('reactions--1'),
  reactionsSmile._('reactions-smile'),
  reactionsThinkingFace._('reactions-thinking_face'),
  reactionsHeart._('reactions-heart'),
  reactionsTada._('reactions-tada'),
  interactions._('interactions'),
  created._('created'),
  updated._('updated');

  const SearchIssuesAndPullRequestsSort._(this.value);

  /// Creates a SearchIssuesAndPullRequestsSort from a json value.
  factory SearchIssuesAndPullRequestsSort.fromJson(String json) {
    return SearchIssuesAndPullRequestsSort.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SearchIssuesAndPullRequestsSort value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchIssuesAndPullRequestsSort? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchIssuesAndPullRequestsSort.fromJson(json);
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
