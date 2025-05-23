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
  REACTOR_OVERLOAD('REACTOR_OVERLOAD'),
  ENERGY_SPIKE_FROM_MINERAL('ENERGY_SPIKE_FROM_MINERAL'),
  SOLAR_FLARE_INTERFERENCE('SOLAR_FLARE_INTERFERENCE'),
  COOLANT_LEAK('COOLANT_LEAK'),
  POWER_DISTRIBUTION_FLUCTUATION('POWER_DISTRIBUTION_FLUCTUATION'),
  MAGNETIC_FIELD_DISRUPTION('MAGNETIC_FIELD_DISRUPTION'),
  HULL_MICROMETEORITE_STRIKES('HULL_MICROMETEORITE_STRIKES'),
  STRUCTURAL_STRESS_FRACTURES('STRUCTURAL_STRESS_FRACTURES'),
  CORROSIVE_MINERAL_CONTAMINATION('CORROSIVE_MINERAL_CONTAMINATION'),
  THERMAL_EXPANSION_MISMATCH('THERMAL_EXPANSION_MISMATCH'),
  VIBRATION_DAMAGE_FROM_DRILLING('VIBRATION_DAMAGE_FROM_DRILLING'),
  ELECTROMAGNETIC_FIELD_INTERFERENCE('ELECTROMAGNETIC_FIELD_INTERFERENCE'),
  IMPACT_WITH_EXTRACTED_DEBRIS('IMPACT_WITH_EXTRACTED_DEBRIS'),
  FUEL_EFFICIENCY_DEGRADATION('FUEL_EFFICIENCY_DEGRADATION'),
  COOLANT_SYSTEM_AGEING('COOLANT_SYSTEM_AGEING'),
  DUST_MICROABRASIONS('DUST_MICROABRASIONS'),
  THRUSTER_NOZZLE_WEAR('THRUSTER_NOZZLE_WEAR'),
  EXHAUST_PORT_CLOGGING('EXHAUST_PORT_CLOGGING'),
  BEARING_LUBRICATION_FADE('BEARING_LUBRICATION_FADE'),
  SENSOR_CALIBRATION_DRIFT('SENSOR_CALIBRATION_DRIFT'),
  HULL_MICROMETEORITE_DAMAGE('HULL_MICROMETEORITE_DAMAGE'),
  SPACE_DEBRIS_COLLISION('SPACE_DEBRIS_COLLISION'),
  THERMAL_STRESS('THERMAL_STRESS'),
  VIBRATION_OVERLOAD('VIBRATION_OVERLOAD'),
  PRESSURE_DIFFERENTIAL_STRESS('PRESSURE_DIFFERENTIAL_STRESS'),
  ELECTROMAGNETIC_SURGE_EFFECTS('ELECTROMAGNETIC_SURGE_EFFECTS'),
  ATMOSPHERIC_ENTRY_HEAT('ATMOSPHERIC_ENTRY_HEAT');

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
  FRAME('FRAME'),
  REACTOR('REACTOR'),
  ENGINE('ENGINE');

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
