import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/chart.dart';
import 'package:spacetraders/models/chart_transaction.dart';
import 'package:spacetraders/models/waypoint.dart';

@immutable
class CreateChart201ResponseData {
  const CreateChart201ResponseData({
    required this.chart,
    required this.waypoint,
    required this.transaction,
    required this.agent,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateChart201ResponseData].
  factory CreateChart201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateChart201ResponseData',
      json,
      () => CreateChart201ResponseData(
        chart: Chart.fromJson(json['chart'] as Map<String, dynamic>),
        waypoint: Waypoint.fromJson(json['waypoint'] as Map<String, dynamic>),
        transaction: ChartTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateChart201ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateChart201ResponseData.fromJson(json);
  }

  /// The chart of a system or waypoint, which makes the location visible to
  /// other agents.
  final Chart chart;

  /// A waypoint is a location that ships can travel to such as a Planet, Moon
  /// or Space Station.
  final Waypoint waypoint;

  /// Result of a chart transaction.
  final ChartTransaction transaction;

  /// Agent details.
  final Agent agent;

  /// Converts a [CreateChart201ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'chart': chart.toJson(),
      'waypoint': waypoint.toJson(),
      'transaction': transaction.toJson(),
      'agent': agent.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([chart, waypoint, transaction, agent]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateChart201ResponseData &&
        chart == other.chart &&
        waypoint == other.waypoint &&
        transaction == other.transaction &&
        agent == other.agent;
  }
}
