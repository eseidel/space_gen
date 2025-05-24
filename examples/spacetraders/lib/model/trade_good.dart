import 'package:spacetraders/model/trade_symbol.dart';

class TradeGood {
  TradeGood({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory TradeGood.fromJson(Map<String, dynamic> json) {
    return TradeGood(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TradeGood? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TradeGood.fromJson(json);
  }

  final TradeSymbol symbol;
  final String name;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }
}
