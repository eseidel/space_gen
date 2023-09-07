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
    return WaypointTraitSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown WaypointTraitSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
