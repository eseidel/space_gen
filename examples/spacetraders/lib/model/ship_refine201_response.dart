import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/trade_symbol.dart';

class ShipRefine201Response {
  ShipRefine201Response({required this.data});

  factory ShipRefine201Response.fromJson(Map<String, dynamic> json) {
    return ShipRefine201Response(
      data: ShipRefine201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipRefine201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class ShipRefine201ResponseData {
  ShipRefine201ResponseData({
    required this.cargo,
    required this.cooldown,
    required this.produced,
    required this.consumed,
  });

  factory ShipRefine201ResponseData.fromJson(Map<String, dynamic> json) {
    return ShipRefine201ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      produced:
          (json['produced'] as List<dynamic>)
              .map<ShipRefine201ResponseDataProduced>(
                (e) => ShipRefine201ResponseDataProduced.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      consumed:
          (json['consumed'] as List<dynamic>)
              .map<ShipRefine201ResponseDataConsumed>(
                (e) => ShipRefine201ResponseDataConsumed.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }

  final ShipCargo cargo;
  final Cooldown cooldown;
  final List<ShipRefine201ResponseDataProduced> produced;
  final List<ShipRefine201ResponseDataConsumed> consumed;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'cooldown': cooldown.toJson(),
      'produced': produced.map((e) => e.toJson()).toList(),
      'consumed': consumed.map((e) => e.toJson()).toList(),
    };
  }
}

class ShipRefine201ResponseDataProduced {
  ShipRefine201ResponseDataProduced({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProduced.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProduced(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }
}

class ShipRefine201ResponseDataConsumed {
  ShipRefine201ResponseDataConsumed({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumed.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumed(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {'tradeSymbol': tradeSymbol.toJson(), 'units': units};
  }
}
