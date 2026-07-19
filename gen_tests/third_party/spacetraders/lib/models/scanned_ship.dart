import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/scanned_ship_engine.dart';
import 'package:spacetraders/models/scanned_ship_frame.dart';
import 'package:spacetraders/models/scanned_ship_mounts_inner.dart';
import 'package:spacetraders/models/scanned_ship_reactor.dart';
import 'package:spacetraders/models/ship_nav.dart';
import 'package:spacetraders/models/ship_registration.dart';

/// {@template scanned_ship}
/// The ship that was scanned. Details include information about the ship that
/// could be detected by the scanner.
/// {@endtemplate}
@immutable
class ScannedShip {
  /// {@macro scanned_ship}
  const ScannedShip({
    required this.symbol,
    required this.registration,
    required this.nav,
    required this.engine,
    this.frame,
    this.reactor,
    this.mounts,
  });

  /// Converts a `Map<String, dynamic>` to a [ScannedShip].
  factory ScannedShip.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScannedShip',
      json,
      () => ScannedShip(
        symbol: json['symbol'] as String,
        registration: ShipRegistration.fromJson(
          json['registration'] as Map<String, dynamic>,
        ),
        nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        frame: ScannedShipFrame.maybeFromJson(
          json['frame'] as Map<String, dynamic>?,
        ),
        reactor: ScannedShipReactor.maybeFromJson(
          json['reactor'] as Map<String, dynamic>?,
        ),
        engine: ScannedShipEngine.fromJson(
          json['engine'] as Map<String, dynamic>,
        ),
        mounts: (json['mounts'] as List?)
            ?.map<ScannedShipMountsInner>(
              (e) => ScannedShipMountsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShip? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShip.fromJson(json);
  }

  /// The globally unique identifier of the ship.
  final String symbol;

  /// The public registration information of the ship
  final ShipRegistration registration;

  /// The navigation information of the ship.
  final ShipNav nav;

  /// The frame of the ship.
  final ScannedShipFrame? frame;

  /// The reactor of the ship.
  final ScannedShipReactor? reactor;

  /// The engine of the ship.
  final ScannedShipEngine engine;

  /// List of mounts installed in the ship.
  final List<ScannedShipMountsInner>? mounts;

  /// Converts a [ScannedShip] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'registration': registration.toJson(),
      'nav': nav.toJson(),
      'frame': frame?.toJson(),
      'reactor': reactor?.toJson(),
      'engine': engine.toJson(),
      'mounts': mounts?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    symbol,
    registration,
    nav,
    frame,
    reactor,
    engine,
    listHash(mounts),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedShip &&
        symbol == other.symbol &&
        registration == other.registration &&
        nav == other.nav &&
        frame == other.frame &&
        reactor == other.reactor &&
        engine == other.engine &&
        listsEqual(mounts, other.mounts);
  }
}
