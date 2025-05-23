class ShipyardShipCrew {
  ShipyardShipCrew({required this.required_, required this.capacity});

  factory ShipyardShipCrew.fromJson(Map<String, dynamic> json) {
    return ShipyardShipCrew(
      required_: json['required'] as int,
      capacity: json['capacity'] as int,
    );
  }

  final int required_;
  final int capacity;

  Map<String, dynamic> toJson() {
    return {'required_': required_, 'capacity': capacity};
  }
}
