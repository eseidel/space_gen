enum PremiumGuildTiers {
  /// Guild has not unlocked any Server Boost perks
  none._(0),

  /// Guild has unlocked Server Boost level 1 perks
  tier1._(1),

  /// Guild has unlocked Server Boost level 2 perks
  tier2._(2),

  /// Guild has unlocked Server Boost level 3 perks
  tier3._(3);

  const PremiumGuildTiers._(this.value);

  /// Creates a PremiumGuildTiers from a json value.
  factory PremiumGuildTiers.fromJson(int json) {
    return PremiumGuildTiers.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown PremiumGuildTiers value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PremiumGuildTiers? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return PremiumGuildTiers.fromJson(json);
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
