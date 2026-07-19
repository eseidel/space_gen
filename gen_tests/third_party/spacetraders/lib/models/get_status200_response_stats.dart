import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseStats {
  const GetStatus200ResponseStats({
    required this.agents,
    required this.ships,
    required this.systems,
    required this.waypoints,
    this.accounts,
  });

  /// Converts a `Map<String, dynamic>` to a [GetStatus200ResponseStats].
  factory GetStatus200ResponseStats.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetStatus200ResponseStats',
      json,
      () => GetStatus200ResponseStats(
        accounts: json['accounts'] as int?,
        agents: json['agents'] as int,
        ships: json['ships'] as int,
        systems: json['systems'] as int,
        waypoints: json['waypoints'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseStats? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseStats.fromJson(json);
  }

  /// Total number of accounts registered on the game server.
  final int? accounts;

  /// Number of registered agents in the game.
  final int agents;

  /// Total number of ships in the game.
  final int ships;

  /// Total number of systems in the game.
  final int systems;

  /// Total number of waypoints in the game.
  final int waypoints;

  /// Converts a [GetStatus200ResponseStats] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (accounts != null) 'accounts': accounts,
      'agents': agents,
      'ships': ships,
      'systems': systems,
      'waypoints': waypoints,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([accounts, agents, ships, systems, waypoints]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseStats &&
        accounts == other.accounts &&
        agents == other.agents &&
        ships == other.ships &&
        systems == other.systems &&
        waypoints == other.waypoints;
  }
}
