enum PremiumTypes {
  /// None
  none._(0),

  /// Nitro Classic
  tier1._(1),

  /// Nitro Standard
  tier2._(2),

  /// Nitro Basic
  tier0._(3);

  const PremiumTypes._(this.value);

  /// Creates a PremiumTypes from a json value.
  factory PremiumTypes.fromJson(int json) {
    return PremiumTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown PremiumTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PremiumTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return PremiumTypes.fromJson(json);
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
