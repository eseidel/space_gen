import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/market_transaction.dart';
import 'package:spacetraders/models/ship_cargo.dart';
import 'package:spacetraders/models/ship_fuel.dart';

@immutable
class RefuelShip200ResponseData {
  const RefuelShip200ResponseData({
    required this.agent,
    required this.fuel,
    required this.transaction,
    this.cargo,
  });

  /// Converts a `Map<String, dynamic>` to a [RefuelShip200ResponseData].
  factory RefuelShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RefuelShip200ResponseData',
      json,
      () => RefuelShip200ResponseData(
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
        cargo: ShipCargo.maybeFromJson(json['cargo'] as Map<String, dynamic>?),
        transaction: MarketTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RefuelShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RefuelShip200ResponseData.fromJson(json);
  }

  /// Agent details.
  final Agent agent;

  /// Details of the ship's fuel tanks including how much fuel was consumed
  /// during the last transit or action.
  final ShipFuel fuel;

  /// Ship cargo details.
  final ShipCargo? cargo;

  /// Result of a transaction with a market.
  final MarketTransaction transaction;

  /// Converts a [RefuelShip200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'fuel': fuel.toJson(),
      'cargo': cargo?.toJson(),
      'transaction': transaction.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([agent, fuel, cargo, transaction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefuelShip200ResponseData &&
        agent == other.agent &&
        fuel == other.fuel &&
        cargo == other.cargo &&
        transaction == other.transaction;
  }
}
