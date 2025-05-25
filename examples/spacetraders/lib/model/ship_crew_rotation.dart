enum ShipCrewRotation {
  STRICT._('STRICT'),
  RELAXED._('RELAXED');

  const ShipCrewRotation._(this.value);

  factory ShipCrewRotation.fromJson(String json) {
    return ShipCrewRotation.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () => throw FormatException('Unknown ShipCrewRotation value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipCrewRotation? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ShipCrewRotation.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
