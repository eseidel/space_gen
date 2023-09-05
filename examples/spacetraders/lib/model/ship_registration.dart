import 'package:spacetraders/model/ship_role.dart';

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
      role: ShipRole.fromJson(json['role'] as String),
    );
  }

  final String name;
  final String factionSymbol;
  final ShipRole role;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'factionSymbol': factionSymbol,
      'role': role.toJson(),
    };
  }
}
