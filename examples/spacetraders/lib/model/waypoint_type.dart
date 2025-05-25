enum WaypointType {
  PLANET._('PLANET'),
  GAS_GIANT._('GAS_GIANT'),
  MOON._('MOON'),
  ORBITAL_STATION._('ORBITAL_STATION'),
  JUMP_GATE._('JUMP_GATE'),
  ASTEROID_FIELD._('ASTEROID_FIELD'),
  ASTEROID._('ASTEROID'),
  ENGINEERED_ASTEROID._('ENGINEERED_ASTEROID'),
  ASTEROID_BASE._('ASTEROID_BASE'),
  NEBULA._('NEBULA'),
  DEBRIS_FIELD._('DEBRIS_FIELD'),
  GRAVITY_WELL._('GRAVITY_WELL'),
  ARTIFICIAL_GRAVITY_WELL._('ARTIFICIAL_GRAVITY_WELL'),
  FUEL_STATION._('FUEL_STATION');

  const WaypointType._(this.value);

  factory WaypointType.fromJson(String json) {
    return WaypointType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown WaypointType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return WaypointType.fromJson(json);
  }

  final String value;

  String toJson() => value;

  @override
  String toString() => value;
}
