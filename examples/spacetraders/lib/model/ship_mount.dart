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
    switch (json) {
      case 'MOUNT_GAS_SIPHON_I':
        return ShipMountSymbolInner.mountGasSiphonI;
      case 'MOUNT_GAS_SIPHON_II':
        return ShipMountSymbolInner.mountGasSiphonIi;
      case 'MOUNT_GAS_SIPHON_III':
        return ShipMountSymbolInner.mountGasSiphonIii;
      case 'MOUNT_SURVEYOR_I':
        return ShipMountSymbolInner.mountSurveyorI;
      case 'MOUNT_SURVEYOR_II':
        return ShipMountSymbolInner.mountSurveyorIi;
      case 'MOUNT_SURVEYOR_III':
        return ShipMountSymbolInner.mountSurveyorIii;
      case 'MOUNT_SENSOR_ARRAY_I':
        return ShipMountSymbolInner.mountSensorArrayI;
      case 'MOUNT_SENSOR_ARRAY_II':
        return ShipMountSymbolInner.mountSensorArrayIi;
      case 'MOUNT_SENSOR_ARRAY_III':
        return ShipMountSymbolInner.mountSensorArrayIii;
      case 'MOUNT_MINING_LASER_I':
        return ShipMountSymbolInner.mountMiningLaserI;
      case 'MOUNT_MINING_LASER_II':
        return ShipMountSymbolInner.mountMiningLaserIi;
      case 'MOUNT_MINING_LASER_III':
        return ShipMountSymbolInner.mountMiningLaserIii;
      case 'MOUNT_LASER_CANNON_I':
        return ShipMountSymbolInner.mountLaserCannonI;
      case 'MOUNT_MISSILE_LAUNCHER_I':
        return ShipMountSymbolInner.mountMissileLauncherI;
      case 'MOUNT_TURRET_I':
        return ShipMountSymbolInner.mountTurretI;
      default:
        throw Exception('Unknown ShipMountSymbolInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipMountSymbolInner.mountGasSiphonI:
        return 'MOUNT_GAS_SIPHON_I';
      case ShipMountSymbolInner.mountGasSiphonIi:
        return 'MOUNT_GAS_SIPHON_II';
      case ShipMountSymbolInner.mountGasSiphonIii:
        return 'MOUNT_GAS_SIPHON_III';
      case ShipMountSymbolInner.mountSurveyorI:
        return 'MOUNT_SURVEYOR_I';
      case ShipMountSymbolInner.mountSurveyorIi:
        return 'MOUNT_SURVEYOR_II';
      case ShipMountSymbolInner.mountSurveyorIii:
        return 'MOUNT_SURVEYOR_III';
      case ShipMountSymbolInner.mountSensorArrayI:
        return 'MOUNT_SENSOR_ARRAY_I';
      case ShipMountSymbolInner.mountSensorArrayIi:
        return 'MOUNT_SENSOR_ARRAY_II';
      case ShipMountSymbolInner.mountSensorArrayIii:
        return 'MOUNT_SENSOR_ARRAY_III';
      case ShipMountSymbolInner.mountMiningLaserI:
        return 'MOUNT_MINING_LASER_I';
      case ShipMountSymbolInner.mountMiningLaserIi:
        return 'MOUNT_MINING_LASER_II';
      case ShipMountSymbolInner.mountMiningLaserIii:
        return 'MOUNT_MINING_LASER_III';
      case ShipMountSymbolInner.mountLaserCannonI:
        return 'MOUNT_LASER_CANNON_I';
      case ShipMountSymbolInner.mountMissileLauncherI:
        return 'MOUNT_MISSILE_LAUNCHER_I';
      case ShipMountSymbolInner.mountTurretI:
        return 'MOUNT_TURRET_I';
    }
  }
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
    switch (json) {
      case 'QUARTZ_SAND':
        return ShipMountDepositsInnerInner.quartzSand;
      case 'SILICON_CRYSTALS':
        return ShipMountDepositsInnerInner.siliconCrystals;
      case 'PRECIOUS_STONES':
        return ShipMountDepositsInnerInner.preciousStones;
      case 'ICE_WATER':
        return ShipMountDepositsInnerInner.iceWater;
      case 'AMMONIA_ICE':
        return ShipMountDepositsInnerInner.ammoniaIce;
      case 'IRON_ORE':
        return ShipMountDepositsInnerInner.ironOre;
      case 'COPPER_ORE':
        return ShipMountDepositsInnerInner.copperOre;
      case 'SILVER_ORE':
        return ShipMountDepositsInnerInner.silverOre;
      case 'ALUMINUM_ORE':
        return ShipMountDepositsInnerInner.aluminumOre;
      case 'GOLD_ORE':
        return ShipMountDepositsInnerInner.goldOre;
      case 'PLATINUM_ORE':
        return ShipMountDepositsInnerInner.platinumOre;
      case 'DIAMONDS':
        return ShipMountDepositsInnerInner.diamonds;
      case 'URANITE_ORE':
        return ShipMountDepositsInnerInner.uraniteOre;
      case 'MERITIUM_ORE':
        return ShipMountDepositsInnerInner.meritiumOre;
      default:
        throw Exception('Unknown ShipMountDepositsInnerInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipMountDepositsInnerInner.quartzSand:
        return 'QUARTZ_SAND';
      case ShipMountDepositsInnerInner.siliconCrystals:
        return 'SILICON_CRYSTALS';
      case ShipMountDepositsInnerInner.preciousStones:
        return 'PRECIOUS_STONES';
      case ShipMountDepositsInnerInner.iceWater:
        return 'ICE_WATER';
      case ShipMountDepositsInnerInner.ammoniaIce:
        return 'AMMONIA_ICE';
      case ShipMountDepositsInnerInner.ironOre:
        return 'IRON_ORE';
      case ShipMountDepositsInnerInner.copperOre:
        return 'COPPER_ORE';
      case ShipMountDepositsInnerInner.silverOre:
        return 'SILVER_ORE';
      case ShipMountDepositsInnerInner.aluminumOre:
        return 'ALUMINUM_ORE';
      case ShipMountDepositsInnerInner.goldOre:
        return 'GOLD_ORE';
      case ShipMountDepositsInnerInner.platinumOre:
        return 'PLATINUM_ORE';
      case ShipMountDepositsInnerInner.diamonds:
        return 'DIAMONDS';
      case ShipMountDepositsInnerInner.uraniteOre:
        return 'URANITE_ORE';
      case ShipMountDepositsInnerInner.meritiumOre:
        return 'MERITIUM_ORE';
    }
  }
}
