enum GuildOnboardingMode {
  /// Only Default Channels considered in constraints
  onboardingDefault._(0),

  /// Default Channels and Onboarding Prompts considered in constraints
  onboardingAdvanced._(1);

  const GuildOnboardingMode._(this.value);

  /// Creates a GuildOnboardingMode from a json value.
  factory GuildOnboardingMode.fromJson(int json) {
    return GuildOnboardingMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown GuildOnboardingMode value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildOnboardingMode? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildOnboardingMode.fromJson(json);
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
