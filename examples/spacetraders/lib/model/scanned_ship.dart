import 'package:spacetraders/model/scanned_ship_engine.dart';
import 'package:spacetraders/model/scanned_ship_frame.dart';
import 'package:spacetraders/model/scanned_ship_mounts_item.dart';
import 'package:spacetraders/model/scanned_ship_reactor.dart';
import 'package:spacetraders/model/ship_nav.dart';
import 'package:spacetraders/model/ship_registration.dart';

class ScannedShip {
  ScannedShip({
    required this.symbol,
    required this.registration,
    required this.nav,
    required this.frame,
    required this.reactor,
    required this.engine,
    required this.mounts,
  });

  factory ScannedShip.fromJson(Map<String, dynamic> json) {
    return ScannedShip(
      symbol: json['symbol'] as String,
      registration: ShipRegistration.fromJson(
        json['registration'] as Map<String, dynamic>,
      ),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
      frame: ScannedShipFrame.fromJson(json['frame'] as Map<String, dynamic>),
      reactor: ScannedShipReactor.fromJson(
        json['reactor'] as Map<String, dynamic>,
      ),
      engine: ScannedShipEngine.fromJson(
        json['engine'] as Map<String, dynamic>,
      ),
      mounts:
          (json['mounts'] as List<dynamic>)
              .map<ScannedShipMountsItem>(
                (e) =>
                    ScannedShipMountsItem.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
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

  final String symbol;
  final ShipRegistration registration;
  final ShipNav nav;
  final ScannedShipFrame frame;
  final ScannedShipReactor reactor;
  final ScannedShipEngine engine;
  final List<ScannedShipMountsItem> mounts;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'registration': registration.toJson(),
      'nav': nav.toJson(),
      'frame': frame.toJson(),
      'reactor': reactor.toJson(),
      'engine': engine.toJson(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
    };
  }
}
