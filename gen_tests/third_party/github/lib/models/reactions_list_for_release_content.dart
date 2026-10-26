enum ReactionsListForReleaseContent {
  plus1._('+1'),
  laugh._('laugh'),
  heart._('heart'),
  hooray._('hooray'),
  rocket._('rocket'),
  eyes._('eyes');

  const ReactionsListForReleaseContent._(this.value);

  /// Creates a ReactionsListForReleaseContent from a json value.
  factory ReactionsListForReleaseContent.fromJson(String json) {
    return ReactionsListForReleaseContent.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReactionsListForReleaseContent value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReactionsListForReleaseContent? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReactionsListForReleaseContent.fromJson(json);
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
