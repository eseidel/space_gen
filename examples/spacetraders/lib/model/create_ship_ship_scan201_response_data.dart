import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/scanned_ship.dart';

class CreateShipShipScan201ResponseData {
  CreateShipShipScan201ResponseData({
    required this.cooldown,
    required this.ships,
  });

  factory CreateShipShipScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipShipScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      ships: (json['ships'] as List<dynamic>)
          .map<ScannedShip>(
            (e) => ScannedShip.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final Cooldown cooldown;
  final List<ScannedShip> ships;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }
}
