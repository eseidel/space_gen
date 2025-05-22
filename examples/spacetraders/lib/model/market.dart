import 'package:spacetraders/model/market_trade_good.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/trade_good.dart';

class Market {
  Market({
    required this.symbol,
    required this.exports,
    required this.imports,
    required this.exchange,
    required this.transactions,
    required this.tradeGoods,
  });

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      symbol: json['symbol'] as String,
      exports:
          (json['exports'] as List<dynamic>)
              .map<TradeGood>(
                (e) => TradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      imports:
          (json['imports'] as List<dynamic>)
              .map<TradeGood>(
                (e) => TradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      exchange:
          (json['exchange'] as List<dynamic>)
              .map<TradeGood>(
                (e) => TradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      transactions:
          (json['transactions'] as List<dynamic>)
              .map<MarketTransaction>(
                (e) => MarketTransaction.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      tradeGoods:
          (json['tradeGoods'] as List<dynamic>)
              .map<MarketTradeGood>(
                (e) => MarketTradeGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final String symbol;
  final List<TradeGood> exports;
  final List<TradeGood> imports;
  final List<TradeGood> exchange;
  final List<MarketTransaction> transactions;
  final List<MarketTradeGood> tradeGoods;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'exports': exports.map((e) => e.toJson()).toList(),
      'imports': imports.map((e) => e.toJson()).toList(),
      'exchange': exchange.map((e) => e.toJson()).toList(),
      'transactions': transactions.map((e) => e.toJson()).toList(),
      'tradeGoods': tradeGoods.map((e) => e.toJson()).toList(),
    };
  }
}
