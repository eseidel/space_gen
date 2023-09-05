import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/chart.dart';
import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/extraction.dart';
import 'package:spacetraders/model/market_transaction.dart';
import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model/scanned_ship.dart';
import 'package:spacetraders/model/scanned_system.dart';
import 'package:spacetraders/model/scanned_waypoint.dart';
import 'package:spacetraders/model/ship.dart';
import 'package:spacetraders/model/ship_cargo.dart';
import 'package:spacetraders/model/ship_fuel.dart';
import 'package:spacetraders/model/ship_modification_transaction.dart';
import 'package:spacetraders/model/ship_mount.dart';
import 'package:spacetraders/model/ship_nav.dart';
import 'package:spacetraders/model/ship_nav_flight_mode.dart';
import 'package:spacetraders/model/ship_type.dart';
import 'package:spacetraders/model/shipyard_transaction.dart';
import 'package:spacetraders/model/survey.dart';
import 'package:spacetraders/model/trade_symbol.dart';
import 'package:spacetraders/model/waypoint.dart';

class FleetApi {
  Future<GetMyShips200Response> getMyShips(
    int page,
    int limit,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/ships'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      return GetMyShips200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyShips');
    }
  }

  Future<PurchaseShip201Response> purchaseShip(
    PurchaseShipRequest purchaseShipRequest,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/ships'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'purchaseShipRequest': purchaseShipRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return PurchaseShip201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load purchaseShip');
    }
  }

  Future<GetMyShip200Response> getMyShip() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMyShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyShip');
    }
  }

  Future<GetMyShipCargo200Response> getMyShipCargo() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/cargo',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMyShipCargo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyShipCargo');
    }
  }

  Future<OrbitShip200Response> orbitShip() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/orbit',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return OrbitShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load orbitShip');
    }
  }

  Future<ShipRefine201Response> shipRefine(
    ShipRefineRequest shipRefineRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/refine',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'shipRefineRequest': shipRefineRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return ShipRefine201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load shipRefine');
    }
  }

  Future<CreateChart201Response> createChart() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/chart',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return CreateChart201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createChart');
    }
  }

  Future<GetShipCooldown200Response> getShipCooldown() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/cooldown',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetShipCooldown200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipCooldown');
    }
  }

  Future<DockShip200Response> dockShip() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/dock',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return DockShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load dockShip');
    }
  }

  Future<CreateSurvey201Response> createSurvey() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/survey',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return CreateSurvey201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createSurvey');
    }
  }

  Future<ExtractResources201Response> extractResources(
    ExtractResourcesRequest extractResourcesRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/extract',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'extractResourcesRequest': extractResourcesRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return ExtractResources201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load extractResources');
    }
  }

  Future<Jettison200Response> jettison(
    JettisonRequest jettisonRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/jettison',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'jettisonRequest': jettisonRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return Jettison200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load jettison');
    }
  }

  Future<JumpShip200Response> jumpShip(
    JumpShipRequest jumpShipRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/jump',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'jumpShipRequest': jumpShipRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return JumpShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load jumpShip');
    }
  }

  Future<NavigateShip200Response> navigateShip(
    NavigateShipRequest navigateShipRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/navigate',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'navigateShipRequest': navigateShipRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return NavigateShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load navigateShip');
    }
  }

  Future<GetShipNav200Response> getShipNav() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/nav'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetShipNav200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipNav');
    }
  }

  Future<PatchShipNav200Response> patchShipNav(
    PatchShipNavRequest patchShipNavRequest,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/nav'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'patchShipNavRequest': patchShipNavRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return PatchShipNav200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load patchShipNav');
    }
  }

  Future<WarpShip200Response> warpShip(
    WarpShipRequest warpShipRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/warp',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'warpShipRequest': warpShipRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return WarpShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load warpShip');
    }
  }

  Future<SellCargo201Response> sellCargo(
    SellCargoRequest sellCargoRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/sell',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'sellCargoRequest': sellCargoRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return SellCargo201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load sellCargo');
    }
  }

  Future<CreateShipSystemScan201Response> createShipSystemScan() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/scan/systems',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return CreateShipSystemScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createShipSystemScan');
    }
  }

  Future<CreateShipWaypointScan201Response> createShipWaypointScan() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/scan/waypoints',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return CreateShipWaypointScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createShipWaypointScan');
    }
  }

  Future<CreateShipShipScan201Response> createShipShipScan() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/scan/ships',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return CreateShipShipScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createShipShipScan');
    }
  }

  Future<RefuelShip200Response> refuelShip(
    RefuelShipRequest refuelShipRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/refuel',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'refuelShipRequest': refuelShipRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return RefuelShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load refuelShip');
    }
  }

  Future<PurchaseCargo201Response> purchaseCargo(
    PurchaseCargoRequest purchaseCargoRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/purchase',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'purchaseCargoRequest': purchaseCargoRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return PurchaseCargo201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load purchaseCargo');
    }
  }

  Future<TransferCargo200Response> transferCargo(
    TransferCargoRequest transferCargoRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/transfer',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'transferCargoRequest': transferCargoRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return TransferCargo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load transferCargo');
    }
  }

  Future<NegotiateContract201Response> negotiateContract() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/negotiate/contract',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return NegotiateContract201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load negotiateContract');
    }
  }

  Future<GetMounts200Response> getMounts() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/mounts',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMounts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMounts');
    }
  }

  Future<InstallMount201Response> installMount(
    InstallMountRequest installMountRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/mounts/install',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'installMountRequest': installMountRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return InstallMount201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load installMount');
    }
  }

  Future<RemoveMount201Response> removeMount(
    RemoveMountRequest removeMountRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/mounts/remove',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'removeMountRequest': removeMountRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return RemoveMount201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load removeMount');
    }
  }
}

class GetMyShips200Response {
  GetMyShips200Response({
    required this.data,
    required this.meta,
  });

  factory GetMyShips200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShips200Response(
      data: (json['data'] as List<dynamic>)
          .map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Ship> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class PurchaseShip201Response {
  PurchaseShip201Response({
    required this.data,
  });

  factory PurchaseShip201Response.fromJson(Map<String, dynamic> json) {
    return PurchaseShip201Response(
      data: PurchaseShip201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final PurchaseShip201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class PurchaseShip201ResponseData {
  PurchaseShip201ResponseData({
    required this.agent,
    required this.ship,
    required this.transaction,
  });

  factory PurchaseShip201ResponseData.fromJson(Map<String, dynamic> json) {
    return PurchaseShip201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
      transaction: ShipyardTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final Ship ship;
  final ShipyardTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'ship': ship.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}

class PurchaseShipRequest {
  PurchaseShipRequest({
    required this.shipType,
    required this.waypointSymbol,
  });

  factory PurchaseShipRequest.fromJson(Map<String, dynamic> json) {
    return PurchaseShipRequest(
      shipType: ShipType.fromJson(json['shipType'] as String),
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  final ShipType shipType;
  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {
      'shipType': shipType.toJson(),
      'waypointSymbol': waypointSymbol,
    };
  }
}

class GetMyShip200Response {
  GetMyShip200Response({
    required this.data,
  });

  factory GetMyShip200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShip200Response(
      data: Ship.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Ship data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class GetMyShipCargo200Response {
  GetMyShipCargo200Response({
    required this.data,
  });

  factory GetMyShipCargo200Response.fromJson(Map<String, dynamic> json) {
    return GetMyShipCargo200Response(
      data: ShipCargo.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final ShipCargo data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class OrbitShip200Response {
  OrbitShip200Response({
    required this.data,
  });

  factory OrbitShip200Response.fromJson(Map<String, dynamic> json) {
    return OrbitShip200Response(
      data: OrbitShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final OrbitShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class OrbitShip200ResponseData {
  OrbitShip200ResponseData({
    required this.nav,
  });

  factory OrbitShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return OrbitShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
    };
  }
}

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
          .map<ShipRefine201ResponseDataProducedArray>(
            (e) => ShipRefine201ResponseDataProducedArray.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      consumed: (json['consumed'] as List<dynamic>)
          .map<ShipRefine201ResponseDataConsumedArray>(
            (e) => ShipRefine201ResponseDataConsumedArray.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  final ShipCargo cargo;
  final Cooldown cooldown;
  final List<ShipRefine201ResponseDataProducedArray> produced;
  final List<ShipRefine201ResponseDataConsumedArray> consumed;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
      'cooldown': cooldown.toJson(),
      'produced': produced.map((e) => e.toJson()).toList(),
      'consumed': consumed.map((e) => e.toJson()).toList(),
    };
  }
}

class ShipRefine201ResponseDataProducedArray {
  ShipRefine201ResponseDataProducedArray({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProducedArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProducedArray(
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

class ShipRefine201ResponseDataConsumedArray {
  ShipRefine201ResponseDataConsumedArray({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumedArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumedArray(
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

class ShipRefineRequest {
  ShipRefineRequest({
    required this.produce,
  });

  factory ShipRefineRequest.fromJson(Map<String, dynamic> json) {
    return ShipRefineRequest(
      produce:
          ShipRefineRequestProduceString.fromJson(json['produce'] as String),
    );
  }

  final ShipRefineRequestProduceString produce;

  Map<String, dynamic> toJson() {
    return {
      'produce': produce.toJson(),
    };
  }
}

class CreateChart201Response {
  CreateChart201Response({
    required this.data,
  });

  factory CreateChart201Response.fromJson(Map<String, dynamic> json) {
    return CreateChart201Response(
      data: CreateChart201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateChart201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateChart201ResponseData {
  CreateChart201ResponseData({
    required this.chart,
    required this.waypoint,
  });

  factory CreateChart201ResponseData.fromJson(Map<String, dynamic> json) {
    return CreateChart201ResponseData(
      chart: Chart.fromJson(json['chart'] as Map<String, dynamic>),
      waypoint: Waypoint.fromJson(json['waypoint'] as Map<String, dynamic>),
    );
  }

  final Chart chart;
  final Waypoint waypoint;

  Map<String, dynamic> toJson() {
    return {
      'chart': chart.toJson(),
      'waypoint': waypoint.toJson(),
    };
  }
}

class GetShipCooldown200Response {
  GetShipCooldown200Response({
    required this.data,
  });

  factory GetShipCooldown200Response.fromJson(Map<String, dynamic> json) {
    return GetShipCooldown200Response(
      data: Cooldown.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Cooldown data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class DockShip200Response {
  DockShip200Response({
    required this.data,
  });

  factory DockShip200Response.fromJson(Map<String, dynamic> json) {
    return DockShip200Response(
      data: DockShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final DockShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class DockShip200ResponseData {
  DockShip200ResponseData({
    required this.nav,
  });

  factory DockShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return DockShip200ResponseData(
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'nav': nav.toJson(),
    };
  }
}

class CreateSurvey201Response {
  CreateSurvey201Response({
    required this.data,
  });

  factory CreateSurvey201Response.fromJson(Map<String, dynamic> json) {
    return CreateSurvey201Response(
      data: CreateSurvey201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateSurvey201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateSurvey201ResponseData {
  CreateSurvey201ResponseData({
    required this.cooldown,
    required this.surveys,
  });

  factory CreateSurvey201ResponseData.fromJson(Map<String, dynamic> json) {
    return CreateSurvey201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      surveys: (json['surveys'] as List<dynamic>)
          .map<Survey>((e) => Survey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final Cooldown cooldown;
  final List<Survey> surveys;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'surveys': surveys.map((e) => e.toJson()).toList(),
    };
  }
}

class ExtractResources201Response {
  ExtractResources201Response({
    required this.data,
  });

  factory ExtractResources201Response.fromJson(Map<String, dynamic> json) {
    return ExtractResources201Response(
      data: ExtractResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final ExtractResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class ExtractResources201ResponseData {
  ExtractResources201ResponseData({
    required this.cooldown,
    required this.extraction,
    required this.cargo,
  });

  factory ExtractResources201ResponseData.fromJson(Map<String, dynamic> json) {
    return ExtractResources201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      extraction:
          Extraction.fromJson(json['extraction'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final Cooldown cooldown;
  final Extraction extraction;
  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'extraction': extraction.toJson(),
      'cargo': cargo.toJson(),
    };
  }
}

class ExtractResourcesRequest {
  ExtractResourcesRequest({
    required this.survey,
  });

  factory ExtractResourcesRequest.fromJson(Map<String, dynamic> json) {
    return ExtractResourcesRequest(
      survey: Survey.fromJson(json['survey'] as Map<String, dynamic>),
    );
  }

  final Survey survey;

  Map<String, dynamic> toJson() {
    return {
      'survey': survey.toJson(),
    };
  }
}

class Jettison200Response {
  Jettison200Response({
    required this.data,
  });

  factory Jettison200Response.fromJson(Map<String, dynamic> json) {
    return Jettison200Response(
      data: Jettison200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final Jettison200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class Jettison200ResponseData {
  Jettison200ResponseData({
    required this.cargo,
  });

  factory Jettison200ResponseData.fromJson(Map<String, dynamic> json) {
    return Jettison200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
    };
  }
}

class JettisonRequest {
  JettisonRequest({
    required this.symbol,
    required this.units,
  });

  factory JettisonRequest.fromJson(Map<String, dynamic> json) {
    return JettisonRequest(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'units': units,
    };
  }
}

class JumpShip200Response {
  JumpShip200Response({
    required this.data,
  });

  factory JumpShip200Response.fromJson(Map<String, dynamic> json) {
    return JumpShip200Response(
      data: JumpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final JumpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class JumpShip200ResponseData {
  JumpShip200ResponseData({
    required this.cooldown,
    required this.nav,
  });

  factory JumpShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return JumpShip200ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final Cooldown cooldown;
  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'nav': nav.toJson(),
    };
  }
}

class JumpShipRequest {
  JumpShipRequest({
    required this.systemSymbol,
  });

  factory JumpShipRequest.fromJson(Map<String, dynamic> json) {
    return JumpShipRequest(
      systemSymbol: json['systemSymbol'] as String,
    );
  }

  final String systemSymbol;

  Map<String, dynamic> toJson() {
    return {
      'systemSymbol': systemSymbol,
    };
  }
}

class NavigateShip200Response {
  NavigateShip200Response({
    required this.data,
  });

  factory NavigateShip200Response.fromJson(Map<String, dynamic> json) {
    return NavigateShip200Response(
      data: NavigateShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NavigateShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class NavigateShip200ResponseData {
  NavigateShip200ResponseData({
    required this.fuel,
    required this.nav,
  });

  factory NavigateShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return NavigateShip200ResponseData(
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipFuel fuel;
  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'fuel': fuel.toJson(),
      'nav': nav.toJson(),
    };
  }
}

class NavigateShipRequest {
  NavigateShipRequest({
    required this.waypointSymbol,
  });

  factory NavigateShipRequest.fromJson(Map<String, dynamic> json) {
    return NavigateShipRequest(
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
    };
  }
}

class GetShipNav200Response {
  GetShipNav200Response({
    required this.data,
  });

  factory GetShipNav200Response.fromJson(Map<String, dynamic> json) {
    return GetShipNav200Response(
      data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final ShipNav data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class PatchShipNav200Response {
  PatchShipNav200Response({
    required this.data,
  });

  factory PatchShipNav200Response.fromJson(Map<String, dynamic> json) {
    return PatchShipNav200Response(
      data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final ShipNav data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class PatchShipNavRequest {
  PatchShipNavRequest({
    required this.flightMode,
  });

  factory PatchShipNavRequest.fromJson(Map<String, dynamic> json) {
    return PatchShipNavRequest(
      flightMode: ShipNavFlightMode.fromJson(json['flightMode'] as String),
    );
  }

  final ShipNavFlightMode flightMode;

  Map<String, dynamic> toJson() {
    return {
      'flightMode': flightMode.toJson(),
    };
  }
}

class WarpShip200Response {
  WarpShip200Response({
    required this.data,
  });

  factory WarpShip200Response.fromJson(Map<String, dynamic> json) {
    return WarpShip200Response(
      data: WarpShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final WarpShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class WarpShip200ResponseData {
  WarpShip200ResponseData({
    required this.fuel,
    required this.nav,
  });

  factory WarpShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return WarpShip200ResponseData(
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
    );
  }

  final ShipFuel fuel;
  final ShipNav nav;

  Map<String, dynamic> toJson() {
    return {
      'fuel': fuel.toJson(),
      'nav': nav.toJson(),
    };
  }
}

class WarpShipRequest {
  WarpShipRequest({
    required this.waypointSymbol,
  });

  factory WarpShipRequest.fromJson(Map<String, dynamic> json) {
    return WarpShipRequest(
      waypointSymbol: json['waypointSymbol'] as String,
    );
  }

  final String waypointSymbol;

  Map<String, dynamic> toJson() {
    return {
      'waypointSymbol': waypointSymbol,
    };
  }
}

class SellCargo201Response {
  SellCargo201Response({
    required this.data,
  });

  factory SellCargo201Response.fromJson(Map<String, dynamic> json) {
    return SellCargo201Response(
      data: SellCargo201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final SellCargo201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class SellCargo201ResponseData {
  SellCargo201ResponseData({
    required this.agent,
    required this.cargo,
    required this.transaction,
  });

  factory SellCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return SellCargo201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final ShipCargo cargo;
  final MarketTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}

class SellCargoRequest {
  SellCargoRequest({
    required this.symbol,
    required this.units,
  });

  factory SellCargoRequest.fromJson(Map<String, dynamic> json) {
    return SellCargoRequest(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'units': units,
    };
  }
}

class CreateShipSystemScan201Response {
  CreateShipSystemScan201Response({
    required this.data,
  });

  factory CreateShipSystemScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipSystemScan201Response(
      data: CreateShipSystemScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipSystemScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateShipSystemScan201ResponseData {
  CreateShipSystemScan201ResponseData({
    required this.cooldown,
    required this.systems,
  });

  factory CreateShipSystemScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipSystemScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      systems: (json['systems'] as List<dynamic>)
          .map<ScannedSystem>(
            (e) => ScannedSystem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final Cooldown cooldown;
  final List<ScannedSystem> systems;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'systems': systems.map((e) => e.toJson()).toList(),
    };
  }
}

class CreateShipWaypointScan201Response {
  CreateShipWaypointScan201Response({
    required this.data,
  });

  factory CreateShipWaypointScan201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipWaypointScan201Response(
      data: CreateShipWaypointScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipWaypointScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateShipWaypointScan201ResponseData {
  CreateShipWaypointScan201ResponseData({
    required this.cooldown,
    required this.waypoints,
  });

  factory CreateShipWaypointScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipWaypointScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map<ScannedWaypoint>(
            (e) => ScannedWaypoint.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final Cooldown cooldown;
  final List<ScannedWaypoint> waypoints;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'waypoints': waypoints.map((e) => e.toJson()).toList(),
    };
  }
}

class CreateShipShipScan201Response {
  CreateShipShipScan201Response({
    required this.data,
  });

  factory CreateShipShipScan201Response.fromJson(Map<String, dynamic> json) {
    return CreateShipShipScan201Response(
      data: CreateShipShipScan201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final CreateShipShipScan201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class CreateShipShipScan201ResponseData {
  CreateShipShipScan201ResponseData({
    required this.cooldown,
    required this.ships,
  });

  factory CreateShipShipScan201ResponseData.fromJson(
    Map<String, dynamic> json,
  ) {
    return CreateShipShipScan201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      ships: (json['ships'] as List<dynamic>)
          .map<ScannedShip>(
            (e) => ScannedShip.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  final Cooldown cooldown;
  final List<ScannedShip> ships;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'ships': ships.map((e) => e.toJson()).toList(),
    };
  }
}

class RefuelShip200Response {
  RefuelShip200Response({
    required this.data,
  });

  factory RefuelShip200Response.fromJson(Map<String, dynamic> json) {
    return RefuelShip200Response(
      data: RefuelShip200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final RefuelShip200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class RefuelShip200ResponseData {
  RefuelShip200ResponseData({
    required this.agent,
    required this.fuel,
    required this.transaction,
  });

  factory RefuelShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return RefuelShip200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final ShipFuel fuel;
  final MarketTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'fuel': fuel.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}

class RefuelShipRequest {
  RefuelShipRequest({
    required this.units,
  });

  factory RefuelShipRequest.fromJson(Map<String, dynamic> json) {
    return RefuelShipRequest(
      units: json['units'] as int,
    );
  }

  final int units;

  Map<String, dynamic> toJson() {
    return {
      'units': units,
    };
  }
}

class PurchaseCargo201Response {
  PurchaseCargo201Response({
    required this.data,
  });

  factory PurchaseCargo201Response.fromJson(Map<String, dynamic> json) {
    return PurchaseCargo201Response(
      data: PurchaseCargo201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final PurchaseCargo201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class PurchaseCargo201ResponseData {
  PurchaseCargo201ResponseData({
    required this.agent,
    required this.cargo,
    required this.transaction,
  });

  factory PurchaseCargo201ResponseData.fromJson(Map<String, dynamic> json) {
    return PurchaseCargo201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: MarketTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final ShipCargo cargo;
  final MarketTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}

class PurchaseCargoRequest {
  PurchaseCargoRequest({
    required this.symbol,
    required this.units,
  });

  factory PurchaseCargoRequest.fromJson(Map<String, dynamic> json) {
    return PurchaseCargoRequest(
      symbol: TradeSymbol.fromJson(json['symbol'] as String),
      units: json['units'] as int,
    );
  }

  final TradeSymbol symbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol.toJson(),
      'units': units,
    };
  }
}

class TransferCargo200Response {
  TransferCargo200Response({
    required this.data,
  });

  factory TransferCargo200Response.fromJson(Map<String, dynamic> json) {
    return TransferCargo200Response(
      data: TransferCargo200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final TransferCargo200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class TransferCargo200ResponseData {
  TransferCargo200ResponseData({
    required this.cargo,
  });

  factory TransferCargo200ResponseData.fromJson(Map<String, dynamic> json) {
    return TransferCargo200ResponseData(
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'cargo': cargo.toJson(),
    };
  }
}

class TransferCargoRequest {
  TransferCargoRequest({
    required this.tradeSymbol,
    required this.units,
    required this.shipSymbol,
  });

  factory TransferCargoRequest.fromJson(Map<String, dynamic> json) {
    return TransferCargoRequest(
      tradeSymbol: TradeSymbol.fromJson(json['tradeSymbol'] as String),
      units: json['units'] as int,
      shipSymbol: json['shipSymbol'] as String,
    );
  }

  final TradeSymbol tradeSymbol;
  final int units;
  final String shipSymbol;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol.toJson(),
      'units': units,
      'shipSymbol': shipSymbol,
    };
  }
}

class NegotiateContract201Response {
  NegotiateContract201Response({
    required this.data,
  });

  factory NegotiateContract201Response.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201Response(
      data: NegotiateContract201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NegotiateContract201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class NegotiateContract201ResponseData {
  NegotiateContract201ResponseData({
    required this.contract,
  });

  factory NegotiateContract201ResponseData.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  final Contract contract;

  Map<String, dynamic> toJson() {
    return {
      'contract': contract.toJson(),
    };
  }
}

class GetMounts200Response {
  GetMounts200Response({
    required this.data,
  });

  factory GetMounts200Response.fromJson(Map<String, dynamic> json) {
    return GetMounts200Response(
      data: (json['data'] as List<dynamic>)
          .map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<ShipMount> data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class InstallMount201Response {
  InstallMount201Response({
    required this.data,
  });

  factory InstallMount201Response.fromJson(Map<String, dynamic> json) {
    return InstallMount201Response(
      data: InstallMount201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final InstallMount201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class InstallMount201ResponseData {
  InstallMount201ResponseData({
    required this.agent,
    required this.mounts,
    required this.cargo,
    required this.transaction,
  });

  factory InstallMount201ResponseData.fromJson(Map<String, dynamic> json) {
    return InstallMount201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      mounts: (json['mounts'] as List<dynamic>)
          .map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>))
          .toList(),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: ShipModificationTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final List<ShipMount> mounts;
  final ShipCargo cargo;
  final ShipModificationTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}

class InstallMountRequest {
  InstallMountRequest({
    required this.symbol,
  });

  factory InstallMountRequest.fromJson(Map<String, dynamic> json) {
    return InstallMountRequest(
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

class RemoveMount201Response {
  RemoveMount201Response({
    required this.data,
  });

  factory RemoveMount201Response.fromJson(Map<String, dynamic> json) {
    return RemoveMount201Response(
      data: RemoveMount201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final RemoveMount201ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class RemoveMount201ResponseData {
  RemoveMount201ResponseData({
    required this.agent,
    required this.mounts,
    required this.cargo,
    required this.transaction,
  });

  factory RemoveMount201ResponseData.fromJson(Map<String, dynamic> json) {
    return RemoveMount201ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      mounts: (json['mounts'] as List<dynamic>)
          .map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>))
          .toList(),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
      transaction: ShipModificationTransaction.fromJson(
        json['transaction'] as Map<String, dynamic>,
      ),
    );
  }

  final Agent agent;
  final List<ShipMount> mounts;
  final ShipCargo cargo;
  final ShipModificationTransaction transaction;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'mounts': mounts.map((e) => e.toJson()).toList(),
      'cargo': cargo.toJson(),
      'transaction': transaction.toJson(),
    };
  }
}

class RemoveMountRequest {
  RemoveMountRequest({
    required this.symbol,
  });

  factory RemoveMountRequest.fromJson(Map<String, dynamic> json) {
    return RemoveMountRequest(
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

enum ShipRefineRequestProduceString {
  iron('IRON'),
  copper('COPPER'),
  silver('SILVER'),
  gold('GOLD'),
  aluminum('ALUMINUM'),
  platinum('PLATINUM'),
  uranite('URANITE'),
  meritium('MERITIUM'),
  fuel('FUEL'),
  ;

  const ShipRefineRequestProduceString(this.value);

  factory ShipRefineRequestProduceString.fromJson(String json) {
    switch (json) {
      case 'IRON':
        return ShipRefineRequestProduceString.iron;
      case 'COPPER':
        return ShipRefineRequestProduceString.copper;
      case 'SILVER':
        return ShipRefineRequestProduceString.silver;
      case 'GOLD':
        return ShipRefineRequestProduceString.gold;
      case 'ALUMINUM':
        return ShipRefineRequestProduceString.aluminum;
      case 'PLATINUM':
        return ShipRefineRequestProduceString.platinum;
      case 'URANITE':
        return ShipRefineRequestProduceString.uranite;
      case 'MERITIUM':
        return ShipRefineRequestProduceString.meritium;
      case 'FUEL':
        return ShipRefineRequestProduceString.fuel;
      default:
        throw Exception('Unknown ShipRefineRequestProduceString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ShipRefineRequestProduceString.iron:
        return 'IRON';
      case ShipRefineRequestProduceString.copper:
        return 'COPPER';
      case ShipRefineRequestProduceString.silver:
        return 'SILVER';
      case ShipRefineRequestProduceString.gold:
        return 'GOLD';
      case ShipRefineRequestProduceString.aluminum:
        return 'ALUMINUM';
      case ShipRefineRequestProduceString.platinum:
        return 'PLATINUM';
      case ShipRefineRequestProduceString.uranite:
        return 'URANITE';
      case ShipRefineRequestProduceString.meritium:
        return 'MERITIUM';
      case ShipRefineRequestProduceString.fuel:
        return 'FUEL';
    }
  }
}
