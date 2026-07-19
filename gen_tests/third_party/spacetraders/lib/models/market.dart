import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/market_trade_good.dart';
import 'package:spacetraders/models/market_transaction.dart';
import 'package:spacetraders/models/trade_good.dart';

/// {@template market}
/// Market details.
/// {@endtemplate}
@immutable
class Market {
  /// {@macro market}
  const Market({
    required this.symbol,
    required this.exports,
    required this.imports,
    required this.exchange,
    this.transactions,
    this.tradeGoods,
  });

  /// Converts a `Map<String, dynamic>` to a [Market].
  factory Market.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Market',
      json,
      () => Market(
        symbol: json['symbol'] as String,
        exports: (json['exports'] as List)
            .map<TradeGood>(
              (e) => TradeGood.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        imports: (json['imports'] as List)
            .map<TradeGood>(
              (e) => TradeGood.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        exchange: (json['exchange'] as List)
            .map<TradeGood>(
              (e) => TradeGood.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        transactions: (json['transactions'] as List?)
            ?.map<MarketTransaction>(
              (e) => MarketTransaction.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        tradeGoods: (json['tradeGoods'] as List?)
            ?.map<MarketTradeGood>(
              (e) => MarketTradeGood.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Market? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Market.fromJson(json);
  }

  /// The symbol of the market. The symbol is the same as the waypoint where
  /// the market is located.
  final String symbol;

  /// The list of goods that are exported from this market.
  final List<TradeGood> exports;

  /// The list of goods that are sought as imports in this market.
  final List<TradeGood> imports;

  /// The list of goods that are bought and sold between agents at this
  /// market.
  final List<TradeGood> exchange;

  /// The list of recent transactions at this market. Visible only when a ship
  /// is present at the market.
  final List<MarketTransaction>? transactions;

  /// The list of goods that are traded at this market. Visible only when a
  /// ship is present at the market.
  final List<MarketTradeGood>? tradeGoods;

  /// Converts a [Market] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'exports': exports.map((e) => e.toJson()).toList(),
      'imports': imports.map((e) => e.toJson()).toList(),
      'exchange': exchange.map((e) => e.toJson()).toList(),
      'transactions': transactions?.map((e) => e.toJson()).toList(),
      'tradeGoods': tradeGoods?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    listHash(exports),
    listHash(imports),
    listHash(exchange),
    listHash(transactions),
    listHash(tradeGoods),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Market &&
        symbol == other.symbol &&
        listsEqual(exports, other.exports) &&
        listsEqual(imports, other.imports) &&
        listsEqual(exchange, other.exchange) &&
        listsEqual(transactions, other.transactions) &&
        listsEqual(tradeGoods, other.tradeGoods);
  }
}
