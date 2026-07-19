import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template purchase_cargo_request}
/// Purchase Cargo Request
/// {@endtemplate}
@immutable
class PurchaseCargoRequest {
  /// {@macro purchase_cargo_request}
  const PurchaseCargoRequest({required this.symbol, required this.units});

  /// Converts a `Map<String, dynamic>` to a [PurchaseCargoRequest].
  factory PurchaseCargoRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PurchaseCargoRequest',
      json,
      () => PurchaseCargoRequest(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseCargoRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PurchaseCargoRequest.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// The number of units of the good to purchase.
  final int units;

  /// Converts a [PurchaseCargoRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson(), 'units': units};
  }

  @override
  int get hashCode => Object.hashAll([symbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PurchaseCargoRequest &&
        symbol == other.symbol &&
        units == other.units;
  }
}
