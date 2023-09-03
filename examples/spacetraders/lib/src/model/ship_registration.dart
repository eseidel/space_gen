class ShipRegistration {
  ShipRegistration({
    required this.name,
    required this.factionSymbol,
    required this.role,
  });

  factory ShipRegistration.fromJson(Map<String, dynamic> json) {
    return ShipRegistration(
      name: json['name'] as String,
      factionSymbol: json['factionSymbol'] as String,
      role: json['role'] as String,
    );
  }

  final String name;
  final String factionSymbol;
  final String role;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'factionSymbol': factionSymbol,
      'role': role,
    };
  }
}
