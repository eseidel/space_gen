import 'package:meta/meta.dart';
import 'package:spacetraders/model/activity_level.dart';
import 'package:spacetraders/model/ship_engine.dart';
import 'package:spacetraders/model/ship_frame.dart';
import 'package:spacetraders/model/ship_module.dart';
import 'package:spacetraders/model/ship_mount.dart';
import 'package:spacetraders/model/ship_reactor.dart';
import 'package:spacetraders/model/ship_type.dart';
import 'package:spacetraders/model/shipyard_ship_crew.dart';
import 'package:spacetraders/model/supply_level.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ShipyardShip {
  const ShipyardShip({
    required this.type,
    required this.name,
    required this.description,
    required this.supply,
    required this.purchasePrice,
    required this.frame,
    required this.reactor,
    required this.engine,
    required this.crew,
    this.activity,
    this.modules = const [],
    this.mounts = const [],
  });

  factory ShipyardShip.fromJson(Map<String, dynamic> json) {
    return ShipyardShip(
      type: ShipType.fromJson(json['type'] as String),
      name: json['name'] as String,
      description: json['description'] as String,
      activity: ActivityLevel.maybeFromJson(json['activity'] as String?),
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

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipyardShip? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipyardShip.fromJson(json);
  }

  final ShipType type;
  final String name;
  final String description;
  final ActivityLevel? activity;
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
      'activity': activity?.toJson(),
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

  @override
  int get hashCode => Object.hash(
    type,
    name,
    description,
    activity,
    supply,
    purchasePrice,
    frame,
    reactor,
    engine,
    modules,
    mounts,
    crew,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipyardShip &&
        type == other.type &&
        name == other.name &&
        description == other.description &&
        activity == other.activity &&
        supply == other.supply &&
        purchasePrice == other.purchasePrice &&
        frame == other.frame &&
        reactor == other.reactor &&
        engine == other.engine &&
        listsEqual(modules, other.modules) &&
        listsEqual(mounts, other.mounts) &&
        crew == other.crew;
  }
}
