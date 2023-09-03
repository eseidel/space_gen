class ShipRequirements {
  ShipRequirements({
    required this.power,
    required this.crew,
    required this.slots,
  });

  factory ShipRequirements.fromJson(Map<String, dynamic> json) {
    return ShipRequirements(
      power: json['power'] as int,
      crew: json['crew'] as int,
      slots: json['slots'] as int,
    );
  }

  final int power;
  final int crew;
  final int slots;

  Map<String, dynamic> toJson() {
    return {
      'power': power,
      'crew': crew,
      'slots': slots,
    };
  }
}
