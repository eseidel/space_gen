class ShipConditionEvent {
  ShipConditionEvent({
    required this.symbol,
    required this.component,
    required this.name,
    required this.description,
  });

  factory ShipConditionEvent.fromJson(Map<String, dynamic> json) {
    return ShipConditionEvent(
      symbol: ShipConditionEventSymbol.fromJson(json['symbol'] as String),
      component: ShipConditionEventComponent.fromJson(
        json['component'] as String,
      ),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  final ShipConditionEventSymbol symbol;
  final ShipConditionEventComponent component;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'component': component.toJson(),
      'name': name,
      'description': description,
    };
  }
}

enum ShipConditionEventSymbol {
  reactorOverload('REACTOR_OVERLOAD'),
  energySpikeFromMineral('ENERGY_SPIKE_FROM_MINERAL'),
  solarFlareInterference('SOLAR_FLARE_INTERFERENCE'),
  coolantLeak('COOLANT_LEAK'),
  powerDistributionFluctuation('POWER_DISTRIBUTION_FLUCTUATION'),
  magneticFieldDisruption('MAGNETIC_FIELD_DISRUPTION'),
  hullMicrometeoriteStrikes('HULL_MICROMETEORITE_STRIKES'),
  structuralStressFractures('STRUCTURAL_STRESS_FRACTURES'),
  corrosiveMineralContamination('CORROSIVE_MINERAL_CONTAMINATION'),
  thermalExpansionMismatch('THERMAL_EXPANSION_MISMATCH'),
  vibrationDamageFromDrilling('VIBRATION_DAMAGE_FROM_DRILLING'),
  electromagneticFieldInterference('ELECTROMAGNETIC_FIELD_INTERFERENCE'),
  impactWithExtractedDebris('IMPACT_WITH_EXTRACTED_DEBRIS'),
  fuelEfficiencyDegradation('FUEL_EFFICIENCY_DEGRADATION'),
  coolantSystemAgeing('COOLANT_SYSTEM_AGEING'),
  dustMicroabrasions('DUST_MICROABRASIONS'),
  thrusterNozzleWear('THRUSTER_NOZZLE_WEAR'),
  exhaustPortClogging('EXHAUST_PORT_CLOGGING'),
  bearingLubricationFade('BEARING_LUBRICATION_FADE'),
  sensorCalibrationDrift('SENSOR_CALIBRATION_DRIFT'),
  hullMicrometeoriteDamage('HULL_MICROMETEORITE_DAMAGE'),
  spaceDebrisCollision('SPACE_DEBRIS_COLLISION'),
  thermalStress('THERMAL_STRESS'),
  vibrationOverload('VIBRATION_OVERLOAD'),
  pressureDifferentialStress('PRESSURE_DIFFERENTIAL_STRESS'),
  electromagneticSurgeEffects('ELECTROMAGNETIC_SURGE_EFFECTS'),
  atmosphericEntryHeat('ATMOSPHERIC_ENTRY_HEAT');

  const ShipConditionEventSymbol(this.value);

  factory ShipConditionEventSymbol.fromJson(String json) {
    return ShipConditionEventSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw Exception('Unknown ShipConditionEventSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}

enum ShipConditionEventComponent {
  frame('FRAME'),
  reactor('REACTOR'),
  engine('ENGINE');

  const ShipConditionEventComponent(this.value);

  factory ShipConditionEventComponent.fromJson(String json) {
    return ShipConditionEventComponent.values.firstWhere(
      (value) => value.value == json,
      orElse:
          () =>
              throw Exception(
                'Unknown ShipConditionEventComponent value: $json',
              ),
    );
  }

  final String value;

  String toJson() => value;
}
