import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template scanned_ship_engine}
/// The engine of the ship.
/// {@endtemplate}
@immutable
class ScannedShipEngine {
  /// {@macro scanned_ship_engine}
  const ScannedShipEngine({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [ScannedShipEngine].
  factory ScannedShipEngine.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScannedShipEngine',
      json,
      () => ScannedShipEngine(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipEngine? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipEngine.fromJson(json);
  }

  /// The symbol of the engine.
  final String symbol;

  /// Converts a [ScannedShipEngine] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedShipEngine && symbol == other.symbol;
  }
}
