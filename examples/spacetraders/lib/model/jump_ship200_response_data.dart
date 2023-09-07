import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_nav.dart';

class JumpShip200ResponseData {
  JumpShip200ResponseData({
    required this.cooldown,
    required this.nav,
  });

  factory JumpShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return JumpShip200ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final Cooldown cooldown;
  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'nav': nav.toJson(),
    };
  }
}
