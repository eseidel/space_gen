import 'package:meta/meta.dart';
import 'package:spacetraders/model/chart.dart';
import 'package:spacetraders/model/waypoint_faction.dart';
import 'package:spacetraders/model/waypoint_orbital.dart';
import 'package:spacetraders/model/waypoint_trait.dart';
import 'package:spacetraders/model/waypoint_type.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ScannedWaypoint {
  const ScannedWaypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    this.orbitals = const [],
    this.faction,
    this.traits = const [],
    this.chart,
  });

  factory ScannedWaypoint.fromJson(Map<String, dynamic> json) {
    return ScannedWaypoint(
      symbol: json['symbol'] as String,
      type: WaypointType.fromJson(json['type'] as String),
      systemSymbol: json['systemSymbol'] as String,
      x: json['x'] as int,
      y: json['y'] as int,
      orbitals: (json['orbitals'] as List)
          .map<WaypointOrbital>(
            (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      faction: WaypointFaction.maybeFromJson(
        json['faction'] as Map<String, dynamic>?,
      ),
      traits: (json['traits'] as List)
          .map<WaypointTrait>(
            (e) => WaypointTrait.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      chart: Chart.maybeFromJson(json['chart'] as Map<String, dynamic>?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedWaypoint? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedWaypoint.fromJson(json);
  }

  final String symbol;
  final WaypointType type;
  final String systemSymbol;
  final int x;
  final int y;
  final List<WaypointOrbital> orbitals;
  final WaypointFaction? faction;
  final List<WaypointTrait> traits;
  final Chart? chart;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type.toJson(),
      'systemSymbol': systemSymbol,
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'faction': faction?.toJson(),
      'traits': traits.map((e) => e.toJson()).toList(),
      'chart': chart?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hash(
    symbol,
    type,
    systemSymbol,
    x,
    y,
    orbitals,
    faction,
    traits,
    chart,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedWaypoint &&
        symbol == other.symbol &&
        type == other.type &&
        systemSymbol == other.systemSymbol &&
        x == other.x &&
        y == other.y &&
        listsEqual(orbitals, other.orbitals) &&
        faction == other.faction &&
        listsEqual(traits, other.traits) &&
        chart == other.chart;
  }
}
