import 'package:meta/meta.dart';
import 'package:spacetraders/model/trade_symbol.dart';

@immutable
class TransferCargoRequest {
  const TransferCargoRequest({
    required this.tradeSymbol,
    required this.units,
    required this.shipSymbol,
  });

  factory TransferCargoRequest.fromJson(Map<String, dynamic> json) {
    return TransferCargoRequest(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
      shipSymbol: json['shipSymbol'] as String,
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

  final TradeSymbol tradeSymbol;
  final int units;
  final String shipSymbol;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'units': units,
      'shipSymbol': shipSymbol,
    };
  }

  @override
  int get hashCode => Object.hash(tradeSymbol, units, shipSymbol);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransferCargoRequest &&
        tradeSymbol == other.tradeSymbol &&
        units == other.units &&
        shipSymbol == other.shipSymbol;
  }
}
