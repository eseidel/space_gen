import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/ship.dart';
import 'package:spacetraders/models/shipyard_transaction.dart';

@immutable
class PurchaseShip201ResponseData {
  const PurchaseShip201ResponseData({
    required this.ship,
    required this.agent,
    required this.transaction,
  });

  /// Converts a `Map<String, dynamic>` to a [PurchaseShip201ResponseData].
  factory PurchaseShip201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PurchaseShip201ResponseData',
      json,
      () => PurchaseShip201ResponseData(
        ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        transaction: ShipyardTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PurchaseShip201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PurchaseShip201ResponseData.fromJson(json);
  }

  /// Ship details.
  final Ship ship;

  /// Agent details.
  final Agent agent;

  /// Results of a transaction with a shipyard.
  final ShipyardTransaction transaction;

  /// Converts a [PurchaseShip201ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'ship': ship.toJson(),
      'agent': agent.toJson(),
      'transaction': transaction.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([ship, agent, transaction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PurchaseShip201ResponseData &&
        ship == other.ship &&
        agent == other.agent &&
        transaction == other.transaction;
  }
}
