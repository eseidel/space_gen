import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/create_chart201_response.dart';
import 'package:spacetraders/model/create_ship_ship_scan201_response.dart';
import 'package:spacetraders/model/create_ship_system_scan201_response.dart';
import 'package:spacetraders/model/create_ship_waypoint_scan201_response.dart';
import 'package:spacetraders/model/create_survey201_response.dart';
import 'package:spacetraders/model/dock_ship200_response.dart';
import 'package:spacetraders/model/extract_resources201_response.dart';
import 'package:spacetraders/model/extract_resources_request.dart';
import 'package:spacetraders/model/get_mounts200_response.dart';
import 'package:spacetraders/model/get_my_ship200_response.dart';
import 'package:spacetraders/model/get_my_ship_cargo200_response.dart';
import 'package:spacetraders/model/get_my_ships200_response.dart';
import 'package:spacetraders/model/get_ship_cooldown200_response.dart';
import 'package:spacetraders/model/get_ship_nav200_response.dart';
import 'package:spacetraders/model/install_mount201_response.dart';
import 'package:spacetraders/model/install_mount_request.dart';
import 'package:spacetraders/model/jettison200_response.dart';
import 'package:spacetraders/model/jettison_request.dart';
import 'package:spacetraders/model/jump_ship200_response.dart';
import 'package:spacetraders/model/jump_ship_request.dart';
import 'package:spacetraders/model/navigate_ship200_response.dart';
import 'package:spacetraders/model/navigate_ship_request.dart';
import 'package:spacetraders/model/negotiate_contract201_response.dart';
import 'package:spacetraders/model/orbit_ship200_response.dart';
import 'package:spacetraders/model/patch_ship_nav200_response.dart';
import 'package:spacetraders/model/patch_ship_nav_request.dart';
import 'package:spacetraders/model/purchase_cargo201_response.dart';
import 'package:spacetraders/model/purchase_cargo_request.dart';
import 'package:spacetraders/model/purchase_ship201_response.dart';
import 'package:spacetraders/model/purchase_ship_request.dart';
import 'package:spacetraders/model/refuel_ship200_response.dart';
import 'package:spacetraders/model/refuel_ship_request.dart';
import 'package:spacetraders/model/remove_mount201_response.dart';
import 'package:spacetraders/model/remove_mount_request.dart';
import 'package:spacetraders/model/sell_cargo201_response.dart';
import 'package:spacetraders/model/sell_cargo_request.dart';
import 'package:spacetraders/model/ship_refine201_response.dart';
import 'package:spacetraders/model/ship_refine_request.dart';
import 'package:spacetraders/model/transfer_cargo200_response.dart';
import 'package:spacetraders/model/transfer_cargo_request.dart';
import 'package:spacetraders/model/warp_ship200_response.dart';
import 'package:spacetraders/model/warp_ship_request.dart';

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
