import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_nav.dart';

class JumpShip200Response {
  JumpShip200Response({
    required this.data,
  });

  factory JumpShip200Response.fromJson(Map<String, dynamic> json) {
    return JumpShip200Response(
      data: JumpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final JumpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

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
