enum AutomodTriggerType {
  /// Check if content contains words from a list of keywords or matches regex
  keyword._(1),

  /// DEPRECATED
  spamLink._(2),

  /// Check if content represents generic spam
  mlSpam._(3),

  /// Check if content contains words from internal pre-defined wordsets
  defaultKeywordList._(4),

  /// Check if content contains more unique mentions than allowed
  mentionSpam._(5);

  const AutomodTriggerType._(this.value);

  /// Creates a AutomodTriggerType from a json value.
  factory AutomodTriggerType.fromJson(int json) {
    return AutomodTriggerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AutomodTriggerType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AutomodTriggerType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return AutomodTriggerType.fromJson(json);
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
