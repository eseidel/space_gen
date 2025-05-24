import 'package:spacetraders/model/trade_symbol.dart';

class PurchaseCargoRequest {
  PurchaseCargoRequest({required this.symbol, required this.units});

  factory PurchaseCargoRequest.fromJson(Map<String, dynamic> json) {
    return PurchaseCargoRequest(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseCargoRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PurchaseCargoRequest.fromJson(json);
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }
}
