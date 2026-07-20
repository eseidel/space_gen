import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/trade_symbol.dart';

/// {@template ship_cargo_item}
/// The type of cargo item and the number of units.
/// {@endtemplate}
@immutable
class ShipCargoItem {
  /// {@macro ship_cargo_item}
  ShipCargoItem({
    required this.symbol,
    required this.name,
    required this.description,
    required this.units,
  }) {
    units.validate(min: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [ShipCargoItem].
  factory ShipCargoItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipCargoItem',
      json,
      () => ShipCargoItem(
        symbol: TradeSymbol.fromJson(json['symbol'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
        units: json['units'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipCargoItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipCargoItem.fromJson(json);
  }

  /// The good's symbol.
  final TradeSymbol symbol;

  /// The name of the cargo item type.
  final String name;

  /// The description of the cargo item type.
  final String description;

  /// The number of units of the cargo item.
  final int units;

  /// Converts a [ShipCargoItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'name': name,
      'description': description,
      'units': units,
    };
  }

  @override
  int get hashCode => Object.hashAll([symbol, name, description, units]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipCargoItem &&
        symbol == other.symbol &&
        name == other.name &&
        description == other.description &&
        units == other.units;
  }
}
