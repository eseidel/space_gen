import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/waypoint_symbol.dart';

/// {@template chart}
/// The chart of a system or waypoint, which makes the location visible to other
/// agents.
/// {@endtemplate}
@immutable
class Chart {
  /// {@macro chart}
  const Chart({
    required this.waypointSymbol,
    required this.submittedBy,
    required this.submittedOn,
  });

  /// Converts a `Map<String, dynamic>` to a [Chart].
  factory Chart.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Chart',
      json,
      () => Chart(
        waypointSymbol: WaypointSymbol.fromJson(
          json['waypointSymbol'] as String,
        ),
        submittedBy: json['submittedBy'] as String,
        submittedOn: DateTime.parse(json['submittedOn'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Chart? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Chart.fromJson(json);
  }

  /// The symbol of the waypoint.
  final WaypointSymbol waypointSymbol;

  /// The agent that submitted the chart for this waypoint.
  final String submittedBy;

  /// The time the chart for this waypoint was submitted.
  final DateTime submittedOn;

  /// Converts a [Chart] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol.toJson(),
      'submittedBy': submittedBy,
      'submittedOn': submittedOn.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([waypointSymbol, submittedBy, submittedOn]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Chart &&
        waypointSymbol == other.waypointSymbol &&
        submittedBy == other.submittedBy &&
        submittedOn == other.submittedOn;
  }
}
