import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ShipyardShipCrew {
  const ShipyardShipCrew({required this.required_, required this.capacity});

  /// Converts a `Map<String, dynamic>` to a [ShipyardShipCrew].
  factory ShipyardShipCrew.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipyardShipCrew',
      json,
      () => ShipyardShipCrew(
        required_: json['required'] as int,
        capacity: json['capacity'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardShipCrew? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardShipCrew.fromJson(json);
  }

  /// The minimum number of crew members required to maintain the ship.
  final int required_;

  /// The maximum number of crew members the ship can support.
  final int capacity;

  /// Converts a [ShipyardShipCrew] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'required': required_, 'capacity': capacity};
  }

  @override
  int get hashCode => Object.hashAll([required_, capacity]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipyardShipCrew &&
        required_ == other.required_ &&
        capacity == other.capacity;
  }
}
