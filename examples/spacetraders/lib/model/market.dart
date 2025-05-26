import 'package:meta/meta.dart';
import 'package:spacetraders/model/market_trade_good.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/trade_good.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class Market {
  const Market({
    required this.symbol,
    this.exports = const [],
    this.imports = const [],
    this.exchange = const [],
    this.transactions = const [],
    this.tradeGoods = const [],
  });

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      symbol: json['symbol'] as String,
      exports:
          (json['exports'] as List)
              .map<TradeGood>(
                (e) => TradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      imports:
          (json['imports'] as List)
              .map<TradeGood>(
                (e) => TradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      exchange:
          (json['exchange'] as List)
              .map<TradeGood>(
                (e) => TradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      transactions:
          (json['transactions'] as List)
              .map<MarketTransaction>(
                (e) => MarketTransaction.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      tradeGoods:
          (json['tradeGoods'] as List)
              .map<MarketTradeGood>(
                (e) => MarketTradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
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

  final String symbol;
  final List<TradeGood> exports;
  final List<TradeGood> imports;
  final List<TradeGood> exchange;
  final List<MarketTransaction>? transactions;
  final List<MarketTradeGood>? tradeGoods;

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
  int get hashCode =>
      Object.hash(symbol, exports, imports, exchange, transactions, tradeGoods);

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
