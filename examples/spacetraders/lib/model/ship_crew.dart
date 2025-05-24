import 'package:spacetraders/model/ship_crew_rotation.dart';

class ShipCrew {
  ShipCrew({
    required this.current,
    required this.required_,
    required this.capacity,
    required this.morale,
    required this.wages,
    this.rotation = ShipCrewRotation.STRICT,
  });

  factory ShipCrew.fromJson(Map<String, dynamic> json) {
    return ShipCrew(
      current: json['current'] as int,
      required_: json['required'] as int,
      capacity: json['capacity'] as int,
      rotation: ShipCrewRotation.fromJson(json['rotation'] as String),
      morale: json['morale'] as int,
      wages: json['wages'] as int,
    );
  }

  final int current;
  final int required_;
  final int capacity;
  final ShipCrewRotation rotation;
  final int morale;
  final int wages;

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'required_': required_,
      'capacity': capacity,
      'rotation': rotation.toJson(),
      'morale': morale,
      'wages': wages,
    };
  }
}
