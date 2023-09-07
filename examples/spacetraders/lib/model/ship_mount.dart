import 'package:spacetraders/model/ship_requirements.dart';

class ShipMount {
  ShipMount({
    required this.symbol,
    required this.name,
    required this.description,
    required this.strength,
    required this.deposits,
    required this.requirements,
  });

  factory ShipMount.fromJson(Map<String, dynamic> json) {
    return ShipMount(
      symbol: ShipMountSymbolInner.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      strength: json['strength'] as int,
      deposits: (json['deposits'] as List<dynamic>)
          .cast<ShipMountDepositsInnerInner>(),
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipMountSymbolInner symbol;
  final String name;
  final String description;
  final int strength;
  final List<ShipMountDepositsInnerInner> deposits;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'strength': strength,
      'deposits': deposits,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipMountSymbolInner {
  mountGasSiphonI('MOUNT_GAS_SIPHON_I'),
  mountGasSiphonIi('MOUNT_GAS_SIPHON_II'),
  mountGasSiphonIii('MOUNT_GAS_SIPHON_III'),
  mountSurveyorI('MOUNT_SURVEYOR_I'),
  mountSurveyorIi('MOUNT_SURVEYOR_II'),
  mountSurveyorIii('MOUNT_SURVEYOR_III'),
  mountSensorArrayI('MOUNT_SENSOR_ARRAY_I'),
  mountSensorArrayIi('MOUNT_SENSOR_ARRAY_II'),
  mountSensorArrayIii('MOUNT_SENSOR_ARRAY_III'),
  mountMiningLaserI('MOUNT_MINING_LASER_I'),
  mountMiningLaserIi('MOUNT_MINING_LASER_II'),
  mountMiningLaserIii('MOUNT_MINING_LASER_III'),
  mountLaserCannonI('MOUNT_LASER_CANNON_I'),
  mountMissileLauncherI('MOUNT_MISSILE_LAUNCHER_I'),
  mountTurretI('MOUNT_TURRET_I'),
  ;

  const ShipMountSymbolInner(this.value);

  factory ShipMountSymbolInner.fromJson(String json) {
    return ShipMountSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown ShipMountSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}

enum ShipMountDepositsInnerInner {
  quartzSand('QUARTZ_SAND'),
  siliconCrystals('SILICON_CRYSTALS'),
  preciousStones('PRECIOUS_STONES'),
  iceWater('ICE_WATER'),
  ammoniaIce('AMMONIA_ICE'),
  ironOre('IRON_ORE'),
  copperOre('COPPER_ORE'),
  silverOre('SILVER_ORE'),
  aluminumOre('ALUMINUM_ORE'),
  goldOre('GOLD_ORE'),
  platinumOre('PLATINUM_ORE'),
  diamonds('DIAMONDS'),
  uraniteOre('URANITE_ORE'),
  meritiumOre('MERITIUM_ORE'),
  ;

  const ShipMountDepositsInnerInner(this.value);

  factory ShipMountDepositsInnerInner.fromJson(String json) {
    return ShipMountDepositsInnerInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception(
        'Unknown ShipMountDepositsInnerInner value: $json',
      ),
    );
  }

  final String value;

  String toJson() => value;
}
