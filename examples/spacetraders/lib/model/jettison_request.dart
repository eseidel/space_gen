import 'package:spacetraders/model/trade_symbol.dart';

class JettisonRequest {
  JettisonRequest({
    required this.symbol,
    required this.units,
  });

  factory JettisonRequest.fromJson(Map<String, dynamic> json) {
    return JettisonRequest(
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
