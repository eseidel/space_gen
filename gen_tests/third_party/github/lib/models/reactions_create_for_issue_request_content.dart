/// The [reaction
/// type](https://docs.github.com/rest/reactions/reactions#about-reactions) to
/// add to the issue.
enum ReactionsCreateForIssueRequestContent {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsCreateForIssueRequestContent._(this.value);

  /// Creates a ReactionsCreateForIssueRequestContent from a json value.
  factory ReactionsCreateForIssueRequestContent.fromJson(String json) {
    return ReactionsCreateForIssueRequestContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsCreateForIssueRequestContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsCreateForIssueRequestContent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForIssueRequestContent.fromJson(json);
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
