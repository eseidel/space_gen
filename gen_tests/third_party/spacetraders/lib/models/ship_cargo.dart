import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_cargo_item.dart';

/// {@template ship_cargo}
/// Ship cargo details.
/// {@endtemplate}
@immutable
class ShipCargo {
  /// {@macro ship_cargo}
  ShipCargo({
    required this.capacity,
    required this.units,
    required this.inventory,
  }) {
    capacity.validate(min: 0);
    units.validate(min: 0);
  }

  /// Converts a `Map<String, dynamic>` to a [ShipCargo].
  factory ShipCargo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipCargo',
      json,
      () => ShipCargo(
        capacity: json['capacity'] as int,
        units: json['units'] as int,
        inventory: (json['inventory'] as List)
            .map<ShipCargoItem>(
              (e) => ShipCargoItem.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipCargo? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipCargo.fromJson(json);
  }

  /// The max number of items that can be stored in the cargo hold.
  final int capacity;

  /// The number of items currently stored in the cargo hold.
  final int units;

  /// The items currently in the cargo hold.
  final List<ShipCargoItem> inventory;

  /// Converts a [ShipCargo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'capacity': capacity,
      'units': units,
      'inventory': inventory.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([capacity, units, listHash(inventory)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipCargo &&
        capacity == other.capacity &&
        units == other.units &&
        listsEqual(inventory, other.inventory);
  }
}
