import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_crew_rotation.dart';

/// {@template ship_crew}
/// The ship's crew service and maintain the ship's systems and equipment.
/// {@endtemplate}
@immutable
class ShipCrew {
  /// {@macro ship_crew}
  const ShipCrew({
    required this.current,
    required this.required_,
    required this.capacity,
    required this.morale,
    required this.wages,
    this.rotation = .strict,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipCrew].
  factory ShipCrew.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipCrew',
      json,
      () => ShipCrew(
        current: json['current'] as int,
        required_: json['required'] as int,
        capacity: json['capacity'] as int,
        rotation: ShipCrewRotation.fromJson(json['rotation'] as String),
        morale: json['morale'] as int,
        wages: json['wages'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipCrew? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipCrew.fromJson(json);
  }

  /// The current number of crew members on the ship.
  final int current;

  /// The minimum number of crew members required to maintain the ship.
  final int required_;

  /// The maximum number of crew members the ship can support.
  final int capacity;

  /// The rotation of crew shifts. A stricter shift improves the ship's
  /// performance. A more relaxed shift improves the crew's morale.
  final ShipCrewRotation rotation;

  /// A rough measure of the crew's morale. A higher morale means the crew is
  /// happier and more productive. A lower morale means the ship is more prone
  /// to accidents.
  final int morale;

  /// The amount of credits per crew member paid per hour. Wages are paid when
  /// a ship docks at a civilized waypoint.
  final int wages;

  /// Converts a [ShipCrew] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'required': required_,
      'capacity': capacity,
      'rotation': rotation.toJson(),
      'morale': morale,
      'wages': wages,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([current, required_, capacity, rotation, morale, wages]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipCrew &&
        current == other.current &&
        required_ == other.required_ &&
        capacity == other.capacity &&
        rotation == other.rotation &&
        morale == other.morale &&
        wages == other.wages;
  }
}
