enum SkuIneligibilityReason {
  /// Other / catch-all
  other._(0),

  /// User already owns this SKU or one of its components
  ownsSkuOrBundleComponent._(1),

  /// User account is not on an eligible platform
  platformRestriction._(2);

  const SkuIneligibilityReason._(this.value);

  /// Creates a SkuIneligibilityReason from a json value.
  factory SkuIneligibilityReason.fromJson(int json) {
    return SkuIneligibilityReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SkuIneligibilityReason value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SkuIneligibilityReason? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return SkuIneligibilityReason.fromJson(json);
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
