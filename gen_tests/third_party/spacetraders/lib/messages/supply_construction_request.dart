import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

@immutable
class SupplyConstructionRequest {
  const SupplyConstructionRequest({
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.units,
  });

  /// Converts a `Map<String, dynamic>` to a [SupplyConstructionRequest].
  factory SupplyConstructionRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SupplyConstructionRequest',
      json,
      () => SupplyConstructionRequest(
        shipSymbol: json['shipSymbol'] as String,
        tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SupplyConstructionRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SupplyConstructionRequest.fromJson(json);
  }

  /// The symbol of the ship supplying construction materials.
  /// Example: `'DODO-1'`
  final String shipSymbol;

  /// The good's symbol.
  final TradeSymbol tradeSymbol;

  /// Amount of units to supply.
  /// Example: `10`
  final int units;

  /// Converts a [SupplyConstructionRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol.toJson(),
      'units': units,
    };
  }

  @override
  int get hashCode => Object.hashAll([shipSymbol, tradeSymbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SupplyConstructionRequest &&
        shipSymbol == other.shipSymbol &&
        tradeSymbol == other.tradeSymbol &&
        units == other.units;
  }
}
