import 'package:meta/meta.dart';
import 'package:spacetraders/model/ship_cargo_item.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ShipCargo {
  const ShipCargo({
    required this.capacity,
    required this.units,
    this.inventory = const [],
  });

  factory ShipCargo.fromJson(Map<String, dynamic> json) {
    return ShipCargo(
      capacity: json['capacity'] as int,
      units: json['units'] as int,
      inventory:
          (json['inventory'] as List<dynamic>)
              .map<ShipCargoItem>(
                (e) => ShipCargoItem.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
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

  final int capacity;
  final int units;
  final List<ShipCargoItem> inventory;

  Map<String, dynamic> toJson() {
    return {
      'capacity': capacity,
      'units': units,
      'inventory': inventory.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(capacity, units, inventory);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipCargo &&
        capacity == other.capacity &&
        units == other.units &&
        listsEqual(inventory, other.inventory);
  }
}
