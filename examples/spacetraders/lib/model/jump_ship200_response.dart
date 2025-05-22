import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/ship_nav.dart';

class JumpShip200Response {
  JumpShip200Response({required this.data});

  factory JumpShip200Response.fromJson(Map<String, dynamic> json) {
    return JumpShip200Response(
      data: JumpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final JumpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class JumpShip200ResponseData {
  JumpShip200ResponseData({
    required this.nav,
    required this.cooldown,
    required this.transaction,
    required this.agent,
  });

  factory JumpShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return JumpShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );
  }

  final ShipNav nav;
  final Cooldown cooldown;
  final MarketTransaction transaction;
  final Agent agent;

  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
      'cooldown': cooldown.toJson(),
      'transaction': transaction.toJson(),
      'agent': agent.toJson(),
    };
  }
}
