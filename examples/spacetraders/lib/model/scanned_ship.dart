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
      reactor:
          ScannedShipReactor.fromJson(json['reactor'] as Map<String, dynamic>),
      engine:
          ScannedShipEngine.fromJson(json['engine'] as Map<String, dynamic>),
      mounts: (json['mounts'] as List<dynamic>)
          .map<ScannedShipMountsArray>(
            (e) => ScannedShipMountsArray.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final String symbol;
  final ShipRegistration registration;
  final ShipNav nav;
  final ScannedShipFrame frame;
  final ScannedShipReactor reactor;
  final ScannedShipEngine engine;
  final List<ScannedShipMountsArray> mounts;

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

class ScannedShipFrame {
  ScannedShipFrame({
    required this.symbol,
  });

  factory ScannedShipFrame.fromJson(Map<String, dynamic> json) {
    return ScannedShipFrame(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}

class ScannedShipReactor {
  ScannedShipReactor({
    required this.symbol,
  });

  factory ScannedShipReactor.fromJson(Map<String, dynamic> json) {
    return ScannedShipReactor(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}

class ScannedShipEngine {
  ScannedShipEngine({
    required this.symbol,
  });

  factory ScannedShipEngine.fromJson(Map<String, dynamic> json) {
    return ScannedShipEngine(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}

class ScannedShipMountsArray {
  ScannedShipMountsArray({
    required this.symbol,
  });

  factory ScannedShipMountsArray.fromJson(Map<String, dynamic> json) {
    return ScannedShipMountsArray(
      symbol: json['symbol'] as String,
    );
  }

  final String symbol;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}
