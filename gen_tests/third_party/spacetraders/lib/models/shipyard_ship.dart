import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/activity_level.dart';
import 'package:spacetraders/models/ship_engine.dart';
import 'package:spacetraders/models/ship_frame.dart';
import 'package:spacetraders/models/ship_module.dart';
import 'package:spacetraders/models/ship_mount.dart';
import 'package:spacetraders/models/ship_reactor.dart';
import 'package:spacetraders/models/ship_type.dart';
import 'package:spacetraders/models/shipyard_ship_crew.dart';
import 'package:spacetraders/models/supply_level.dart';

/// {@template shipyard_ship}
/// Ship details available at a shipyard.
/// {@endtemplate}
@immutable
class ShipyardShip {
  /// {@macro shipyard_ship}
  const ShipyardShip({
    required this.type,
    required this.name,
    required this.description,
    required this.supply,
    required this.purchasePrice,
    required this.frame,
    required this.reactor,
    required this.engine,
    required this.modules,
    required this.mounts,
    required this.crew,
    this.activity,
  });

  /// Converts a `Map<String, dynamic>` to a [ShipyardShip].
  factory ShipyardShip.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipyardShip',
      json,
      () => ShipyardShip(
        type: ShipType.fromJson(json['type'] as String),
        name: json['name'] as String,
        description: json['description'] as String,
        activity: ActivityLevel.maybeFromJson(json['activity'] as String?),
        supply: SupplyLevel.fromJson(json['supply'] as String),
        purchasePrice: json['purchasePrice'] as int,
        frame: ShipFrame.fromJson(json['frame'] as Map<String, dynamic>),
        reactor: ShipReactor.fromJson(json['reactor'] as Map<String, dynamic>),
        engine: ShipEngine.fromJson(json['engine'] as Map<String, dynamic>),
        modules: (json['modules'] as List)
            .map<ShipModule>(
              (e) => ShipModule.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        mounts: (json['mounts'] as List)
            .map<ShipMount>(
              (e) => ShipMount.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        crew: ShipyardShipCrew.fromJson(json['crew'] as Map<String, dynamic>),
      ),
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

  /// Type of ship
  final ShipType type;

  /// Name of the ship.
  final String name;

  /// Description of the ship.
  final String description;

  /// The activity level of a trade good. If the good is an import, this
  /// represents how strong consumption is. If the good is an export, this
  /// represents how strong the production is for the good. When activity is
  /// strong, consumption or production is near maximum capacity. When
  /// activity is weak, consumption or production is near minimum capacity.
  final ActivityLevel? activity;

  /// The supply level of a trade good.
  final SupplyLevel supply;

  /// The purchase price of the ship.
  final int purchasePrice;

  /// The frame of the ship. The frame determines the number of modules and
  /// mounting points of the ship, as well as base fuel capacity. As the
  /// condition of the frame takes more wear, the ship will become more
  /// sluggish and less maneuverable.
  final ShipFrame frame;

  /// The reactor of the ship. The reactor is responsible for powering the
  /// ship's systems and weapons.
  final ShipReactor reactor;

  /// The engine determines how quickly a ship travels between waypoints.
  final ShipEngine engine;

  /// Modules installed in this ship.
  final List<ShipModule> modules;

  /// Mounts installed in this ship.
  final List<ShipMount> mounts;
  final ShipyardShipCrew crew;

  /// Converts a [ShipyardShip] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'description': description,
      'activity': ?activity?.toJson(),
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
  int get hashCode => Object.hashAll([
    type,
    name,
    description,
    activity,
    supply,
    purchasePrice,
    frame,
    reactor,
    engine,
    listHash(modules),
    listHash(mounts),
    crew,
  ]);

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
