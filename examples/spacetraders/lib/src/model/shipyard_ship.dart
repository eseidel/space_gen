import 'package:spacetraders/src/model/ship_engine.dart';
import 'package:spacetraders/src/model/ship_frame.dart';
import 'package:spacetraders/src/model/ship_module.dart';
import 'package:spacetraders/src/model/ship_mount.dart';
import 'package:spacetraders/src/model/ship_reactor.dart';

class ShipyardShip {
  ShipyardShip({
    required this.type,
    required this.name,
    required this.description,
    required this.purchasePrice,
    required this.frame,
    required this.reactor,
    required this.engine,
    required this.modules,
    required this.mounts,
  });

  factory ShipyardShip.fromJson(Map<String, dynamic> json) {
    return ShipyardShip(
      type: json['type'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      purchasePrice: json['purchasePrice'] as int,
      frame: ShipFrame.fromJson(json['frame'] as Map<String, dynamic>),
      reactor: ShipReactor.fromJson(json['reactor'] as Map<String, dynamic>),
      engine: ShipEngine.fromJson(json['engine'] as Map<String, dynamic>),
      modules: (json['modules'] as List<dynamic>)
          .map<ShipModule>(
              (e) => ShipModule.fromJson(e as Map<String, dynamic>),)
          .toList(),
      mounts: (json['mounts'] as List<dynamic>)
          .map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final String type;
  final String name;
  final String description;
  final int purchasePrice;
  final ShipFrame frame;
  final ShipReactor reactor;
  final ShipEngine engine;
  final List<ShipModule> modules;
  final List<ShipMount> mounts;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'description': description,
      'purchasePrice': purchasePrice,
      'frame': frame.toJson(),
      'reactor': reactor.toJson(),
      'engine': engine.toJson(),
      'modules': modules.map((e) => e.toJson()).toList(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
    };
  }
}
