import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template sell_cargo_request}
/// SellCargoRequest
/// {@endtemplate}
@immutable
class SellCargoRequest {
  /// {@macro sell_cargo_request}
  SellCargoRequest({required this.symbol, required this.units}) {
    units.validate(min: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [SellCargoRequest].
  factory SellCargoRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SellCargoRequest',
      json,
      () => SellCargoRequest(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SellCargoRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SellCargoRequest.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// Amounts of units to sell of the selected good.
  /// Example: `100`
  final int units;

  /// Converts a [SellCargoRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }

  @override
  int get hashCode => Object.hashAll([symbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SellCargoRequest &&
        symbol == other.symbol &&
        units == other.units;
  }
}
