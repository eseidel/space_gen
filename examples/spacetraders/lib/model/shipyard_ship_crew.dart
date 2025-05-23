class ShipyardShipCrew {
  ShipyardShipCrew({required this.required, required this.capacity});

  factory ShipyardShipCrew.fromJson(Map<String, dynamic> json) {
    return ShipyardShipCrew(
      required: json['required'] as int,
      capacity: json['capacity'] as int,
    );
  }

  final int required;
  final int capacity;

  Map<String, dynamic> toJson() {
    return {'required': required, 'capacity': capacity};
  }
}
