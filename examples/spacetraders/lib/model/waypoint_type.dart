enum WaypointType {
  planet('PLANET'),
  gasGiant('GAS_GIANT'),
  moon('MOON'),
  orbitalStation('ORBITAL_STATION'),
  jumpGate('JUMP_GATE'),
  asteroidField('ASTEROID_FIELD'),
  asteroid('ASTEROID'),
  engineeredAsteroid('ENGINEERED_ASTEROID'),
  asteroidBase('ASTEROID_BASE'),
  nebula('NEBULA'),
  debrisField('DEBRIS_FIELD'),
  gravityWell('GRAVITY_WELL'),
  artificialGravityWell('ARTIFICIAL_GRAVITY_WELL'),
  fuelStation('FUEL_STATION'),
  ;

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
