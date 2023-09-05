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
      rotation: ShipCrewRotationString.fromJson(json['rotation'] as String),
      morale: json['morale'] as int,
      wages: json['wages'] as int,
    );
  }

  final int current;
  final int required;
  final int capacity;
  final ShipCrewRotationString rotation;
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

enum ShipCrewRotationString {
  strict('STRICT'),
  relaxed('RELAXED'),
  ;

  const ShipCrewRotationString(this.value);

  factory ShipCrewRotationString.fromJson(String json) {
    switch (json) {
      case 'STRICT':
        return ShipCrewRotationString.strict;
      case 'RELAXED':
        return ShipCrewRotationString.relaxed;
      default:
        throw Exception('Unknown ShipCrewRotationString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipCrewRotationString.strict:
        return 'STRICT';
      case ShipCrewRotationString.relaxed:
        return 'RELAXED';
    }
  }
}
