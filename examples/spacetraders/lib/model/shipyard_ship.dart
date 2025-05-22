import 'package:spacetraders/model/activity_level.dart';
import 'package:spacetraders/model/ship_engine.dart';
import 'package:spacetraders/model/ship_frame.dart';
import 'package:spacetraders/model/ship_module.dart';
import 'package:spacetraders/model/ship_mount.dart';
import 'package:spacetraders/model/ship_reactor.dart';
import 'package:spacetraders/model/ship_type.dart';
import 'package:spacetraders/model/supply_level.dart';

class ShipyardShip {
  ShipyardShip({
    required this.type,
    required this.name,
    required this.description,
    required this.activity,
    required this.supply,
    required this.purchasePrice,
    required this.frame,
    required this.reactor,
    required this.engine,
    required this.modules,
    required this.mounts,
    required this.crew,
  });

  factory ShipyardShip.fromJson(Map<String, dynamic> json) {
    return ShipyardShip(
      type: ShipType.fromJson(json['type'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      activity: ActivityLevel.fromJson(json['activity'] as String),
      supply: SupplyLevel.fromJson(json['supply'] as String),
      purchasePrice: json['purchasePrice'] as int,
      frame: ShipFrame.fromJson(json['frame'] as Map<String, dynamic>),
      reactor: ShipReactor.fromJson(json['reactor'] as Map<String, dynamic>),
      engine: ShipEngine.fromJson(json['engine'] as Map<String, dynamic>),
      modules:
          (json['modules'] as List<dynamic>)
              .map<ShipModule>(
                (e) => ShipModule.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      mounts:
          (json['mounts'] as List<dynamic>)
              .map<ShipMount>(
                (e) => ShipMount.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      crew: ShipyardShipCrew.fromJson(json['crew'] as Map<String, dynamic>),
    );
  }

  final ShipType type;
  final String name;
  final String description;
  final ActivityLevel activity;
  final SupplyLevel supply;
  final int purchasePrice;
  final ShipFrame frame;
  final ShipReactor reactor;
  final ShipEngine engine;
  final List<ShipModule> modules;
  final List<ShipMount> mounts;
  final ShipyardShipCrew crew;

  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'description': description,
      'activity': activity.toJson(),
      'supply': supply.toJson(),
      'purchasePrice': purchasePrice,
      'frame': frame.toJson(),
      'reactor': reactor.toJson(),
      'engine': engine.toJson(),
      'modules': modules.map((e) => e.toJson()).toList(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'crew': crew.toJson(),
    };
  }
}

class ShipyardShipCrew {
  ShipyardShipCrew({required this.required, required this.capacity});

  factory ShipyardShipCrew.fromJson(Map<String, dynamic> json) {
    return ShipyardShipCrew(
      required: json['required'] as int,
      capacity: json['capacity'] as int,
    );
  }

  final int required;
  final int capacity;

  Map<String, dynamic> toJson() {
    return {'required': required, 'capacity': capacity};
  }
}
