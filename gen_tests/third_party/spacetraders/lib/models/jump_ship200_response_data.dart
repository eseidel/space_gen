import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/market_transaction.dart';
import 'package:spacetraders/models/ship_nav.dart';

@immutable
class JumpShip200ResponseData {
  const JumpShip200ResponseData({
    required this.nav,
    required this.cooldown,
    required this.transaction,
    required this.agent,
  });

  /// Converts a `Map<String, dynamic>` to a [JumpShip200ResponseData].
  factory JumpShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'JumpShip200ResponseData',
      json,
      () => JumpShip200ResponseData(
        nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
        transaction: MarketTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JumpShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JumpShip200ResponseData.fromJson(json);
  }

  /// The navigation information of the ship.
  final ShipNav nav;

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// Result of a transaction with a market.
  final MarketTransaction transaction;

  /// Agent details.
  final Agent agent;

  /// Converts a [JumpShip200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
      'cooldown': cooldown.toJson(),
      'transaction': transaction.toJson(),
      'agent': agent.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([nav, cooldown, transaction, agent]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JumpShip200ResponseData &&
        nav == other.nav &&
        cooldown == other.cooldown &&
        transaction == other.transaction &&
        agent == other.agent;
  }
}
