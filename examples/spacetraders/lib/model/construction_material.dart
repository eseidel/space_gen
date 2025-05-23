import 'package:spacetraders/model/trade_symbol.dart';

class ConstructionMaterial {
  ConstructionMaterial({
    required this.tradeSymbol,
    required this.required_,
    required this.fulfilled,
  });

  factory ConstructionMaterial.fromJson(Map<String, dynamic> json) {
    return ConstructionMaterial(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      required_: json['required'] as int,
      fulfilled: json['fulfilled'] as int,
    );
  }

  final TradeSymbol tradeSymbol;
  final int required_;
  final int fulfilled;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'required_': required_,
      'fulfilled': fulfilled,
    };
  }
}
