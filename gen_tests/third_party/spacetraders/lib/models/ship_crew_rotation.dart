/// The rotation of crew shifts. A stricter shift improves the ship's
/// performance. A more relaxed shift improves the crew's morale.
enum ShipCrewRotation {
  strict._('STRICT'),
  relaxed._('RELAXED');

  const ShipCrewRotation._(this.value);

  /// Creates a ShipCrewRotation from a json value.
  factory ShipCrewRotation.fromJson(String json) {
    return ShipCrewRotation.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ShipCrewRotation value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ShipCrewRotation? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipCrewRotation.fromJson(json);
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
