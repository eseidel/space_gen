import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201ResponseDataConsumedItem {
  ShipRefine201ResponseDataConsumedItem({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumedItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumedItem(
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
