import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/system_type.dart';

/// {@template scanned_system}
/// Details of a system was that scanned.
/// {@endtemplate}
@immutable
class ScannedSystem {
  /// {@macro scanned_system}
  ScannedSystem({
    required this.symbol,
    required this.sectorSymbol,
    required this.type,
    required this.x,
    required this.y,
    required this.distance,
  }) {
    symbol.validate(minLength: 1);
    sectorSymbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [ScannedSystem].
  factory ScannedSystem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScannedSystem',
      json,
      () => ScannedSystem(
        symbol: json['symbol'] as String,
        sectorSymbol: json['sectorSymbol'] as String,
        type: SystemType.fromJson(json['type'] as String),
        x: json['x'] as int,
        y: json['y'] as int,
        distance: json['distance'] as int,
      ),
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

  /// Symbol of the system.
  final String symbol;

  /// Symbol of the system's sector.
  final String sectorSymbol;

  /// The type of system.
  final SystemType type;

  /// Position in the universe in the x axis.
  final int x;

  /// Position in the universe in the y axis.
  final int y;

  /// The system's distance from the scanning ship.
  final int distance;

  /// Converts a [ScannedSystem] to a `Map<String, dynamic>`.
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
  int get hashCode =>
      Object.hashAll([symbol, sectorSymbol, type, x, y, distance]);

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
