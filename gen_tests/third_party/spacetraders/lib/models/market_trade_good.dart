import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/activity_level.dart';
import 'package:spacetraders/models/market_trade_good_type.dart';
import 'package:spacetraders/models/supply_level.dart';
import 'package:spacetraders/models/trade_symbol.dart';

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

  /// Converts a `Map<String, dynamic>` to a [MarketTradeGood].
  factory MarketTradeGood.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MarketTradeGood',
      json,
      () => MarketTradeGood(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        type: MarketTradeGoodType.fromJson(json['type'] as String),
        tradeVolume: json['tradeVolume'] as int,
        supply: SupplyLevel.fromJson(json['supply'] as String),
        activity: ActivityLevel.maybeFromJson(json['activity'] as String?),
        purchasePrice: json['purchasePrice'] as int,
        sellPrice: json['sellPrice'] as int,
      ),
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

  /// The good's symbol.
  final TradeSymbol symbol;

  /// The type of trade good (export, import, or exchange).
  final MarketTradeGoodType type;

  /// This is the maximum number of units that can be purchased or sold at
  /// this market in a single trade for this good. Trade volume also gives an
  /// indication of price volatility. A market with a low trade volume will
  /// have large price swings, while high trade volume will be more resilient
  /// to price changes.
  final int tradeVolume;

  /// The supply level of a trade good.
  final SupplyLevel supply;

  /// The activity level of a trade good. If the good is an import, this
  /// represents how strong consumption is. If the good is an export, this
  /// represents how strong the production is for the good. When activity is
  /// strong, consumption or production is near maximum capacity. When
  /// activity is weak, consumption or production is near minimum capacity.
  final ActivityLevel? activity;

  /// The price at which this good can be purchased from the market.
  final int purchasePrice;

  /// The price at which this good can be sold to the market.
  final int sellPrice;

  /// Converts a [MarketTradeGood] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'type': type.toJson(),
      'tradeVolume': tradeVolume,
      'supply': supply.toJson(),
      if (activity != null) 'activity': activity?.toJson(),
      'purchasePrice': purchasePrice,
      'sellPrice': sellPrice,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    type,
    tradeVolume,
    supply,
    activity,
    purchasePrice,
    sellPrice,
  ]);

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
