import 'package:spacetraders/model/trade_symbol.dart';

class SiphonYield {
  SiphonYield({required this.symbol, required this.units});

  factory SiphonYield.fromJson(Map<String, dynamic> json) {
    return SiphonYield(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SiphonYield? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SiphonYield.fromJson(json);
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }
}
