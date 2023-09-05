import 'package:spacetraders/model/system_type.dart';

class ScannedSystem {
  ScannedSystem({
    required this.symbol,
    required this.sectorSymbol,
    required this.type,
    required this.x,
    required this.y,
    required this.distance,
  });

  factory ScannedSystem.fromJson(Map<String, dynamic> json) {
    return ScannedSystem(
      symbol: json['symbol'] as String,
      sectorSymbol: json['sectorSymbol'] as String,
      type: SystemType.fromJson(json['type'] as String),
      x: json['x'] as int,
      y: json['y'] as int,
      distance: json['distance'] as int,
    );
  }

  final String symbol;
  final String sectorSymbol;
  final SystemType type;
  final int x;
  final int y;
  final int distance;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'sectorSymbol': sectorSymbol,
      'type': type.toJson(),
      'x': x,
      'y': y,
      'distance': distance,
    };
  }
}
