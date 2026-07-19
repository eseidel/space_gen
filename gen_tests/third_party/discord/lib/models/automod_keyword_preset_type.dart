enum AutomodKeywordPresetType {
  /// Words and phrases that may be considered profanity
  profanity._(1),

  /// Words and phrases that may be considered as sexual content
  sexualContent._(2),

  /// Words and phrases that may be considered slurs and hate speech
  slurs._(3);

  const AutomodKeywordPresetType._(this.value);

  /// Creates a AutomodKeywordPresetType from a json value.
  factory AutomodKeywordPresetType.fromJson(int json) {
    return AutomodKeywordPresetType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown AutomodKeywordPresetType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AutomodKeywordPresetType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AutomodKeywordPresetType.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
