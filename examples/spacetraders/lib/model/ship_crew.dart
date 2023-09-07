class ShipCrew {
  ShipCrew({
    required this.current,
    required this.required,
    required this.capacity,
    required this.rotation,
    required this.morale,
    required this.wages,
  });

  factory ShipCrew.fromJson(Map<String, dynamic> json) {
    return ShipCrew(
      current: json['current'] as int,
      required: json['required'] as int,
      capacity: json['capacity'] as int,
      rotation: ShipCrewRotationInner.fromJson(json['rotation'] as String),
      morale: json['morale'] as int,
      wages: json['wages'] as int,
    );
  }

  final int current;
  final int required;
  final int capacity;
  final ShipCrewRotationInner rotation;
  final int morale;
  final int wages;

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'required': required,
      'capacity': capacity,
      'rotation': rotation.toJson(),
      'morale': morale,
      'wages': wages,
    };
  }
}

enum ShipCrewRotationInner {
  strict('STRICT'),
  relaxed('RELAXED'),
  ;

  const ShipCrewRotationInner(this.value);

  factory ShipCrewRotationInner.fromJson(String json) {
    return ShipCrewRotationInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw Exception('Unknown ShipCrewRotationInner value: $json'),
    );
  }

  final String value;

  String toJson() => value;
}
