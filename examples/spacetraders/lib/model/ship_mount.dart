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
      symbol: ShipMountSymbolString.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      strength: json['strength'] as int,
      deposits: (json['deposits'] as List<dynamic>)
          .cast<ShipMountDepositsArrayString>(),
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipMountSymbolString symbol;
  final String name;
  final String description;
  final int strength;
  final List<ShipMountDepositsArrayString> deposits;
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

enum ShipMountSymbolString {
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

  const ShipMountSymbolString(this.value);

  factory ShipMountSymbolString.fromJson(String json) {
    switch (json) {
      case 'MOUNT_GAS_SIPHON_I':
        return ShipMountSymbolString.mountGasSiphonI;
      case 'MOUNT_GAS_SIPHON_II':
        return ShipMountSymbolString.mountGasSiphonIi;
      case 'MOUNT_GAS_SIPHON_III':
        return ShipMountSymbolString.mountGasSiphonIii;
      case 'MOUNT_SURVEYOR_I':
        return ShipMountSymbolString.mountSurveyorI;
      case 'MOUNT_SURVEYOR_II':
        return ShipMountSymbolString.mountSurveyorIi;
      case 'MOUNT_SURVEYOR_III':
        return ShipMountSymbolString.mountSurveyorIii;
      case 'MOUNT_SENSOR_ARRAY_I':
        return ShipMountSymbolString.mountSensorArrayI;
      case 'MOUNT_SENSOR_ARRAY_II':
        return ShipMountSymbolString.mountSensorArrayIi;
      case 'MOUNT_SENSOR_ARRAY_III':
        return ShipMountSymbolString.mountSensorArrayIii;
      case 'MOUNT_MINING_LASER_I':
        return ShipMountSymbolString.mountMiningLaserI;
      case 'MOUNT_MINING_LASER_II':
        return ShipMountSymbolString.mountMiningLaserIi;
      case 'MOUNT_MINING_LASER_III':
        return ShipMountSymbolString.mountMiningLaserIii;
      case 'MOUNT_LASER_CANNON_I':
        return ShipMountSymbolString.mountLaserCannonI;
      case 'MOUNT_MISSILE_LAUNCHER_I':
        return ShipMountSymbolString.mountMissileLauncherI;
      case 'MOUNT_TURRET_I':
        return ShipMountSymbolString.mountTurretI;
      default:
        throw Exception('Unknown ShipMountSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipMountSymbolString.mountGasSiphonI:
        return 'MOUNT_GAS_SIPHON_I';
      case ShipMountSymbolString.mountGasSiphonIi:
        return 'MOUNT_GAS_SIPHON_II';
      case ShipMountSymbolString.mountGasSiphonIii:
        return 'MOUNT_GAS_SIPHON_III';
      case ShipMountSymbolString.mountSurveyorI:
        return 'MOUNT_SURVEYOR_I';
      case ShipMountSymbolString.mountSurveyorIi:
        return 'MOUNT_SURVEYOR_II';
      case ShipMountSymbolString.mountSurveyorIii:
        return 'MOUNT_SURVEYOR_III';
      case ShipMountSymbolString.mountSensorArrayI:
        return 'MOUNT_SENSOR_ARRAY_I';
      case ShipMountSymbolString.mountSensorArrayIi:
        return 'MOUNT_SENSOR_ARRAY_II';
      case ShipMountSymbolString.mountSensorArrayIii:
        return 'MOUNT_SENSOR_ARRAY_III';
      case ShipMountSymbolString.mountMiningLaserI:
        return 'MOUNT_MINING_LASER_I';
      case ShipMountSymbolString.mountMiningLaserIi:
        return 'MOUNT_MINING_LASER_II';
      case ShipMountSymbolString.mountMiningLaserIii:
        return 'MOUNT_MINING_LASER_III';
      case ShipMountSymbolString.mountLaserCannonI:
        return 'MOUNT_LASER_CANNON_I';
      case ShipMountSymbolString.mountMissileLauncherI:
        return 'MOUNT_MISSILE_LAUNCHER_I';
      case ShipMountSymbolString.mountTurretI:
        return 'MOUNT_TURRET_I';
    }
  }
}

enum ShipMountDepositsArrayString {
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

  const ShipMountDepositsArrayString(this.value);

  factory ShipMountDepositsArrayString.fromJson(String json) {
    switch (json) {
      case 'QUARTZ_SAND':
        return ShipMountDepositsArrayString.quartzSand;
      case 'SILICON_CRYSTALS':
        return ShipMountDepositsArrayString.siliconCrystals;
      case 'PRECIOUS_STONES':
        return ShipMountDepositsArrayString.preciousStones;
      case 'ICE_WATER':
        return ShipMountDepositsArrayString.iceWater;
      case 'AMMONIA_ICE':
        return ShipMountDepositsArrayString.ammoniaIce;
      case 'IRON_ORE':
        return ShipMountDepositsArrayString.ironOre;
      case 'COPPER_ORE':
        return ShipMountDepositsArrayString.copperOre;
      case 'SILVER_ORE':
        return ShipMountDepositsArrayString.silverOre;
      case 'ALUMINUM_ORE':
        return ShipMountDepositsArrayString.aluminumOre;
      case 'GOLD_ORE':
        return ShipMountDepositsArrayString.goldOre;
      case 'PLATINUM_ORE':
        return ShipMountDepositsArrayString.platinumOre;
      case 'DIAMONDS':
        return ShipMountDepositsArrayString.diamonds;
      case 'URANITE_ORE':
        return ShipMountDepositsArrayString.uraniteOre;
      case 'MERITIUM_ORE':
        return ShipMountDepositsArrayString.meritiumOre;
      default:
        throw Exception('Unknown ShipMountDepositsArrayString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipMountDepositsArrayString.quartzSand:
        return 'QUARTZ_SAND';
      case ShipMountDepositsArrayString.siliconCrystals:
        return 'SILICON_CRYSTALS';
      case ShipMountDepositsArrayString.preciousStones:
        return 'PRECIOUS_STONES';
      case ShipMountDepositsArrayString.iceWater:
        return 'ICE_WATER';
      case ShipMountDepositsArrayString.ammoniaIce:
        return 'AMMONIA_ICE';
      case ShipMountDepositsArrayString.ironOre:
        return 'IRON_ORE';
      case ShipMountDepositsArrayString.copperOre:
        return 'COPPER_ORE';
      case ShipMountDepositsArrayString.silverOre:
        return 'SILVER_ORE';
      case ShipMountDepositsArrayString.aluminumOre:
        return 'ALUMINUM_ORE';
      case ShipMountDepositsArrayString.goldOre:
        return 'GOLD_ORE';
      case ShipMountDepositsArrayString.platinumOre:
        return 'PLATINUM_ORE';
      case ShipMountDepositsArrayString.diamonds:
        return 'DIAMONDS';
      case ShipMountDepositsArrayString.uraniteOre:
        return 'URANITE_ORE';
      case ShipMountDepositsArrayString.meritiumOre:
        return 'MERITIUM_ORE';
    }
  }
}
