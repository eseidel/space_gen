import 'package:meta/meta.dart';
import 'package:spacetraders/model/chart.dart';
import 'package:spacetraders/model/waypoint_faction.dart';
import 'package:spacetraders/model/waypoint_modifier.dart';
import 'package:spacetraders/model/waypoint_orbital.dart';
import 'package:spacetraders/model/waypoint_trait.dart';
import 'package:spacetraders/model/waypoint_type.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class Waypoint {
  const Waypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    required this.isUnderConstruction,
    this.orbitals = const [],
    this.orbits,
    this.faction,
    this.traits = const [],
    this.modifiers = const [],
    this.chart,
  });

  factory Waypoint.fromJson(Map<String, dynamic> json) {
    return Waypoint(
      symbol: json['symbol'] as String,
      type: WaypointType.fromJson(json['type'] as String),
      systemSymbol: json['systemSymbol'] as String,
      x: json['x'] as int,
      y: json['y'] as int,
      orbitals:
          (json['orbitals'] as List<dynamic>)
              .map<WaypointOrbital>(
                (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      orbits: json['orbits'] as String?,
      faction: WaypointFaction.maybeFromJson(
        json['faction'] as Map<String, dynamic>?,
      ),
      traits:
          (json['traits'] as List<dynamic>)
              .map<WaypointTrait>(
                (e) => WaypointTrait.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      modifiers:
          (json['modifiers'] as List<dynamic>)
              .map<WaypointModifier>(
                (e) => WaypointModifier.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      chart: Chart.maybeFromJson(json['chart'] as Map<String, dynamic>?),
      isUnderConstruction: json['isUnderConstruction'] as bool,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Waypoint? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Waypoint.fromJson(json);
  }

  final String symbol;
  final WaypointType type;
  final String systemSymbol;
  final int x;
  final int y;
  final List<WaypointOrbital> orbitals;
  final String? orbits;
  final WaypointFaction? faction;
  final List<WaypointTrait> traits;
  final List<WaypointModifier>? modifiers;
  final Chart? chart;
  final bool isUnderConstruction;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type.toJson(),
      'systemSymbol': systemSymbol,
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'orbits': orbits,
      'faction': faction?.toJson(),
      'traits': traits.map((e) => e.toJson()).toList(),
      'modifiers': modifiers?.map((e) => e.toJson()).toList(),
      'chart': chart?.toJson(),
      'isUnderConstruction': isUnderConstruction,
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
    orbits,
    faction,
    traits,
    modifiers,
    chart,
    isUnderConstruction,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Waypoint &&
        symbol == other.symbol &&
        type == other.type &&
        systemSymbol == other.systemSymbol &&
        x == other.x &&
        y == other.y &&
        listsEqual(orbitals, other.orbitals) &&
        orbits == other.orbits &&
        faction == other.faction &&
        listsEqual(traits, other.traits) &&
        listsEqual(modifiers, other.modifiers) &&
        chart == other.chart &&
        isUnderConstruction == other.isUnderConstruction;
  }
}
