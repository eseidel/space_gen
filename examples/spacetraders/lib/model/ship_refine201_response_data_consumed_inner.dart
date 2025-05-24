import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201ResponseDataConsumedInner {
  ShipRefine201ResponseDataConsumedInner({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumedInner(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefine201ResponseDataConsumedInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ShipRefine201ResponseDataConsumedInner.fromJson(json);
  }

  final TradeSymbol tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }
}
