import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201ResponseDataProduced {
  ShipRefine201ResponseDataProduced({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProduced.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProduced(
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
