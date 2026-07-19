// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/ship_cargo.dart';
import 'package:spacetraders/models/ship_crew.dart';
import 'package:spacetraders/models/ship_engine.dart';
import 'package:spacetraders/models/ship_frame.dart';
import 'package:spacetraders/models/ship_fuel.dart';
import 'package:spacetraders/models/ship_module.dart';
import 'package:spacetraders/models/ship_mount.dart';
import 'package:spacetraders/models/ship_nav.dart';
import 'package:spacetraders/models/ship_reactor.dart';
import 'package:spacetraders/models/ship_registration.dart';

/// {@template ship}
/// Ship details.
/// {@endtemplate}
@immutable
class Ship {
  /// {@macro ship}
  const Ship({
    required this.symbol,
    required this.registration,
    required this.nav,
    required this.crew,
    required this.frame,
    required this.reactor,
    required this.engine,
    required this.modules,
    required this.mounts,
    required this.cargo,
    required this.fuel,
    required this.cooldown,
  });

  /// Converts a `Map<String, dynamic>` to a [Ship].
  factory Ship.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Ship',
      json,
      () => Ship(
        symbol: json['symbol'] as String,
        registration: ShipRegistration.fromJson(
          json['registration'] as Map<String, dynamic>,
        ),
        nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        crew: ShipCrew.fromJson(json['crew'] as Map<String, dynamic>),
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
        cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Ship? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Ship.fromJson(json);
  }

  /// The globally unique identifier of the ship in the following format:
  /// `[AGENT_SYMBOL]-[HEX_ID]`
  final String symbol;

  /// The public registration information of the ship
  final ShipRegistration registration;

  /// The navigation information of the ship.
  final ShipNav nav;

  /// The ship's crew service and maintain the ship's systems and equipment.
  final ShipCrew crew;

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

  /// Ship cargo details.
  final ShipCargo cargo;

  /// Details of the ship's fuel tanks including how much fuel was consumed
  /// during the last transit or action.
  final ShipFuel fuel;

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// Converts a [Ship] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'registration': registration.toJson(),
      'nav': nav.toJson(),
      'crew': crew.toJson(),
      'frame': frame.toJson(),
      'reactor': reactor.toJson(),
      'engine': engine.toJson(),
      'modules': modules.map((e) => e.toJson()).toList(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'fuel': fuel.toJson(),
      'cooldown': cooldown.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    registration,
    nav,
    crew,
    frame,
    reactor,
    engine,
    listHash(modules),
    listHash(mounts),
    cargo,
    fuel,
    cooldown,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Ship &&
        symbol == other.symbol &&
        registration == other.registration &&
        nav == other.nav &&
        crew == other.crew &&
        frame == other.frame &&
        reactor == other.reactor &&
        engine == other.engine &&
        listsEqual(modules, other.modules) &&
        listsEqual(mounts, other.mounts) &&
        cargo == other.cargo &&
        fuel == other.fuel &&
        cooldown == other.cooldown;
  }
}
