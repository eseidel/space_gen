import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/repair_transaction.dart';
import 'package:spacetraders/models/ship.dart';

@immutable
class RepairShip200ResponseData {
  const RepairShip200ResponseData({
    required this.agent,
    required this.ship,
    required this.transaction,
  });

  /// Converts a `Map<String, dynamic>` to a [RepairShip200ResponseData].
  factory RepairShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepairShip200ResponseData',
      json,
      () => RepairShip200ResponseData(
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
        transaction: RepairTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepairShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepairShip200ResponseData.fromJson(json);
  }

  /// Agent details.
  final Agent agent;

  /// Ship details.
  final Ship ship;

  /// Result of a repair transaction.
  final RepairTransaction transaction;

  /// Converts a [RepairShip200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'ship': ship.toJson(),
      'transaction': transaction.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([agent, ship, transaction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepairShip200ResponseData &&
        agent == other.agent &&
        ship == other.ship &&
        transaction == other.transaction;
  }
}
