class GetStatus200ResponseStats {
  GetStatus200ResponseStats({
    required this.accounts,
    required this.agents,
    required this.ships,
    required this.systems,
    required this.waypoints,
  });

  factory GetStatus200ResponseStats.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseStats(
      accounts: json['accounts'] as int,
      agents: json['agents'] as int,
      ships: json['ships'] as int,
      systems: json['systems'] as int,
      waypoints: json['waypoints'] as int,
    );
  }

  final int accounts;
  final int agents;
  final int ships;
  final int systems;
  final int waypoints;

  Map<String, dynamic> toJson() {
    return {
      'accounts': accounts,
      'agents': agents,
      'ships': ships,
      'systems': systems,
      'waypoints': waypoints,
    };
  }
}
