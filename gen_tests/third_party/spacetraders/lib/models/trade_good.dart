import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template trade_good}
/// A good that can be traded for other goods or currency.
/// {@endtemplate}
@immutable
class TradeGood {
  /// {@macro trade_good}
  const TradeGood({
    required this.symbol,
    required this.name,
    required this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [TradeGood].
  factory TradeGood.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TradeGood',
      json,
      () => TradeGood(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
      ),
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

  /// The good's symbol.
  final TradeSymbol symbol;

  /// The name of the good.
  final String name;

  /// The description of the good.
  final String description;

  /// Converts a [TradeGood] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hashAll([symbol, name, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TradeGood &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description;
  }
}
