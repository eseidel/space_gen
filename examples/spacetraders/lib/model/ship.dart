import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_crew.dart';
import 'package:spacetraders/model/ship_engine.dart';
import 'package:spacetraders/model/ship_frame.dart';
import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_module.dart';
import 'package:spacetraders/model/ship_mount.dart';
import 'package:spacetraders/model/ship_nav.dart';
import 'package:spacetraders/model/ship_reactor.dart';
import 'package:spacetraders/model/ship_registration.dart';

class Ship {
  Ship({
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

  factory Ship.fromJson(Map<String, dynamic> json) {
    return Ship(
      symbol: json['symbol'] as String,
      registration: ShipRegistration.fromJson(
        json['registration'] as Map<String, dynamic>,
      ),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
      crew: ShipCrew.fromJson(json['crew'] as Map<String, dynamic>),
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
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
    );
  }

  final String symbol;
  final ShipRegistration registration;
  final ShipNav nav;
  final ShipCrew crew;
  final ShipFrame frame;
  final ShipReactor reactor;
  final ShipEngine engine;
  final List<ShipModule> modules;
  final List<ShipMount> mounts;
  final ShipCargo cargo;
  final ShipFuel fuel;
  final Cooldown cooldown;

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
}
