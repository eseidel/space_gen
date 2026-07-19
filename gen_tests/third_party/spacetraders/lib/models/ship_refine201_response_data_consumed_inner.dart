import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

@immutable
class ShipRefine201ResponseDataConsumedInner {
  const ShipRefine201ResponseDataConsumedInner({
    required this.tradeSymbol,
    required this.units,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ShipRefine201ResponseDataConsumedInner].
  factory ShipRefine201ResponseDataConsumedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ShipRefine201ResponseDataConsumedInner',
      json,
      () => ShipRefine201ResponseDataConsumedInner(
        tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefine201ResponseDataConsumedInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ShipRefine201ResponseDataConsumedInner.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol tradeSymbol;

  /// Amount of units of the good.
  final int units;

  /// Converts a [ShipRefine201ResponseDataConsumedInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }

  @override
  int get hashCode => Object.hashAll([tradeSymbol, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipRefine201ResponseDataConsumedInner &&
        tradeSymbol == other.tradeSymbol &&
        units == other.units;
  }
}
