class WaypointTrait {
  WaypointTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory WaypointTrait.fromJson(Map<String, dynamic> json) {
    return WaypointTrait(
      symbol: WaypointTraitSymbolInner.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final WaypointTraitSymbolInner symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }
}

enum WaypointTraitSymbolInner {
  uncharted('UNCHARTED'),
  marketplace('MARKETPLACE'),
  shipyard('SHIPYARD'),
  outpost('OUTPOST'),
  scatteredSettlements('SCATTERED_SETTLEMENTS'),
  sprawlingCities('SPRAWLING_CITIES'),
  megaStructures('MEGA_STRUCTURES'),
  overcrowded('OVERCROWDED'),
  highTech('HIGH_TECH'),
  corrupt('CORRUPT'),
  bureaucratic('BUREAUCRATIC'),
  tradingHub('TRADING_HUB'),
  industrial('INDUSTRIAL'),
  blackMarket('BLACK_MARKET'),
  researchFacility('RESEARCH_FACILITY'),
  militaryBase('MILITARY_BASE'),
  surveillanceOutpost('SURVEILLANCE_OUTPOST'),
  explorationOutpost('EXPLORATION_OUTPOST'),
  mineralDeposits('MINERAL_DEPOSITS'),
  commonMetalDeposits('COMMON_METAL_DEPOSITS'),
  preciousMetalDeposits('PRECIOUS_METAL_DEPOSITS'),
  rareMetalDeposits('RARE_METAL_DEPOSITS'),
  methanePools('METHANE_POOLS'),
  iceCrystals('ICE_CRYSTALS'),
  explosiveGases('EXPLOSIVE_GASES'),
  strongMagnetosphere('STRONG_MAGNETOSPHERE'),
  vibrantAuroras('VIBRANT_AURORAS'),
  saltFlats('SALT_FLATS'),
  canyons('CANYONS'),
  perpetualDaylight('PERPETUAL_DAYLIGHT'),
  perpetualOvercast('PERPETUAL_OVERCAST'),
  drySeabeds('DRY_SEABEDS'),
  magmaSeas('MAGMA_SEAS'),
  supervolcanoes('SUPERVOLCANOES'),
  ashClouds('ASH_CLOUDS'),
  vastRuins('VAST_RUINS'),
  mutatedFlora('MUTATED_FLORA'),
  terraformed('TERRAFORMED'),
  extremeTemperatures('EXTREME_TEMPERATURES'),
  extremePressure('EXTREME_PRESSURE'),
  diverseLife('DIVERSE_LIFE'),
  scarceLife('SCARCE_LIFE'),
  fossils('FOSSILS'),
  weakGravity('WEAK_GRAVITY'),
  strongGravity('STRONG_GRAVITY'),
  crushingGravity('CRUSHING_GRAVITY'),
  toxicAtmosphere('TOXIC_ATMOSPHERE'),
  corrosiveAtmosphere('CORROSIVE_ATMOSPHERE'),
  breathableAtmosphere('BREATHABLE_ATMOSPHERE'),
  jovian('JOVIAN'),
  rocky('ROCKY'),
  volcanic('VOLCANIC'),
  frozen('FROZEN'),
  swamp('SWAMP'),
  barren('BARREN'),
  temperate('TEMPERATE'),
  jungle('JUNGLE'),
  ocean('OCEAN'),
  stripped('STRIPPED'),
  ;

  const WaypointTraitSymbolInner(this.value);

  factory WaypointTraitSymbolInner.fromJson(String json) {
    switch (json) {
      case 'UNCHARTED':
        return WaypointTraitSymbolInner.uncharted;
      case 'MARKETPLACE':
        return WaypointTraitSymbolInner.marketplace;
      case 'SHIPYARD':
        return WaypointTraitSymbolInner.shipyard;
      case 'OUTPOST':
        return WaypointTraitSymbolInner.outpost;
      case 'SCATTERED_SETTLEMENTS':
        return WaypointTraitSymbolInner.scatteredSettlements;
      case 'SPRAWLING_CITIES':
        return WaypointTraitSymbolInner.sprawlingCities;
      case 'MEGA_STRUCTURES':
        return WaypointTraitSymbolInner.megaStructures;
      case 'OVERCROWDED':
        return WaypointTraitSymbolInner.overcrowded;
      case 'HIGH_TECH':
        return WaypointTraitSymbolInner.highTech;
      case 'CORRUPT':
        return WaypointTraitSymbolInner.corrupt;
      case 'BUREAUCRATIC':
        return WaypointTraitSymbolInner.bureaucratic;
      case 'TRADING_HUB':
        return WaypointTraitSymbolInner.tradingHub;
      case 'INDUSTRIAL':
        return WaypointTraitSymbolInner.industrial;
      case 'BLACK_MARKET':
        return WaypointTraitSymbolInner.blackMarket;
      case 'RESEARCH_FACILITY':
        return WaypointTraitSymbolInner.researchFacility;
      case 'MILITARY_BASE':
        return WaypointTraitSymbolInner.militaryBase;
      case 'SURVEILLANCE_OUTPOST':
        return WaypointTraitSymbolInner.surveillanceOutpost;
      case 'EXPLORATION_OUTPOST':
        return WaypointTraitSymbolInner.explorationOutpost;
      case 'MINERAL_DEPOSITS':
        return WaypointTraitSymbolInner.mineralDeposits;
      case 'COMMON_METAL_DEPOSITS':
        return WaypointTraitSymbolInner.commonMetalDeposits;
      case 'PRECIOUS_METAL_DEPOSITS':
        return WaypointTraitSymbolInner.preciousMetalDeposits;
      case 'RARE_METAL_DEPOSITS':
        return WaypointTraitSymbolInner.rareMetalDeposits;
      case 'METHANE_POOLS':
        return WaypointTraitSymbolInner.methanePools;
      case 'ICE_CRYSTALS':
        return WaypointTraitSymbolInner.iceCrystals;
      case 'EXPLOSIVE_GASES':
        return WaypointTraitSymbolInner.explosiveGases;
      case 'STRONG_MAGNETOSPHERE':
        return WaypointTraitSymbolInner.strongMagnetosphere;
      case 'VIBRANT_AURORAS':
        return WaypointTraitSymbolInner.vibrantAuroras;
      case 'SALT_FLATS':
        return WaypointTraitSymbolInner.saltFlats;
      case 'CANYONS':
        return WaypointTraitSymbolInner.canyons;
      case 'PERPETUAL_DAYLIGHT':
        return WaypointTraitSymbolInner.perpetualDaylight;
      case 'PERPETUAL_OVERCAST':
        return WaypointTraitSymbolInner.perpetualOvercast;
      case 'DRY_SEABEDS':
        return WaypointTraitSymbolInner.drySeabeds;
      case 'MAGMA_SEAS':
        return WaypointTraitSymbolInner.magmaSeas;
      case 'SUPERVOLCANOES':
        return WaypointTraitSymbolInner.supervolcanoes;
      case 'ASH_CLOUDS':
        return WaypointTraitSymbolInner.ashClouds;
      case 'VAST_RUINS':
        return WaypointTraitSymbolInner.vastRuins;
      case 'MUTATED_FLORA':
        return WaypointTraitSymbolInner.mutatedFlora;
      case 'TERRAFORMED':
        return WaypointTraitSymbolInner.terraformed;
      case 'EXTREME_TEMPERATURES':
        return WaypointTraitSymbolInner.extremeTemperatures;
      case 'EXTREME_PRESSURE':
        return WaypointTraitSymbolInner.extremePressure;
      case 'DIVERSE_LIFE':
        return WaypointTraitSymbolInner.diverseLife;
      case 'SCARCE_LIFE':
        return WaypointTraitSymbolInner.scarceLife;
      case 'FOSSILS':
        return WaypointTraitSymbolInner.fossils;
      case 'WEAK_GRAVITY':
        return WaypointTraitSymbolInner.weakGravity;
      case 'STRONG_GRAVITY':
        return WaypointTraitSymbolInner.strongGravity;
      case 'CRUSHING_GRAVITY':
        return WaypointTraitSymbolInner.crushingGravity;
      case 'TOXIC_ATMOSPHERE':
        return WaypointTraitSymbolInner.toxicAtmosphere;
      case 'CORROSIVE_ATMOSPHERE':
        return WaypointTraitSymbolInner.corrosiveAtmosphere;
      case 'BREATHABLE_ATMOSPHERE':
        return WaypointTraitSymbolInner.breathableAtmosphere;
      case 'JOVIAN':
        return WaypointTraitSymbolInner.jovian;
      case 'ROCKY':
        return WaypointTraitSymbolInner.rocky;
      case 'VOLCANIC':
        return WaypointTraitSymbolInner.volcanic;
      case 'FROZEN':
        return WaypointTraitSymbolInner.frozen;
      case 'SWAMP':
        return WaypointTraitSymbolInner.swamp;
      case 'BARREN':
        return WaypointTraitSymbolInner.barren;
      case 'TEMPERATE':
        return WaypointTraitSymbolInner.temperate;
      case 'JUNGLE':
        return WaypointTraitSymbolInner.jungle;
      case 'OCEAN':
        return WaypointTraitSymbolInner.ocean;
      case 'STRIPPED':
        return WaypointTraitSymbolInner.stripped;
      default:
        throw Exception('Unknown WaypointTraitSymbolInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case WaypointTraitSymbolInner.uncharted:
        return 'UNCHARTED';
      case WaypointTraitSymbolInner.marketplace:
        return 'MARKETPLACE';
      case WaypointTraitSymbolInner.shipyard:
        return 'SHIPYARD';
      case WaypointTraitSymbolInner.outpost:
        return 'OUTPOST';
      case WaypointTraitSymbolInner.scatteredSettlements:
        return 'SCATTERED_SETTLEMENTS';
      case WaypointTraitSymbolInner.sprawlingCities:
        return 'SPRAWLING_CITIES';
      case WaypointTraitSymbolInner.megaStructures:
        return 'MEGA_STRUCTURES';
      case WaypointTraitSymbolInner.overcrowded:
        return 'OVERCROWDED';
      case WaypointTraitSymbolInner.highTech:
        return 'HIGH_TECH';
      case WaypointTraitSymbolInner.corrupt:
        return 'CORRUPT';
      case WaypointTraitSymbolInner.bureaucratic:
        return 'BUREAUCRATIC';
      case WaypointTraitSymbolInner.tradingHub:
        return 'TRADING_HUB';
      case WaypointTraitSymbolInner.industrial:
        return 'INDUSTRIAL';
      case WaypointTraitSymbolInner.blackMarket:
        return 'BLACK_MARKET';
      case WaypointTraitSymbolInner.researchFacility:
        return 'RESEARCH_FACILITY';
      case WaypointTraitSymbolInner.militaryBase:
        return 'MILITARY_BASE';
      case WaypointTraitSymbolInner.surveillanceOutpost:
        return 'SURVEILLANCE_OUTPOST';
      case WaypointTraitSymbolInner.explorationOutpost:
        return 'EXPLORATION_OUTPOST';
      case WaypointTraitSymbolInner.mineralDeposits:
        return 'MINERAL_DEPOSITS';
      case WaypointTraitSymbolInner.commonMetalDeposits:
        return 'COMMON_METAL_DEPOSITS';
      case WaypointTraitSymbolInner.preciousMetalDeposits:
        return 'PRECIOUS_METAL_DEPOSITS';
      case WaypointTraitSymbolInner.rareMetalDeposits:
        return 'RARE_METAL_DEPOSITS';
      case WaypointTraitSymbolInner.methanePools:
        return 'METHANE_POOLS';
      case WaypointTraitSymbolInner.iceCrystals:
        return 'ICE_CRYSTALS';
      case WaypointTraitSymbolInner.explosiveGases:
        return 'EXPLOSIVE_GASES';
      case WaypointTraitSymbolInner.strongMagnetosphere:
        return 'STRONG_MAGNETOSPHERE';
      case WaypointTraitSymbolInner.vibrantAuroras:
        return 'VIBRANT_AURORAS';
      case WaypointTraitSymbolInner.saltFlats:
        return 'SALT_FLATS';
      case WaypointTraitSymbolInner.canyons:
        return 'CANYONS';
      case WaypointTraitSymbolInner.perpetualDaylight:
        return 'PERPETUAL_DAYLIGHT';
      case WaypointTraitSymbolInner.perpetualOvercast:
        return 'PERPETUAL_OVERCAST';
      case WaypointTraitSymbolInner.drySeabeds:
        return 'DRY_SEABEDS';
      case WaypointTraitSymbolInner.magmaSeas:
        return 'MAGMA_SEAS';
      case WaypointTraitSymbolInner.supervolcanoes:
        return 'SUPERVOLCANOES';
      case WaypointTraitSymbolInner.ashClouds:
        return 'ASH_CLOUDS';
      case WaypointTraitSymbolInner.vastRuins:
        return 'VAST_RUINS';
      case WaypointTraitSymbolInner.mutatedFlora:
        return 'MUTATED_FLORA';
      case WaypointTraitSymbolInner.terraformed:
        return 'TERRAFORMED';
      case WaypointTraitSymbolInner.extremeTemperatures:
        return 'EXTREME_TEMPERATURES';
      case WaypointTraitSymbolInner.extremePressure:
        return 'EXTREME_PRESSURE';
      case WaypointTraitSymbolInner.diverseLife:
        return 'DIVERSE_LIFE';
      case WaypointTraitSymbolInner.scarceLife:
        return 'SCARCE_LIFE';
      case WaypointTraitSymbolInner.fossils:
        return 'FOSSILS';
      case WaypointTraitSymbolInner.weakGravity:
        return 'WEAK_GRAVITY';
      case WaypointTraitSymbolInner.strongGravity:
        return 'STRONG_GRAVITY';
      case WaypointTraitSymbolInner.crushingGravity:
        return 'CRUSHING_GRAVITY';
      case WaypointTraitSymbolInner.toxicAtmosphere:
        return 'TOXIC_ATMOSPHERE';
      case WaypointTraitSymbolInner.corrosiveAtmosphere:
        return 'CORROSIVE_ATMOSPHERE';
      case WaypointTraitSymbolInner.breathableAtmosphere:
        return 'BREATHABLE_ATMOSPHERE';
      case WaypointTraitSymbolInner.jovian:
        return 'JOVIAN';
      case WaypointTraitSymbolInner.rocky:
        return 'ROCKY';
      case WaypointTraitSymbolInner.volcanic:
        return 'VOLCANIC';
      case WaypointTraitSymbolInner.frozen:
        return 'FROZEN';
      case WaypointTraitSymbolInner.swamp:
        return 'SWAMP';
      case WaypointTraitSymbolInner.barren:
        return 'BARREN';
      case WaypointTraitSymbolInner.temperate:
        return 'TEMPERATE';
      case WaypointTraitSymbolInner.jungle:
        return 'JUNGLE';
      case WaypointTraitSymbolInner.ocean:
        return 'OCEAN';
      case WaypointTraitSymbolInner.stripped:
        return 'STRIPPED';
    }
  }
}
