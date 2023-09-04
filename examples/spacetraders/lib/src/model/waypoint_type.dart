enum WaypointType {
  planet('PLANET'),
  gasGiant('GAS_GIANT'),
  moon('MOON'),
  orbitalStation('ORBITAL_STATION'),
  jumpGate('JUMP_GATE'),
  asteroidField('ASTEROID_FIELD'),
  nebula('NEBULA'),
  debrisField('DEBRIS_FIELD'),
  gravityWell('GRAVITY_WELL'),
  ;

  const WaypointType(this.value);

  factory WaypointType.fromJson(String json) {
    switch (json) {
      case 'PLANET':
        return WaypointType.planet;
      case 'GAS_GIANT':
        return WaypointType.gasGiant;
      case 'MOON':
        return WaypointType.moon;
      case 'ORBITAL_STATION':
        return WaypointType.orbitalStation;
      case 'JUMP_GATE':
        return WaypointType.jumpGate;
      case 'ASTEROID_FIELD':
        return WaypointType.asteroidField;
      case 'NEBULA':
        return WaypointType.nebula;
      case 'DEBRIS_FIELD':
        return WaypointType.debrisField;
      case 'GRAVITY_WELL':
        return WaypointType.gravityWell;
      default:
        throw Exception('Unknown WaypointType value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case WaypointType.planet:
        return 'PLANET';
      case WaypointType.gasGiant:
        return 'GAS_GIANT';
      case WaypointType.moon:
        return 'MOON';
      case WaypointType.orbitalStation:
        return 'ORBITAL_STATION';
      case WaypointType.jumpGate:
        return 'JUMP_GATE';
      case WaypointType.asteroidField:
        return 'ASTEROID_FIELD';
      case WaypointType.nebula:
        return 'NEBULA';
      case WaypointType.debrisField:
        return 'DEBRIS_FIELD';
      case WaypointType.gravityWell:
        return 'GRAVITY_WELL';
    }
  }
}
