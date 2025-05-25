import 'package:meta/meta.dart';
import 'package:spacetraders/model/system_type.dart';

@immutable
class ScannedSystem {
  const ScannedSystem({
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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedSystem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedSystem.fromJson(json);
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

  @override
  int get hashCode => Object.hash(symbol, sectorSymbol, type, x, y, distance);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedSystem &&
        symbol == other.symbol &&
        sectorSymbol == other.sectorSymbol &&
        type == other.type &&
        x == other.x &&
        y == other.y &&
        distance == other.distance;
  }
}
