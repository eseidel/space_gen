import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201ResponseDataProducedInner {
  ShipRefine201ResponseDataProducedInner({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProducedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProducedInner(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefine201ResponseDataProducedInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ShipRefine201ResponseDataProducedInner.fromJson(json);
  }

  final TradeSymbol tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }
}
