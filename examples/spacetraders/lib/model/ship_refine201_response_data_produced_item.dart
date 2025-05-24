import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201ResponseDataProducedItem {
  ShipRefine201ResponseDataProducedItem({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProducedItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProducedItem(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefine201ResponseDataProducedItem? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ShipRefine201ResponseDataProducedItem.fromJson(json);
  }

  final TradeSymbol tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }
}
