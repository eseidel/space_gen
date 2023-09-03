import 'package:spacetraders/src/model/connected_system.dart';

class JumpGate {
  JumpGate({
    required this.jumpRange,
    required this.factionSymbol,
    required this.connectedSystems,
  });

  factory JumpGate.fromJson(Map<String, dynamic> json) {
    return JumpGate(
      jumpRange: json['jumpRange'] as double,
      factionSymbol: json['factionSymbol'] as String,
      connectedSystems: (json['connectedSystems'] as List<dynamic>)
          .map<ConnectedSystem>(
              (e) => ConnectedSystem.fromJson(e as Map<String, dynamic>),)
          .toList(),
    );
  }

  final double jumpRange;
  final String factionSymbol;
  final List<ConnectedSystem> connectedSystems;

  Map<String, dynamic> toJson() {
    return {
      'jumpRange': jumpRange,
      'factionSymbol': factionSymbol,
      'connectedSystems': connectedSystems.map((e) => e.toJson()).toList(),
    };
  }
}
