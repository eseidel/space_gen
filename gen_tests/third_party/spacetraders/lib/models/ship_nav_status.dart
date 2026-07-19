/// The current status of the ship
enum ShipNavStatus {
  inTransit._('IN_TRANSIT'),
  inOrbit._('IN_ORBIT'),
  docked._('DOCKED');

  const ShipNavStatus._(this.value);

  /// Creates a ShipNavStatus from a json value.
  factory ShipNavStatus.fromJson(String json) {
    return ShipNavStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ShipNavStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipNavStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipNavStatus.fromJson(json);
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
