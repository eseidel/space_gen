import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/market_transaction.dart';
import 'package:spacetraders/models/ship_cargo.dart';

@immutable
class SellCargo201ResponseData {
  const SellCargo201ResponseData({
    required this.cargo,
    required this.transaction,
    required this.agent,
  });

  /// Converts a `Map<String, dynamic>` to a [SellCargo201ResponseData].
  factory SellCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SellCargo201ResponseData',
      json,
      () => SellCargo201ResponseData(
        cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        transaction: MarketTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SellCargo201ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SellCargo201ResponseData.fromJson(json);
  }

  /// Ship cargo details.
  final ShipCargo cargo;

  /// Result of a transaction with a market.
  final MarketTransaction transaction;

  /// Agent details.
  final Agent agent;

  /// Converts a [SellCargo201ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
      'agent': agent.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([cargo, transaction, agent]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SellCargo201ResponseData &&
        cargo == other.cargo &&
        transaction == other.transaction &&
        agent == other.agent;
  }
}
