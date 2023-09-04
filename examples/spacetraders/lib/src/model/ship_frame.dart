import 'package:spacetraders/src/model/ship_requirements.dart';

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
      symbol: ShipFrameSymbolString.fromJson(json['symbol'] as String),
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

  final ShipFrameSymbolString symbol;
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

enum ShipFrameSymbolString {
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

  const ShipFrameSymbolString(this.value);

  factory ShipFrameSymbolString.fromJson(String json) {
    switch (json) {
      case 'FRAME_PROBE':
        return ShipFrameSymbolString.frameProbe;
      case 'FRAME_DRONE':
        return ShipFrameSymbolString.frameDrone;
      case 'FRAME_INTERCEPTOR':
        return ShipFrameSymbolString.frameInterceptor;
      case 'FRAME_RACER':
        return ShipFrameSymbolString.frameRacer;
      case 'FRAME_FIGHTER':
        return ShipFrameSymbolString.frameFighter;
      case 'FRAME_FRIGATE':
        return ShipFrameSymbolString.frameFrigate;
      case 'FRAME_SHUTTLE':
        return ShipFrameSymbolString.frameShuttle;
      case 'FRAME_EXPLORER':
        return ShipFrameSymbolString.frameExplorer;
      case 'FRAME_MINER':
        return ShipFrameSymbolString.frameMiner;
      case 'FRAME_LIGHT_FREIGHTER':
        return ShipFrameSymbolString.frameLightFreighter;
      case 'FRAME_HEAVY_FREIGHTER':
        return ShipFrameSymbolString.frameHeavyFreighter;
      case 'FRAME_TRANSPORT':
        return ShipFrameSymbolString.frameTransport;
      case 'FRAME_DESTROYER':
        return ShipFrameSymbolString.frameDestroyer;
      case 'FRAME_CRUISER':
        return ShipFrameSymbolString.frameCruiser;
      case 'FRAME_CARRIER':
        return ShipFrameSymbolString.frameCarrier;
      default:
        throw Exception('Unknown ShipFrameSymbolString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipFrameSymbolString.frameProbe:
        return 'FRAME_PROBE';
      case ShipFrameSymbolString.frameDrone:
        return 'FRAME_DRONE';
      case ShipFrameSymbolString.frameInterceptor:
        return 'FRAME_INTERCEPTOR';
      case ShipFrameSymbolString.frameRacer:
        return 'FRAME_RACER';
      case ShipFrameSymbolString.frameFighter:
        return 'FRAME_FIGHTER';
      case ShipFrameSymbolString.frameFrigate:
        return 'FRAME_FRIGATE';
      case ShipFrameSymbolString.frameShuttle:
        return 'FRAME_SHUTTLE';
      case ShipFrameSymbolString.frameExplorer:
        return 'FRAME_EXPLORER';
      case ShipFrameSymbolString.frameMiner:
        return 'FRAME_MINER';
      case ShipFrameSymbolString.frameLightFreighter:
        return 'FRAME_LIGHT_FREIGHTER';
      case ShipFrameSymbolString.frameHeavyFreighter:
        return 'FRAME_HEAVY_FREIGHTER';
      case ShipFrameSymbolString.frameTransport:
        return 'FRAME_TRANSPORT';
      case ShipFrameSymbolString.frameDestroyer:
        return 'FRAME_DESTROYER';
      case ShipFrameSymbolString.frameCruiser:
        return 'FRAME_CRUISER';
      case ShipFrameSymbolString.frameCarrier:
        return 'FRAME_CARRIER';
    }
  }
}
