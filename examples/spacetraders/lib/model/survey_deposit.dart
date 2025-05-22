import 'package:spacetraders/model/trade_symbol.dart';

class SurveyDeposit {
  SurveyDeposit({required this.symbol});

  factory SurveyDeposit.fromJson(Map<String, dynamic> json) {
    return SurveyDeposit(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
    );
  }

  final TradeSymbol symbol;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }
}
