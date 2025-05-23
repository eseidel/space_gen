enum WaypointType {
  PLANET('PLANET'),
  GAS_GIANT('GAS_GIANT'),
  MOON('MOON'),
  ORBITAL_STATION('ORBITAL_STATION'),
  JUMP_GATE('JUMP_GATE'),
  ASTEROID_FIELD('ASTEROID_FIELD'),
  ASTEROID('ASTEROID'),
  ENGINEERED_ASTEROID('ENGINEERED_ASTEROID'),
  ASTEROID_BASE('ASTEROID_BASE'),
  NEBULA('NEBULA'),
  DEBRIS_FIELD('DEBRIS_FIELD'),
  GRAVITY_WELL('GRAVITY_WELL'),
  ARTIFICIAL_GRAVITY_WELL('ARTIFICIAL_GRAVITY_WELL'),
  FUEL_STATION('FUEL_STATION');

  const WaypointType(this.value);

  factory WaypointType.fromJson(String json) {
    return WaypointType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown WaypointType value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
