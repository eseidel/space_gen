enum EntitlementTypes {
  applicationSubscription._(8),
  questReward._(10);

  const EntitlementTypes._(this.value);

  /// Creates a EntitlementTypes from a json value.
  factory EntitlementTypes.fromJson(int json) {
    return EntitlementTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown EntitlementTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static EntitlementTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return EntitlementTypes.fromJson(json);
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
