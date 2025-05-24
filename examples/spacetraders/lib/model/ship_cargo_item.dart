import 'package:spacetraders/model/trade_symbol.dart';

class ShipCargoItem {
  ShipCargoItem({
    required this.symbol,
    required this.name,
    required this.description,
    required this.units,
  });

  factory ShipCargoItem.fromJson(Map<String, dynamic> json) {
    return ShipCargoItem(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipCargoItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipCargoItem.fromJson(json);
  }

  final TradeSymbol symbol;
  final String name;
  final String description;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'units': units,
    };
  }
}
