// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum SearchIssuesAndPullRequestsParameter1 {
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

  const SearchIssuesAndPullRequestsParameter1._(this.value);

  /// Creates a SearchIssuesAndPullRequestsParameter1 from a json value.
  factory SearchIssuesAndPullRequestsParameter1.fromJson(String json) {
    return SearchIssuesAndPullRequestsParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SearchIssuesAndPullRequestsParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SearchIssuesAndPullRequestsParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SearchIssuesAndPullRequestsParameter1.fromJson(json);
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
