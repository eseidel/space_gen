enum OnboardingPromptType {
  /// Multiple choice options
  multipleChoice._(0),

  /// Many options shown as a dropdown
  dropdown._(1);

  const OnboardingPromptType._(this.value);

  /// Creates a OnboardingPromptType from a json value.
  factory OnboardingPromptType.fromJson(int json) {
    return OnboardingPromptType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown OnboardingPromptType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OnboardingPromptType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return OnboardingPromptType.fromJson(json);
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
