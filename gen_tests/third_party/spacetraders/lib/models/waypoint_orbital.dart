import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template waypoint_orbital}
/// An orbital is another waypoint that orbits a parent waypoint.
/// {@endtemplate}
@immutable
class WaypointOrbital {
  /// {@macro waypoint_orbital}
  const WaypointOrbital({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [WaypointOrbital].
  factory WaypointOrbital.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WaypointOrbital',
      json,
      () => WaypointOrbital(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WaypointOrbital? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WaypointOrbital.fromJson(json);
  }

  /// The symbol of the orbiting waypoint.
  final String symbol;

  /// Converts a [WaypointOrbital] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaypointOrbital && symbol == other.symbol;
  }
}
