import 'package:spacetraders/model/trade_symbol.dart';

class SiphonYield {
  SiphonYield({required this.symbol, required this.units});

  factory SiphonYield.fromJson(Map<String, dynamic> json) {
    return SiphonYield(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }
}
