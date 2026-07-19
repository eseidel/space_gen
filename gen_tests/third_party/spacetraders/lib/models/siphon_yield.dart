import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template siphon_yield}
/// A yield from the siphon operation.
/// {@endtemplate}
@immutable
class SiphonYield {
  /// {@macro siphon_yield}
  const SiphonYield({required this.symbol, required this.units});

  /// Converts a `Map<String, dynamic>` to a [SiphonYield].
  factory SiphonYield.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SiphonYield',
      json,
      () => SiphonYield(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SiphonYield? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SiphonYield.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// The number of units siphoned that were placed into the ship's cargo
  /// hold.
  final int units;

  /// Converts a [SiphonYield] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }

  @override
  int get hashCode => Object.hashAll([symbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SiphonYield &&
        symbol == other.symbol &&
        units == other.units;
  }
}
