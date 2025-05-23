import 'package:spacetraders/model/ship_requirements.dart';

class ShipFrame {
  ShipFrame({
    required this.symbol,
    required this.name,
    required this.condition,
    required this.integrity,
    required this.description,
    required this.moduleSlots,
    required this.mountingPoints,
    required this.fuelCapacity,
    required this.requirements,
    required this.quality,
  });

  factory ShipFrame.fromJson(Map<String, dynamic> json) {
    return ShipFrame(
      symbol: ShipFrameSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      condition: json['condition'] as double,
      integrity: json['integrity'] as double,
      description: json['description'] as String,
      moduleSlots: json['moduleSlots'] as int,
      mountingPoints: json['mountingPoints'] as int,
      fuelCapacity: json['fuelCapacity'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
      quality: json['quality'] as double,
    );
  }

  final ShipFrameSymbol symbol;
  final String name;
  final double condition;
  final double integrity;
  final String description;
  final int moduleSlots;
  final int mountingPoints;
  final int fuelCapacity;
  final ShipRequirements requirements;
  final double quality;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'condition': condition,
      'integrity': integrity,
      'description': description,
      'moduleSlots': moduleSlots,
      'mountingPoints': mountingPoints,
      'fuelCapacity': fuelCapacity,
      'requirements': requirements.toJson(),
      'quality': quality,
    };
  }
}

enum ShipFrameSymbol {
  PROBE('FRAME_PROBE'),
  DRONE('FRAME_DRONE'),
  INTERCEPTOR('FRAME_INTERCEPTOR'),
  RACER('FRAME_RACER'),
  FIGHTER('FRAME_FIGHTER'),
  FRIGATE('FRAME_FRIGATE'),
  SHUTTLE('FRAME_SHUTTLE'),
  EXPLORER('FRAME_EXPLORER'),
  MINER('FRAME_MINER'),
  LIGHT_FREIGHTER('FRAME_LIGHT_FREIGHTER'),
  HEAVY_FREIGHTER('FRAME_HEAVY_FREIGHTER'),
  TRANSPORT('FRAME_TRANSPORT'),
  DESTROYER('FRAME_DESTROYER'),
  CRUISER('FRAME_CRUISER'),
  CARRIER('FRAME_CARRIER'),
  BULK_FREIGHTER('FRAME_BULK_FREIGHTER');

  const ShipFrameSymbol(this.value);

  factory ShipFrameSymbol.fromJson(String json) {
    return ShipFrameSymbol.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw Exception('Unknown ShipFrameSymbol value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
