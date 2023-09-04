class WaypointTrait {
  WaypointTrait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory WaypointTrait.fromJson(Map<String, dynamic> json) {
    return WaypointTrait(
      symbol: WaypointTraitSymbolString.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final WaypointTraitSymbolString symbol;
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

enum WaypointTraitSymbolString {
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

  const WaypointTraitSymbolString(this.value);

  factory WaypointTraitSymbolString.fromJson(String json) {
    switch (json) {
      case 'UNCHARTED':
        return WaypointTraitSymbolString.uncharted;
      case 'MARKETPLACE':
        return WaypointTraitSymbolString.marketplace;
      case 'SHIPYARD':
        return WaypointTraitSymbolString.shipyard;
      case 'OUTPOST':
        return WaypointTraitSymbolString.outpost;
      case 'SCATTERED_SETTLEMENTS':
        return WaypointTraitSymbolString.scatteredSettlements;
      case 'SPRAWLING_CITIES':
        return WaypointTraitSymbolString.sprawlingCities;
      case 'MEGA_STRUCTURES':
        return WaypointTraitSymbolString.megaStructures;
      case 'OVERCROWDED':
        return WaypointTraitSymbolString.overcrowded;
      case 'HIGH_TECH':
        return WaypointTraitSymbolString.highTech;
      case 'CORRUPT':
        return WaypointTraitSymbolString.corrupt;
      case 'BUREAUCRATIC':
        return WaypointTraitSymbolString.bureaucratic;
      case 'TRADING_HUB':
        return WaypointTraitSymbolString.tradingHub;
      case 'INDUSTRIAL':
        return WaypointTraitSymbolString.industrial;
      case 'BLACK_MARKET':
        return WaypointTraitSymbolString.blackMarket;
      case 'RESEARCH_FACILITY':
        return WaypointTraitSymbolString.researchFacility;
      case 'MILITARY_BASE':
        return WaypointTraitSymbolString.militaryBase;
      case 'SURVEILLANCE_OUTPOST':
        return WaypointTraitSymbolString.surveillanceOutpost;
      case 'EXPLORATION_OUTPOST':
        return WaypointTraitSymbolString.explorationOutpost;
      case 'MINERAL_DEPOSITS':
        return WaypointTraitSymbolString.mineralDeposits;
      case 'COMMON_METAL_DEPOSITS':
        return WaypointTraitSymbolString.commonMetalDeposits;
      case 'PRECIOUS_METAL_DEPOSITS':
        return WaypointTraitSymbolString.preciousMetalDeposits;
      case 'RARE_METAL_DEPOSITS':
        return WaypointTraitSymbolString.rareMetalDeposits;
      case 'METHANE_POOLS':
        return WaypointTraitSymbolString.methanePools;
      case 'ICE_CRYSTALS':
        return WaypointTraitSymbolString.iceCrystals;
      case 'EXPLOSIVE_GASES':
        return WaypointTraitSymbolString.explosiveGases;
      case 'STRONG_MAGNETOSPHERE':
        return WaypointTraitSymbolString.strongMagnetosphere;
      case 'VIBRANT_AURORAS':
        return WaypointTraitSymbolString.vibrantAuroras;
      case 'SALT_FLATS':
        return WaypointTraitSymbolString.saltFlats;
      case 'CANYONS':
        return WaypointTraitSymbolString.canyons;
      case 'PERPETUAL_DAYLIGHT':
        return WaypointTraitSymbolString.perpetualDaylight;
      case 'PERPETUAL_OVERCAST':
        return WaypointTraitSymbolString.perpetualOvercast;
      case 'DRY_SEABEDS':
        return WaypointTraitSymbolString.drySeabeds;
      case 'MAGMA_SEAS':
        return WaypointTraitSymbolString.magmaSeas;
      case 'SUPERVOLCANOES':
        return WaypointTraitSymbolString.supervolcanoes;
      case 'ASH_CLOUDS':
        return WaypointTraitSymbolString.ashClouds;
      case 'VAST_RUINS':
        return WaypointTraitSymbolString.vastRuins;
      case 'MUTATED_FLORA':
        return WaypointTraitSymbolString.mutatedFlora;
      case 'TERRAFORMED':
        return WaypointTraitSymbolString.terraformed;
      case 'EXTREME_TEMPERATURES':
        return WaypointTraitSymbolString.extremeTemperatures;
      case 'EXTREME_PRESSURE':
        return WaypointTraitSymbolString.extremePressure;
      case 'DIVERSE_LIFE':
        return WaypointTraitSymbolString.diverseLife;
      case 'SCARCE_LIFE':
        return WaypointTraitSymbolString.scarceLife;
      case 'FOSSILS':
        return WaypointTraitSymbolString.fossils;
      case 'WEAK_GRAVITY':
        return WaypointTraitSymbolString.weakGravity;
      case 'STRONG_GRAVITY':
        return WaypointTraitSymbolString.strongGravity;
      case 'CRUSHING_GRAVITY':
        return WaypointTraitSymbolString.crushingGravity;
      case 'TOXIC_ATMOSPHERE':
        return WaypointTraitSymbolString.toxicAtmosphere;
      case 'CORROSIVE_ATMOSPHERE':
        return WaypointTraitSymbolString.corrosiveAtmosphere;
      case 'BREATHABLE_ATMOSPHERE':
        return WaypointTraitSymbolString.breathableAtmosphere;
      case 'JOVIAN':
        return WaypointTraitSymbolString.jovian;
      case 'ROCKY':
        return WaypointTraitSymbolString.rocky;
      case 'VOLCANIC':
        return WaypointTraitSymbolString.volcanic;
      case 'FROZEN':
        return WaypointTraitSymbolString.frozen;
      case 'SWAMP':
        return WaypointTraitSymbolString.swamp;
      case 'BARREN':
        return WaypointTraitSymbolString.barren;
      case 'TEMPERATE':
        return WaypointTraitSymbolString.temperate;
      case 'JUNGLE':
        return WaypointTraitSymbolString.jungle;
      case 'OCEAN':
        return WaypointTraitSymbolString.ocean;
      case 'STRIPPED':
        return WaypointTraitSymbolString.stripped;
      default:
        throw Exception('Unknown WaypointTraitSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case WaypointTraitSymbolString.uncharted:
        return 'UNCHARTED';
      case WaypointTraitSymbolString.marketplace:
        return 'MARKETPLACE';
      case WaypointTraitSymbolString.shipyard:
        return 'SHIPYARD';
      case WaypointTraitSymbolString.outpost:
        return 'OUTPOST';
      case WaypointTraitSymbolString.scatteredSettlements:
        return 'SCATTERED_SETTLEMENTS';
      case WaypointTraitSymbolString.sprawlingCities:
        return 'SPRAWLING_CITIES';
      case WaypointTraitSymbolString.megaStructures:
        return 'MEGA_STRUCTURES';
      case WaypointTraitSymbolString.overcrowded:
        return 'OVERCROWDED';
      case WaypointTraitSymbolString.highTech:
        return 'HIGH_TECH';
      case WaypointTraitSymbolString.corrupt:
        return 'CORRUPT';
      case WaypointTraitSymbolString.bureaucratic:
        return 'BUREAUCRATIC';
      case WaypointTraitSymbolString.tradingHub:
        return 'TRADING_HUB';
      case WaypointTraitSymbolString.industrial:
        return 'INDUSTRIAL';
      case WaypointTraitSymbolString.blackMarket:
        return 'BLACK_MARKET';
      case WaypointTraitSymbolString.researchFacility:
        return 'RESEARCH_FACILITY';
      case WaypointTraitSymbolString.militaryBase:
        return 'MILITARY_BASE';
      case WaypointTraitSymbolString.surveillanceOutpost:
        return 'SURVEILLANCE_OUTPOST';
      case WaypointTraitSymbolString.explorationOutpost:
        return 'EXPLORATION_OUTPOST';
      case WaypointTraitSymbolString.mineralDeposits:
        return 'MINERAL_DEPOSITS';
      case WaypointTraitSymbolString.commonMetalDeposits:
        return 'COMMON_METAL_DEPOSITS';
      case WaypointTraitSymbolString.preciousMetalDeposits:
        return 'PRECIOUS_METAL_DEPOSITS';
      case WaypointTraitSymbolString.rareMetalDeposits:
        return 'RARE_METAL_DEPOSITS';
      case WaypointTraitSymbolString.methanePools:
        return 'METHANE_POOLS';
      case WaypointTraitSymbolString.iceCrystals:
        return 'ICE_CRYSTALS';
      case WaypointTraitSymbolString.explosiveGases:
        return 'EXPLOSIVE_GASES';
      case WaypointTraitSymbolString.strongMagnetosphere:
        return 'STRONG_MAGNETOSPHERE';
      case WaypointTraitSymbolString.vibrantAuroras:
        return 'VIBRANT_AURORAS';
      case WaypointTraitSymbolString.saltFlats:
        return 'SALT_FLATS';
      case WaypointTraitSymbolString.canyons:
        return 'CANYONS';
      case WaypointTraitSymbolString.perpetualDaylight:
        return 'PERPETUAL_DAYLIGHT';
      case WaypointTraitSymbolString.perpetualOvercast:
        return 'PERPETUAL_OVERCAST';
      case WaypointTraitSymbolString.drySeabeds:
        return 'DRY_SEABEDS';
      case WaypointTraitSymbolString.magmaSeas:
        return 'MAGMA_SEAS';
      case WaypointTraitSymbolString.supervolcanoes:
        return 'SUPERVOLCANOES';
      case WaypointTraitSymbolString.ashClouds:
        return 'ASH_CLOUDS';
      case WaypointTraitSymbolString.vastRuins:
        return 'VAST_RUINS';
      case WaypointTraitSymbolString.mutatedFlora:
        return 'MUTATED_FLORA';
      case WaypointTraitSymbolString.terraformed:
        return 'TERRAFORMED';
      case WaypointTraitSymbolString.extremeTemperatures:
        return 'EXTREME_TEMPERATURES';
      case WaypointTraitSymbolString.extremePressure:
        return 'EXTREME_PRESSURE';
      case WaypointTraitSymbolString.diverseLife:
        return 'DIVERSE_LIFE';
      case WaypointTraitSymbolString.scarceLife:
        return 'SCARCE_LIFE';
      case WaypointTraitSymbolString.fossils:
        return 'FOSSILS';
      case WaypointTraitSymbolString.weakGravity:
        return 'WEAK_GRAVITY';
      case WaypointTraitSymbolString.strongGravity:
        return 'STRONG_GRAVITY';
      case WaypointTraitSymbolString.crushingGravity:
        return 'CRUSHING_GRAVITY';
      case WaypointTraitSymbolString.toxicAtmosphere:
        return 'TOXIC_ATMOSPHERE';
      case WaypointTraitSymbolString.corrosiveAtmosphere:
        return 'CORROSIVE_ATMOSPHERE';
      case WaypointTraitSymbolString.breathableAtmosphere:
        return 'BREATHABLE_ATMOSPHERE';
      case WaypointTraitSymbolString.jovian:
        return 'JOVIAN';
      case WaypointTraitSymbolString.rocky:
        return 'ROCKY';
      case WaypointTraitSymbolString.volcanic:
        return 'VOLCANIC';
      case WaypointTraitSymbolString.frozen:
        return 'FROZEN';
      case WaypointTraitSymbolString.swamp:
        return 'SWAMP';
      case WaypointTraitSymbolString.barren:
        return 'BARREN';
      case WaypointTraitSymbolString.temperate:
        return 'TEMPERATE';
      case WaypointTraitSymbolString.jungle:
        return 'JUNGLE';
      case WaypointTraitSymbolString.ocean:
        return 'OCEAN';
      case WaypointTraitSymbolString.stripped:
        return 'STRIPPED';
    }
  }
}
