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
    switch (json) {
      case 'FRAME_PROBE':
        return ShipFrameSymbolInner.frameProbe;
      case 'FRAME_DRONE':
        return ShipFrameSymbolInner.frameDrone;
      case 'FRAME_INTERCEPTOR':
        return ShipFrameSymbolInner.frameInterceptor;
      case 'FRAME_RACER':
        return ShipFrameSymbolInner.frameRacer;
      case 'FRAME_FIGHTER':
        return ShipFrameSymbolInner.frameFighter;
      case 'FRAME_FRIGATE':
        return ShipFrameSymbolInner.frameFrigate;
      case 'FRAME_SHUTTLE':
        return ShipFrameSymbolInner.frameShuttle;
      case 'FRAME_EXPLORER':
        return ShipFrameSymbolInner.frameExplorer;
      case 'FRAME_MINER':
        return ShipFrameSymbolInner.frameMiner;
      case 'FRAME_LIGHT_FREIGHTER':
        return ShipFrameSymbolInner.frameLightFreighter;
      case 'FRAME_HEAVY_FREIGHTER':
        return ShipFrameSymbolInner.frameHeavyFreighter;
      case 'FRAME_TRANSPORT':
        return ShipFrameSymbolInner.frameTransport;
      case 'FRAME_DESTROYER':
        return ShipFrameSymbolInner.frameDestroyer;
      case 'FRAME_CRUISER':
        return ShipFrameSymbolInner.frameCruiser;
      case 'FRAME_CARRIER':
        return ShipFrameSymbolInner.frameCarrier;
      default:
        throw Exception('Unknown ShipFrameSymbolInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipFrameSymbolInner.frameProbe:
        return 'FRAME_PROBE';
      case ShipFrameSymbolInner.frameDrone:
        return 'FRAME_DRONE';
      case ShipFrameSymbolInner.frameInterceptor:
        return 'FRAME_INTERCEPTOR';
      case ShipFrameSymbolInner.frameRacer:
        return 'FRAME_RACER';
      case ShipFrameSymbolInner.frameFighter:
        return 'FRAME_FIGHTER';
      case ShipFrameSymbolInner.frameFrigate:
        return 'FRAME_FRIGATE';
      case ShipFrameSymbolInner.frameShuttle:
        return 'FRAME_SHUTTLE';
      case ShipFrameSymbolInner.frameExplorer:
        return 'FRAME_EXPLORER';
      case ShipFrameSymbolInner.frameMiner:
        return 'FRAME_MINER';
      case ShipFrameSymbolInner.frameLightFreighter:
        return 'FRAME_LIGHT_FREIGHTER';
      case ShipFrameSymbolInner.frameHeavyFreighter:
        return 'FRAME_HEAVY_FREIGHTER';
      case ShipFrameSymbolInner.frameTransport:
        return 'FRAME_TRANSPORT';
      case ShipFrameSymbolInner.frameDestroyer:
        return 'FRAME_DESTROYER';
      case ShipFrameSymbolInner.frameCruiser:
        return 'FRAME_CRUISER';
      case ShipFrameSymbolInner.frameCarrier:
        return 'FRAME_CARRIER';
    }
  }
}
