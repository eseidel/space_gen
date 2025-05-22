import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201ResponseDataConsumed {
  ShipRefine201ResponseDataConsumed({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumed.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumed(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }
}
