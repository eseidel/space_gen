enum TradeSymbol {
  preciousStones('PRECIOUS_STONES'),
  quartzSand('QUARTZ_SAND'),
  siliconCrystals('SILICON_CRYSTALS'),
  ammoniaIce('AMMONIA_ICE'),
  liquidHydrogen('LIQUID_HYDROGEN'),
  liquidNitrogen('LIQUID_NITROGEN'),
  iceWater('ICE_WATER'),
  exoticMatter('EXOTIC_MATTER'),
  advancedCircuitry('ADVANCED_CIRCUITRY'),
  gravitonEmitters('GRAVITON_EMITTERS'),
  iron('IRON'),
  ironOre('IRON_ORE'),
  copper('COPPER'),
  copperOre('COPPER_ORE'),
  aluminum('ALUMINUM'),
  aluminumOre('ALUMINUM_ORE'),
  silver('SILVER'),
  silverOre('SILVER_ORE'),
  gold('GOLD'),
  goldOre('GOLD_ORE'),
  platinum('PLATINUM'),
  platinumOre('PLATINUM_ORE'),
  diamonds('DIAMONDS'),
  uranite('URANITE'),
  uraniteOre('URANITE_ORE'),
  meritium('MERITIUM'),
  meritiumOre('MERITIUM_ORE'),
  hydrocarbon('HYDROCARBON'),
  antimatter('ANTIMATTER'),
  fertilizers('FERTILIZERS'),
  fabrics('FABRICS'),
  food('FOOD'),
  jewelry('JEWELRY'),
  machinery('MACHINERY'),
  firearms('FIREARMS'),
  assaultRifles('ASSAULT_RIFLES'),
  militaryEquipment('MILITARY_EQUIPMENT'),
  explosives('EXPLOSIVES'),
  labInstruments('LAB_INSTRUMENTS'),
  ammunition('AMMUNITION'),
  electronics('ELECTRONICS'),
  shipPlating('SHIP_PLATING'),
  equipment('EQUIPMENT'),
  fuel('FUEL'),
  medicine('MEDICINE'),
  drugs('DRUGS'),
  clothing('CLOTHING'),
  microprocessors('MICROPROCESSORS'),
  plastics('PLASTICS'),
  polynucleotides('POLYNUCLEOTIDES'),
  biocomposites('BIOCOMPOSITES'),
  nanobots('NANOBOTS'),
  aiMainframes('AI_MAINFRAMES'),
  quantumDrives('QUANTUM_DRIVES'),
  roboticDrones('ROBOTIC_DRONES'),
  cyberImplants('CYBER_IMPLANTS'),
  geneTherapeutics('GENE_THERAPEUTICS'),
  neuralChips('NEURAL_CHIPS'),
  moodRegulators('MOOD_REGULATORS'),
  viralAgents('VIRAL_AGENTS'),
  microFusionGenerators('MICRO_FUSION_GENERATORS'),
  supergrains('SUPERGRAINS'),
  laserRifles('LASER_RIFLES'),
  holographics('HOLOGRAPHICS'),
  shipSalvage('SHIP_SALVAGE'),
  relicTech('RELIC_TECH'),
  novelLifeforms('NOVEL_LIFEFORMS'),
  botanicalSpecimens('BOTANICAL_SPECIMENS'),
  culturalArtifacts('CULTURAL_ARTIFACTS'),
  reactorSolarI('REACTOR_SOLAR_I'),
  reactorFusionI('REACTOR_FUSION_I'),
  reactorFissionI('REACTOR_FISSION_I'),
  reactorChemicalI('REACTOR_CHEMICAL_I'),
  reactorAntimatterI('REACTOR_ANTIMATTER_I'),
  engineImpulseDriveI('ENGINE_IMPULSE_DRIVE_I'),
  engineIonDriveI('ENGINE_ION_DRIVE_I'),
  engineIonDriveIi('ENGINE_ION_DRIVE_II'),
  engineHyperDriveI('ENGINE_HYPER_DRIVE_I'),
  moduleMineralProcessorI('MODULE_MINERAL_PROCESSOR_I'),
  moduleCargoHoldI('MODULE_CARGO_HOLD_I'),
  moduleCrewQuartersI('MODULE_CREW_QUARTERS_I'),
  moduleEnvoyQuartersI('MODULE_ENVOY_QUARTERS_I'),
  modulePassengerCabinI('MODULE_PASSENGER_CABIN_I'),
  moduleMicroRefineryI('MODULE_MICRO_REFINERY_I'),
  moduleOreRefineryI('MODULE_ORE_REFINERY_I'),
  moduleFuelRefineryI('MODULE_FUEL_REFINERY_I'),
  moduleScienceLabI('MODULE_SCIENCE_LAB_I'),
  moduleJumpDriveI('MODULE_JUMP_DRIVE_I'),
  moduleJumpDriveIi('MODULE_JUMP_DRIVE_II'),
  moduleJumpDriveIii('MODULE_JUMP_DRIVE_III'),
  moduleWarpDriveI('MODULE_WARP_DRIVE_I'),
  moduleWarpDriveIi('MODULE_WARP_DRIVE_II'),
  moduleWarpDriveIii('MODULE_WARP_DRIVE_III'),
  moduleShieldGeneratorI('MODULE_SHIELD_GENERATOR_I'),
  moduleShieldGeneratorIi('MODULE_SHIELD_GENERATOR_II'),
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

  const TradeSymbol(this.value);

  factory TradeSymbol.fromJson(String json) {
    switch (json) {
      case 'PRECIOUS_STONES':
        return TradeSymbol.preciousStones;
      case 'QUARTZ_SAND':
        return TradeSymbol.quartzSand;
      case 'SILICON_CRYSTALS':
        return TradeSymbol.siliconCrystals;
      case 'AMMONIA_ICE':
        return TradeSymbol.ammoniaIce;
      case 'LIQUID_HYDROGEN':
        return TradeSymbol.liquidHydrogen;
      case 'LIQUID_NITROGEN':
        return TradeSymbol.liquidNitrogen;
      case 'ICE_WATER':
        return TradeSymbol.iceWater;
      case 'EXOTIC_MATTER':
        return TradeSymbol.exoticMatter;
      case 'ADVANCED_CIRCUITRY':
        return TradeSymbol.advancedCircuitry;
      case 'GRAVITON_EMITTERS':
        return TradeSymbol.gravitonEmitters;
      case 'IRON':
        return TradeSymbol.iron;
      case 'IRON_ORE':
        return TradeSymbol.ironOre;
      case 'COPPER':
        return TradeSymbol.copper;
      case 'COPPER_ORE':
        return TradeSymbol.copperOre;
      case 'ALUMINUM':
        return TradeSymbol.aluminum;
      case 'ALUMINUM_ORE':
        return TradeSymbol.aluminumOre;
      case 'SILVER':
        return TradeSymbol.silver;
      case 'SILVER_ORE':
        return TradeSymbol.silverOre;
      case 'GOLD':
        return TradeSymbol.gold;
      case 'GOLD_ORE':
        return TradeSymbol.goldOre;
      case 'PLATINUM':
        return TradeSymbol.platinum;
      case 'PLATINUM_ORE':
        return TradeSymbol.platinumOre;
      case 'DIAMONDS':
        return TradeSymbol.diamonds;
      case 'URANITE':
        return TradeSymbol.uranite;
      case 'URANITE_ORE':
        return TradeSymbol.uraniteOre;
      case 'MERITIUM':
        return TradeSymbol.meritium;
      case 'MERITIUM_ORE':
        return TradeSymbol.meritiumOre;
      case 'HYDROCARBON':
        return TradeSymbol.hydrocarbon;
      case 'ANTIMATTER':
        return TradeSymbol.antimatter;
      case 'FERTILIZERS':
        return TradeSymbol.fertilizers;
      case 'FABRICS':
        return TradeSymbol.fabrics;
      case 'FOOD':
        return TradeSymbol.food;
      case 'JEWELRY':
        return TradeSymbol.jewelry;
      case 'MACHINERY':
        return TradeSymbol.machinery;
      case 'FIREARMS':
        return TradeSymbol.firearms;
      case 'ASSAULT_RIFLES':
        return TradeSymbol.assaultRifles;
      case 'MILITARY_EQUIPMENT':
        return TradeSymbol.militaryEquipment;
      case 'EXPLOSIVES':
        return TradeSymbol.explosives;
      case 'LAB_INSTRUMENTS':
        return TradeSymbol.labInstruments;
      case 'AMMUNITION':
        return TradeSymbol.ammunition;
      case 'ELECTRONICS':
        return TradeSymbol.electronics;
      case 'SHIP_PLATING':
        return TradeSymbol.shipPlating;
      case 'EQUIPMENT':
        return TradeSymbol.equipment;
      case 'FUEL':
        return TradeSymbol.fuel;
      case 'MEDICINE':
        return TradeSymbol.medicine;
      case 'DRUGS':
        return TradeSymbol.drugs;
      case 'CLOTHING':
        return TradeSymbol.clothing;
      case 'MICROPROCESSORS':
        return TradeSymbol.microprocessors;
      case 'PLASTICS':
        return TradeSymbol.plastics;
      case 'POLYNUCLEOTIDES':
        return TradeSymbol.polynucleotides;
      case 'BIOCOMPOSITES':
        return TradeSymbol.biocomposites;
      case 'NANOBOTS':
        return TradeSymbol.nanobots;
      case 'AI_MAINFRAMES':
        return TradeSymbol.aiMainframes;
      case 'QUANTUM_DRIVES':
        return TradeSymbol.quantumDrives;
      case 'ROBOTIC_DRONES':
        return TradeSymbol.roboticDrones;
      case 'CYBER_IMPLANTS':
        return TradeSymbol.cyberImplants;
      case 'GENE_THERAPEUTICS':
        return TradeSymbol.geneTherapeutics;
      case 'NEURAL_CHIPS':
        return TradeSymbol.neuralChips;
      case 'MOOD_REGULATORS':
        return TradeSymbol.moodRegulators;
      case 'VIRAL_AGENTS':
        return TradeSymbol.viralAgents;
      case 'MICRO_FUSION_GENERATORS':
        return TradeSymbol.microFusionGenerators;
      case 'SUPERGRAINS':
        return TradeSymbol.supergrains;
      case 'LASER_RIFLES':
        return TradeSymbol.laserRifles;
      case 'HOLOGRAPHICS':
        return TradeSymbol.holographics;
      case 'SHIP_SALVAGE':
        return TradeSymbol.shipSalvage;
      case 'RELIC_TECH':
        return TradeSymbol.relicTech;
      case 'NOVEL_LIFEFORMS':
        return TradeSymbol.novelLifeforms;
      case 'BOTANICAL_SPECIMENS':
        return TradeSymbol.botanicalSpecimens;
      case 'CULTURAL_ARTIFACTS':
        return TradeSymbol.culturalArtifacts;
      case 'REACTOR_SOLAR_I':
        return TradeSymbol.reactorSolarI;
      case 'REACTOR_FUSION_I':
        return TradeSymbol.reactorFusionI;
      case 'REACTOR_FISSION_I':
        return TradeSymbol.reactorFissionI;
      case 'REACTOR_CHEMICAL_I':
        return TradeSymbol.reactorChemicalI;
      case 'REACTOR_ANTIMATTER_I':
        return TradeSymbol.reactorAntimatterI;
      case 'ENGINE_IMPULSE_DRIVE_I':
        return TradeSymbol.engineImpulseDriveI;
      case 'ENGINE_ION_DRIVE_I':
        return TradeSymbol.engineIonDriveI;
      case 'ENGINE_ION_DRIVE_II':
        return TradeSymbol.engineIonDriveIi;
      case 'ENGINE_HYPER_DRIVE_I':
        return TradeSymbol.engineHyperDriveI;
      case 'MODULE_MINERAL_PROCESSOR_I':
        return TradeSymbol.moduleMineralProcessorI;
      case 'MODULE_CARGO_HOLD_I':
        return TradeSymbol.moduleCargoHoldI;
      case 'MODULE_CREW_QUARTERS_I':
        return TradeSymbol.moduleCrewQuartersI;
      case 'MODULE_ENVOY_QUARTERS_I':
        return TradeSymbol.moduleEnvoyQuartersI;
      case 'MODULE_PASSENGER_CABIN_I':
        return TradeSymbol.modulePassengerCabinI;
      case 'MODULE_MICRO_REFINERY_I':
        return TradeSymbol.moduleMicroRefineryI;
      case 'MODULE_ORE_REFINERY_I':
        return TradeSymbol.moduleOreRefineryI;
      case 'MODULE_FUEL_REFINERY_I':
        return TradeSymbol.moduleFuelRefineryI;
      case 'MODULE_SCIENCE_LAB_I':
        return TradeSymbol.moduleScienceLabI;
      case 'MODULE_JUMP_DRIVE_I':
        return TradeSymbol.moduleJumpDriveI;
      case 'MODULE_JUMP_DRIVE_II':
        return TradeSymbol.moduleJumpDriveIi;
      case 'MODULE_JUMP_DRIVE_III':
        return TradeSymbol.moduleJumpDriveIii;
      case 'MODULE_WARP_DRIVE_I':
        return TradeSymbol.moduleWarpDriveI;
      case 'MODULE_WARP_DRIVE_II':
        return TradeSymbol.moduleWarpDriveIi;
      case 'MODULE_WARP_DRIVE_III':
        return TradeSymbol.moduleWarpDriveIii;
      case 'MODULE_SHIELD_GENERATOR_I':
        return TradeSymbol.moduleShieldGeneratorI;
      case 'MODULE_SHIELD_GENERATOR_II':
        return TradeSymbol.moduleShieldGeneratorIi;
      case 'MOUNT_GAS_SIPHON_I':
        return TradeSymbol.mountGasSiphonI;
      case 'MOUNT_GAS_SIPHON_II':
        return TradeSymbol.mountGasSiphonIi;
      case 'MOUNT_GAS_SIPHON_III':
        return TradeSymbol.mountGasSiphonIii;
      case 'MOUNT_SURVEYOR_I':
        return TradeSymbol.mountSurveyorI;
      case 'MOUNT_SURVEYOR_II':
        return TradeSymbol.mountSurveyorIi;
      case 'MOUNT_SURVEYOR_III':
        return TradeSymbol.mountSurveyorIii;
      case 'MOUNT_SENSOR_ARRAY_I':
        return TradeSymbol.mountSensorArrayI;
      case 'MOUNT_SENSOR_ARRAY_II':
        return TradeSymbol.mountSensorArrayIi;
      case 'MOUNT_SENSOR_ARRAY_III':
        return TradeSymbol.mountSensorArrayIii;
      case 'MOUNT_MINING_LASER_I':
        return TradeSymbol.mountMiningLaserI;
      case 'MOUNT_MINING_LASER_II':
        return TradeSymbol.mountMiningLaserIi;
      case 'MOUNT_MINING_LASER_III':
        return TradeSymbol.mountMiningLaserIii;
      case 'MOUNT_LASER_CANNON_I':
        return TradeSymbol.mountLaserCannonI;
      case 'MOUNT_MISSILE_LAUNCHER_I':
        return TradeSymbol.mountMissileLauncherI;
      case 'MOUNT_TURRET_I':
        return TradeSymbol.mountTurretI;
      default:
        throw Exception('Unknown TradeSymbol value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case TradeSymbol.preciousStones:
        return 'PRECIOUS_STONES';
      case TradeSymbol.quartzSand:
        return 'QUARTZ_SAND';
      case TradeSymbol.siliconCrystals:
        return 'SILICON_CRYSTALS';
      case TradeSymbol.ammoniaIce:
        return 'AMMONIA_ICE';
      case TradeSymbol.liquidHydrogen:
        return 'LIQUID_HYDROGEN';
      case TradeSymbol.liquidNitrogen:
        return 'LIQUID_NITROGEN';
      case TradeSymbol.iceWater:
        return 'ICE_WATER';
      case TradeSymbol.exoticMatter:
        return 'EXOTIC_MATTER';
      case TradeSymbol.advancedCircuitry:
        return 'ADVANCED_CIRCUITRY';
      case TradeSymbol.gravitonEmitters:
        return 'GRAVITON_EMITTERS';
      case TradeSymbol.iron:
        return 'IRON';
      case TradeSymbol.ironOre:
        return 'IRON_ORE';
      case TradeSymbol.copper:
        return 'COPPER';
      case TradeSymbol.copperOre:
        return 'COPPER_ORE';
      case TradeSymbol.aluminum:
        return 'ALUMINUM';
      case TradeSymbol.aluminumOre:
        return 'ALUMINUM_ORE';
      case TradeSymbol.silver:
        return 'SILVER';
      case TradeSymbol.silverOre:
        return 'SILVER_ORE';
      case TradeSymbol.gold:
        return 'GOLD';
      case TradeSymbol.goldOre:
        return 'GOLD_ORE';
      case TradeSymbol.platinum:
        return 'PLATINUM';
      case TradeSymbol.platinumOre:
        return 'PLATINUM_ORE';
      case TradeSymbol.diamonds:
        return 'DIAMONDS';
      case TradeSymbol.uranite:
        return 'URANITE';
      case TradeSymbol.uraniteOre:
        return 'URANITE_ORE';
      case TradeSymbol.meritium:
        return 'MERITIUM';
      case TradeSymbol.meritiumOre:
        return 'MERITIUM_ORE';
      case TradeSymbol.hydrocarbon:
        return 'HYDROCARBON';
      case TradeSymbol.antimatter:
        return 'ANTIMATTER';
      case TradeSymbol.fertilizers:
        return 'FERTILIZERS';
      case TradeSymbol.fabrics:
        return 'FABRICS';
      case TradeSymbol.food:
        return 'FOOD';
      case TradeSymbol.jewelry:
        return 'JEWELRY';
      case TradeSymbol.machinery:
        return 'MACHINERY';
      case TradeSymbol.firearms:
        return 'FIREARMS';
      case TradeSymbol.assaultRifles:
        return 'ASSAULT_RIFLES';
      case TradeSymbol.militaryEquipment:
        return 'MILITARY_EQUIPMENT';
      case TradeSymbol.explosives:
        return 'EXPLOSIVES';
      case TradeSymbol.labInstruments:
        return 'LAB_INSTRUMENTS';
      case TradeSymbol.ammunition:
        return 'AMMUNITION';
      case TradeSymbol.electronics:
        return 'ELECTRONICS';
      case TradeSymbol.shipPlating:
        return 'SHIP_PLATING';
      case TradeSymbol.equipment:
        return 'EQUIPMENT';
      case TradeSymbol.fuel:
        return 'FUEL';
      case TradeSymbol.medicine:
        return 'MEDICINE';
      case TradeSymbol.drugs:
        return 'DRUGS';
      case TradeSymbol.clothing:
        return 'CLOTHING';
      case TradeSymbol.microprocessors:
        return 'MICROPROCESSORS';
      case TradeSymbol.plastics:
        return 'PLASTICS';
      case TradeSymbol.polynucleotides:
        return 'POLYNUCLEOTIDES';
      case TradeSymbol.biocomposites:
        return 'BIOCOMPOSITES';
      case TradeSymbol.nanobots:
        return 'NANOBOTS';
      case TradeSymbol.aiMainframes:
        return 'AI_MAINFRAMES';
      case TradeSymbol.quantumDrives:
        return 'QUANTUM_DRIVES';
      case TradeSymbol.roboticDrones:
        return 'ROBOTIC_DRONES';
      case TradeSymbol.cyberImplants:
        return 'CYBER_IMPLANTS';
      case TradeSymbol.geneTherapeutics:
        return 'GENE_THERAPEUTICS';
      case TradeSymbol.neuralChips:
        return 'NEURAL_CHIPS';
      case TradeSymbol.moodRegulators:
        return 'MOOD_REGULATORS';
      case TradeSymbol.viralAgents:
        return 'VIRAL_AGENTS';
      case TradeSymbol.microFusionGenerators:
        return 'MICRO_FUSION_GENERATORS';
      case TradeSymbol.supergrains:
        return 'SUPERGRAINS';
      case TradeSymbol.laserRifles:
        return 'LASER_RIFLES';
      case TradeSymbol.holographics:
        return 'HOLOGRAPHICS';
      case TradeSymbol.shipSalvage:
        return 'SHIP_SALVAGE';
      case TradeSymbol.relicTech:
        return 'RELIC_TECH';
      case TradeSymbol.novelLifeforms:
        return 'NOVEL_LIFEFORMS';
      case TradeSymbol.botanicalSpecimens:
        return 'BOTANICAL_SPECIMENS';
      case TradeSymbol.culturalArtifacts:
        return 'CULTURAL_ARTIFACTS';
      case TradeSymbol.reactorSolarI:
        return 'REACTOR_SOLAR_I';
      case TradeSymbol.reactorFusionI:
        return 'REACTOR_FUSION_I';
      case TradeSymbol.reactorFissionI:
        return 'REACTOR_FISSION_I';
      case TradeSymbol.reactorChemicalI:
        return 'REACTOR_CHEMICAL_I';
      case TradeSymbol.reactorAntimatterI:
        return 'REACTOR_ANTIMATTER_I';
      case TradeSymbol.engineImpulseDriveI:
        return 'ENGINE_IMPULSE_DRIVE_I';
      case TradeSymbol.engineIonDriveI:
        return 'ENGINE_ION_DRIVE_I';
      case TradeSymbol.engineIonDriveIi:
        return 'ENGINE_ION_DRIVE_II';
      case TradeSymbol.engineHyperDriveI:
        return 'ENGINE_HYPER_DRIVE_I';
      case TradeSymbol.moduleMineralProcessorI:
        return 'MODULE_MINERAL_PROCESSOR_I';
      case TradeSymbol.moduleCargoHoldI:
        return 'MODULE_CARGO_HOLD_I';
      case TradeSymbol.moduleCrewQuartersI:
        return 'MODULE_CREW_QUARTERS_I';
      case TradeSymbol.moduleEnvoyQuartersI:
        return 'MODULE_ENVOY_QUARTERS_I';
      case TradeSymbol.modulePassengerCabinI:
        return 'MODULE_PASSENGER_CABIN_I';
      case TradeSymbol.moduleMicroRefineryI:
        return 'MODULE_MICRO_REFINERY_I';
      case TradeSymbol.moduleOreRefineryI:
        return 'MODULE_ORE_REFINERY_I';
      case TradeSymbol.moduleFuelRefineryI:
        return 'MODULE_FUEL_REFINERY_I';
      case TradeSymbol.moduleScienceLabI:
        return 'MODULE_SCIENCE_LAB_I';
      case TradeSymbol.moduleJumpDriveI:
        return 'MODULE_JUMP_DRIVE_I';
      case TradeSymbol.moduleJumpDriveIi:
        return 'MODULE_JUMP_DRIVE_II';
      case TradeSymbol.moduleJumpDriveIii:
        return 'MODULE_JUMP_DRIVE_III';
      case TradeSymbol.moduleWarpDriveI:
        return 'MODULE_WARP_DRIVE_I';
      case TradeSymbol.moduleWarpDriveIi:
        return 'MODULE_WARP_DRIVE_II';
      case TradeSymbol.moduleWarpDriveIii:
        return 'MODULE_WARP_DRIVE_III';
      case TradeSymbol.moduleShieldGeneratorI:
        return 'MODULE_SHIELD_GENERATOR_I';
      case TradeSymbol.moduleShieldGeneratorIi:
        return 'MODULE_SHIELD_GENERATOR_II';
      case TradeSymbol.mountGasSiphonI:
        return 'MOUNT_GAS_SIPHON_I';
      case TradeSymbol.mountGasSiphonIi:
        return 'MOUNT_GAS_SIPHON_II';
      case TradeSymbol.mountGasSiphonIii:
        return 'MOUNT_GAS_SIPHON_III';
      case TradeSymbol.mountSurveyorI:
        return 'MOUNT_SURVEYOR_I';
      case TradeSymbol.mountSurveyorIi:
        return 'MOUNT_SURVEYOR_II';
      case TradeSymbol.mountSurveyorIii:
        return 'MOUNT_SURVEYOR_III';
      case TradeSymbol.mountSensorArrayI:
        return 'MOUNT_SENSOR_ARRAY_I';
      case TradeSymbol.mountSensorArrayIi:
        return 'MOUNT_SENSOR_ARRAY_II';
      case TradeSymbol.mountSensorArrayIii:
        return 'MOUNT_SENSOR_ARRAY_III';
      case TradeSymbol.mountMiningLaserI:
        return 'MOUNT_MINING_LASER_I';
      case TradeSymbol.mountMiningLaserIi:
        return 'MOUNT_MINING_LASER_II';
      case TradeSymbol.mountMiningLaserIii:
        return 'MOUNT_MINING_LASER_III';
      case TradeSymbol.mountLaserCannonI:
        return 'MOUNT_LASER_CANNON_I';
      case TradeSymbol.mountMissileLauncherI:
        return 'MOUNT_MISSILE_LAUNCHER_I';
      case TradeSymbol.mountTurretI:
        return 'MOUNT_TURRET_I';
    }
  }
}
