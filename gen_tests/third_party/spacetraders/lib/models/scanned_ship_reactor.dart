import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template scanned_ship_reactor}
/// The reactor of the ship.
/// {@endtemplate}
@immutable
class ScannedShipReactor {
  /// {@macro scanned_ship_reactor}
  const ScannedShipReactor({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [ScannedShipReactor].
  factory ScannedShipReactor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScannedShipReactor',
      json,
      () => ScannedShipReactor(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipReactor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipReactor.fromJson(json);
  }

  /// The symbol of the reactor.
  final String symbol;

  /// Converts a [ScannedShipReactor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedShipReactor && symbol == other.symbol;
  }
}
