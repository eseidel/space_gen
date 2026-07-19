import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/faction_symbol.dart';

/// {@template waypoint_faction}
/// The faction that controls the waypoint.
/// {@endtemplate}
@immutable
class WaypointFaction {
  /// {@macro waypoint_faction}
  const WaypointFaction({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [WaypointFaction].
  factory WaypointFaction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WaypointFaction',
      json,
      () => WaypointFaction(
        symbol: FactionSymbol.fromJson(json['symbol'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointFaction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WaypointFaction.fromJson(json);
  }

  /// The symbol of the faction.
  final FactionSymbol symbol;

  /// Converts a [WaypointFaction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol.toJson()};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaypointFaction && symbol == other.symbol;
  }
}
