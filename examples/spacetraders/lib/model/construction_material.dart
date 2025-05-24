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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ConstructionMaterial? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ConstructionMaterial.fromJson(json);
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
