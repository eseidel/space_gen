// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
enum ReactionsListForCommitCommentParameter3 {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForCommitCommentParameter3._(this.value);

  /// Creates a ReactionsListForCommitCommentParameter3 from a json value.
  factory ReactionsListForCommitCommentParameter3.fromJson(String json) {
    return ReactionsListForCommitCommentParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForCommitCommentParameter3 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForCommitCommentParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsListForCommitCommentParameter3.fromJson(json);
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
