import 'package:spacetraders/model/trade_symbol.dart';

class SellCargoRequest {
  SellCargoRequest({
    required this.symbol,
    required this.units,
  });

  factory SellCargoRequest.fromJson(Map<String, dynamic> json) {
    return SellCargoRequest(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'units': units,
    };
  }
}
