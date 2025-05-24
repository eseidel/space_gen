import 'package:spacetraders/model/trade_symbol.dart';

class ExtractionYield {
  ExtractionYield({required this.symbol, required this.units});

  factory ExtractionYield.fromJson(Map<String, dynamic> json) {
    return ExtractionYield(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ExtractionYield? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ExtractionYield.fromJson(json);
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }
}
