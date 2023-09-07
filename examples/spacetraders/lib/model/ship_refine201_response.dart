import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class ShipRefine201Response {
  ShipRefine201Response({
    required this.data,
  });

  factory ShipRefine201Response.fromJson(Map<String, dynamic> json) {
    return ShipRefine201Response(
      data: ShipRefine201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ShipRefine201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
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
      produced: (json['produced'] as List<dynamic>)
          .map<ShipRefine201ResponseDataProducedInner>(
            (e) => ShipRefine201ResponseDataProducedInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      consumed: (json['consumed'] as List<dynamic>)
          .map<ShipRefine201ResponseDataConsumedInner>(
            (e) => ShipRefine201ResponseDataConsumedInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  final ShipCargo cargo;
  final Cooldown cooldown;
  final List<ShipRefine201ResponseDataProducedInner> produced;
  final List<ShipRefine201ResponseDataConsumedInner> consumed;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'cooldown': cooldown.toJson(),
      'produced': produced.map((e) => e.toJson()).toList(),
      'consumed': consumed.map((e) => e.toJson()).toList(),
    };
  }
}

class ShipRefine201ResponseDataProducedInner {
  ShipRefine201ResponseDataProducedInner({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProducedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProducedInner(
      tradeSymbol: json['tradeSymbol'] as String,
      units: json['units'] as int,
    );
  }

  final String tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }
}

class ShipRefine201ResponseDataConsumedInner {
  ShipRefine201ResponseDataConsumedInner({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumedInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumedInner(
      tradeSymbol: json['tradeSymbol'] as String,
      units: json['units'] as int,
    );
  }

  final String tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }
}
