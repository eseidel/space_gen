import 'package:spacetraders/model/ship_requirements.dart';

class ShipFrame {
  ShipFrame({
    required this.symbol,
    required this.name,
    required this.description,
    required this.condition,
    required this.moduleSlots,
    required this.mountingPoints,
    required this.fuelCapacity,
    required this.requirements,
  });

  factory ShipFrame.fromJson(Map<String, dynamic> json) {
    return ShipFrame(
      symbol: ShipFrameSymbolInner.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      condition: json['condition'] as int,
      moduleSlots: json['moduleSlots'] as int,
      mountingPoints: json['mountingPoints'] as int,
      fuelCapacity: json['fuelCapacity'] as int,
      requirements: ShipRequirements.fromJson(
        json['requirements'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipFrameSymbolInner symbol;
  final String name;
  final String description;
  final int condition;
  final int moduleSlots;
  final int mountingPoints;
  final int fuelCapacity;
  final ShipRequirements requirements;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'condition': condition,
      'moduleSlots': moduleSlots,
      'mountingPoints': mountingPoints,
      'fuelCapacity': fuelCapacity,
      'requirements': requirements.toJson(),
    };
  }
}

enum ShipFrameSymbolInner {
  frameProbe('FRAME_PROBE'),
  frameDrone('FRAME_DRONE'),
  frameInterceptor('FRAME_INTERCEPTOR'),
  frameRacer('FRAME_RACER'),
  frameFighter('FRAME_FIGHTER'),
  frameFrigate('FRAME_FRIGATE'),
  frameShuttle('FRAME_SHUTTLE'),
  frameExplorer('FRAME_EXPLORER'),
  frameMiner('FRAME_MINER'),
  frameLightFreighter('FRAME_LIGHT_FREIGHTER'),
  frameHeavyFreighter('FRAME_HEAVY_FREIGHTER'),
  frameTransport('FRAME_TRANSPORT'),
  frameDestroyer('FRAME_DESTROYER'),
  frameCruiser('FRAME_CRUISER'),
  frameCarrier('FRAME_CARRIER'),
  ;

  const ShipFrameSymbolInner(this.value);

  factory ShipFrameSymbolInner.fromJson(String json) {
    return ShipFrameSymbolInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown ShipFrameSymbolInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
