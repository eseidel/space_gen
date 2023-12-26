import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/siphon.dart';

class SiphonResources201ResponseData {
  SiphonResources201ResponseData({
    required this.cooldown,
    required this.siphon,
    required this.cargo,
  });

  factory SiphonResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return SiphonResources201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      siphon: Siphon.fromJson(json['siphon'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final Cooldown cooldown;
  final Siphon siphon;
  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'siphon': siphon.toJson(),
      'cargo': cargo.toJson(),
    };
  }
}
