import 'package:spacetraders/model/trade_symbol.dart';

class TransferCargoRequest {
  TransferCargoRequest({
    required this.tradeSymbol,
    required this.units,
    required this.shipSymbol,
  });

  factory TransferCargoRequest.fromJson(Map<String, dynamic> json) {
    return TransferCargoRequest(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
      shipSymbol: json['shipSymbol'] as String,
    );
  }

  final TradeSymbol tradeSymbol;
  final int units;
  final String shipSymbol;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'units': units,
      'shipSymbol': shipSymbol,
    };
  }
}
