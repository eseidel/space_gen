enum ReactionsListForIssueParameter3 {
  plus1._('+1'),
  minus1._('-1'),
  laugh._('laugh'),
  confused._('confused'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForIssueParameter3._(this.value);

  /// Creates a ReactionsListForIssueParameter3 from a json value.
  factory ReactionsListForIssueParameter3.fromJson(String json) {
    return ReactionsListForIssueParameter3.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForIssueParameter3 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForIssueParameter3? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsListForIssueParameter3.fromJson(json);
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
