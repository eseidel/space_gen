import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/chart.dart';
import 'package:spacetraders/models/system_symbol.dart';
import 'package:spacetraders/models/waypoint_faction.dart';
import 'package:spacetraders/models/waypoint_modifier.dart';
import 'package:spacetraders/models/waypoint_orbital.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';
import 'package:spacetraders/models/waypoint_trait.dart';
import 'package:spacetraders/models/waypoint_type.dart';

/// {@template waypoint}
/// A waypoint is a location that ships can travel to such as a Planet, Moon or
/// Space Station.
/// {@endtemplate}
@immutable
class Waypoint {
  /// {@macro waypoint}
  Waypoint({
    required this.symbol,
    required this.type,
    required this.systemSymbol,
    required this.x,
    required this.y,
    required this.orbitals,
    required this.traits,
    required this.isUnderConstruction,
    this.orbits,
    this.faction,
    this.modifiers,
    this.chart,
  }) {
    orbits?.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [Waypoint].
  factory Waypoint.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Waypoint',
      json,
      () => Waypoint(
        symbol: WaypointSymbol.fromJson(json['symbol'] as String),
        type: WaypointType.fromJson(json['type'] as String),
        systemSymbol: SystemSymbol.fromJson(json['systemSymbol'] as String),
        x: json['x'] as int,
        y: json['y'] as int,
        orbitals: (json['orbitals'] as List)
            .map<WaypointOrbital>(
              (e) => WaypointOrbital.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        orbits: json['orbits'] as String?,
        faction: WaypointFaction.maybeFromJson(
          json['faction'] as Map<String, dynamic>?,
        ),
        traits: (json['traits'] as List)
            .map<WaypointTrait>(
              (e) => WaypointTrait.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        modifiers: (json['modifiers'] as List?)
            ?.map<WaypointModifier>(
              (e) => WaypointModifier.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        chart: Chart.maybeFromJson(json['chart'] as Map<String, dynamic>?),
        isUnderConstruction: json['isUnderConstruction'] as bool,
      ),
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

  /// The symbol of the waypoint.
  final WaypointSymbol symbol;

  /// The type of waypoint.
  final WaypointType type;

  /// The symbol of the system.
  final SystemSymbol systemSymbol;

  /// Relative position of the waypoint on the system's x axis. This is not an
  /// absolute position in the universe.
  final int x;

  /// Relative position of the waypoint on the system's y axis. This is not an
  /// absolute position in the universe.
  final int y;

  /// Waypoints that orbit this waypoint.
  final List<WaypointOrbital> orbitals;

  /// The symbol of the parent waypoint, if this waypoint is in orbit around
  /// another waypoint. Otherwise this value is undefined.
  final String? orbits;

  /// The faction that controls the waypoint.
  final WaypointFaction? faction;

  /// The traits of the waypoint.
  final List<WaypointTrait> traits;

  /// The modifiers of the waypoint.
  final List<WaypointModifier>? modifiers;

  /// The chart of a system or waypoint, which makes the location visible to
  /// other agents.
  final Chart? chart;

  /// True if the waypoint is under construction.
  final bool isUnderConstruction;

  /// Converts a [Waypoint] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'type': type.toJson(),
      'systemSymbol': systemSymbol.toJson(),
      'x': x,
      'y': y,
      'orbitals': orbitals.map((e) => e.toJson()).toList(),
      'orbits': ?orbits,
      'faction': ?faction?.toJson(),
      'traits': traits.map((e) => e.toJson()).toList(),
      'modifiers': ?modifiers?.map((e) => e.toJson()).toList(),
      'chart': ?chart?.toJson(),
      'isUnderConstruction': isUnderConstruction,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    type,
    systemSymbol,
    x,
    y,
    listHash(orbitals),
    orbits,
    faction,
    listHash(traits),
    listHash(modifiers),
    chart,
    isUnderConstruction,
  ]);

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
