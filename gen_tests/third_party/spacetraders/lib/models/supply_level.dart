/// The supply level of a trade good.
enum SupplyLevel {
  scarce._('SCARCE'),
  limited._('LIMITED'),
  moderate._('MODERATE'),
  high._('HIGH'),
  abundant._('ABUNDANT');

  const SupplyLevel._(this.value);

  /// Creates a SupplyLevel from a json value.
  factory SupplyLevel.fromJson(String json) {
    return SupplyLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown SupplyLevel value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SupplyLevel? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SupplyLevel.fromJson(json);
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
