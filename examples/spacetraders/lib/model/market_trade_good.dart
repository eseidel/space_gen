import 'package:meta/meta.dart';
import 'package:spacetraders/model/activity_level.dart';
import 'package:spacetraders/model/market_trade_good_type.dart';
import 'package:spacetraders/model/supply_level.dart';
import 'package:spacetraders/model/trade_symbol.dart';

@immutable
class MarketTradeGood {
  const MarketTradeGood({
    required this.symbol,
    required this.type,
    required this.tradeVolume,
    required this.supply,
    required this.purchasePrice,
    required this.sellPrice,
    this.activity,
  });

  factory MarketTradeGood.fromJson(Map<String, dynamic> json) {
    return MarketTradeGood(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      type: MarketTradeGoodType.fromJson(json['type'] as String),
      tradeVolume: json['tradeVolume'] as int,
      supply: SupplyLevel.fromJson(json['supply'] as String),
      activity: ActivityLevel.fromJson(json['activity'] as String),
      purchasePrice: json['purchasePrice'] as int,
      sellPrice: json['sellPrice'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketTradeGood? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MarketTradeGood.fromJson(json);
  }

  final TradeSymbol symbol;
  final MarketTradeGoodType type;
  final int tradeVolume;
  final SupplyLevel supply;
  final ActivityLevel? activity;
  final int purchasePrice;
  final int sellPrice;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'type': type.toJson(),
      'tradeVolume': tradeVolume,
      'supply': supply.toJson(),
      'activity': activity?.toJson(),
      'purchasePrice': purchasePrice,
      'sellPrice': sellPrice,
    };
  }

  @override
  int get hashCode => Object.hash(
    symbol,
    type,
    tradeVolume,
    supply,
    activity,
    purchasePrice,
    sellPrice,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarketTradeGood &&
        symbol == other.symbol &&
        type == other.type &&
        tradeVolume == other.tradeVolume &&
        supply == other.supply &&
        activity == other.activity &&
        purchasePrice == other.purchasePrice &&
        sellPrice == other.sellPrice;
  }
}
