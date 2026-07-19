import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template transfer_cargo_request}
/// Transfer Cargo Request
/// {@endtemplate}
@immutable
class TransferCargoRequest {
  /// {@macro transfer_cargo_request}
  const TransferCargoRequest({
    required this.tradeSymbol,
    required this.units,
    required this.shipSymbol,
  });

  /// Converts a `Map<String, dynamic>` to a [TransferCargoRequest].
  factory TransferCargoRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TransferCargoRequest',
      json,
      () => TransferCargoRequest(
        tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
        units: json['units'] as int,
        shipSymbol: json['shipSymbol'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TransferCargoRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TransferCargoRequest.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol tradeSymbol;

  /// Amount of units to transfer.
  final int units;

  /// The symbol of the ship to transfer to.
  final String shipSymbol;

  /// Converts a [TransferCargoRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'units': units,
      'shipSymbol': shipSymbol,
    };
  }

  @override
  int get hashCode => Object.hashAll([tradeSymbol, units, shipSymbol]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransferCargoRequest &&
        tradeSymbol == other.tradeSymbol &&
        units == other.units &&
        shipSymbol == other.shipSymbol;
  }
}
