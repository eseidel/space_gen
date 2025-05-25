import 'dart:async';
import 'dart:convert';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/model/create_chart201_response.dart';
import 'package:spacetraders/model/create_ship_ship_scan201_response.dart';
import 'package:spacetraders/model/create_ship_system_scan201_response.dart';
import 'package:spacetraders/model/create_ship_waypoint_scan201_response.dart';
import 'package:spacetraders/model/create_survey201_response.dart';
import 'package:spacetraders/model/dock_ship200_response.dart';
import 'package:spacetraders/model/extract_resources201_response.dart';
import 'package:spacetraders/model/extract_resources_with_survey201_response.dart';
import 'package:spacetraders/model/get_mounts200_response.dart';
import 'package:spacetraders/model/get_my_ship200_response.dart';
import 'package:spacetraders/model/get_my_ship_cargo200_response.dart';
import 'package:spacetraders/model/get_my_ships200_response.dart';
import 'package:spacetraders/model/get_repair_ship200_response.dart';
import 'package:spacetraders/model/get_scrap_ship200_response.dart';
import 'package:spacetraders/model/get_ship_cooldown200_response.dart';
import 'package:spacetraders/model/get_ship_modules200_response.dart';
import 'package:spacetraders/model/get_ship_nav200_response.dart';
import 'package:spacetraders/model/install_mount201_response.dart';
import 'package:spacetraders/model/install_mount_request.dart';
import 'package:spacetraders/model/install_ship_module201_response.dart';
import 'package:spacetraders/model/install_ship_module_request.dart';
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
import 'package:spacetraders/model/remove_ship_module201_response.dart';
import 'package:spacetraders/model/remove_ship_module_request.dart';
import 'package:spacetraders/model/repair_ship200_response.dart';
import 'package:spacetraders/model/scrap_ship200_response.dart';
import 'package:spacetraders/model/sell_cargo201_response.dart';
import 'package:spacetraders/model/sell_cargo_request.dart';
import 'package:spacetraders/model/ship_refine201_response.dart';
import 'package:spacetraders/model/ship_refine_request.dart';
import 'package:spacetraders/model/siphon_resources201_response.dart';
import 'package:spacetraders/model/survey.dart';
import 'package:spacetraders/model/transfer_cargo200_response.dart';
import 'package:spacetraders/model/transfer_cargo_request.dart';
import 'package:spacetraders/model/warp_ship200_response.dart';
import 'package:spacetraders/model/warp_ship_request.dart';

class FleetApi {
  FleetApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetMyShips200Response> getMyShips({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships',
      parameters: {'page': page, 'limit': limit},
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
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships',
      parameters: {'purchaseShipRequest': purchaseShipRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return PurchaseShip201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load purchaseShip');
    }
  }

  Future<GetMyShip200Response> getMyShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}'.replaceAll('{shipSymbol}', shipSymbol),
    );

    if (response.statusCode == 200) {
      return GetMyShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyShip');
    }
  }

  Future<CreateChart201Response> createChart(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/chart'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return CreateChart201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createChart');
    }
  }

  Future<NegotiateContract201Response> negotiateContract(
    String shipSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/negotiate/contract'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return NegotiateContract201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load negotiateContract');
    }
  }

  Future<GetShipCooldown200Response> getShipCooldown(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/cooldown'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return GetShipCooldown200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipCooldown');
    }
  }

  Future<DockShip200Response> dockShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/dock'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return DockShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load dockShip');
    }
  }

  Future<ExtractResources201Response> extractResources(
    String shipSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/extract'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return ExtractResources201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load extractResources');
    }
  }

  Future<ExtractResourcesWithSurvey201Response> extractResourcesWithSurvey(
    String shipSymbol, {
    Survey? survey,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/extract/survey'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'survey': survey?.toJson()},
    );

    if (response.statusCode == 200) {
      return ExtractResourcesWithSurvey201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load extractResourcesWithSurvey');
    }
  }

  Future<Jettison200Response> jettison(
    String shipSymbol,
    JettisonRequest jettisonRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/jettison'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'jettisonRequest': jettisonRequest.toJson()},
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
    String shipSymbol,
    JumpShipRequest jumpShipRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/jump'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'jumpShipRequest': jumpShipRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return JumpShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load jumpShip');
    }
  }

  Future<CreateShipSystemScan201Response> createShipSystemScan(
    String shipSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/scan/systems'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return CreateShipSystemScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createShipSystemScan');
    }
  }

  Future<CreateShipWaypointScan201Response> createShipWaypointScan(
    String shipSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/scan/waypoints'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return CreateShipWaypointScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createShipWaypointScan');
    }
  }

  Future<CreateShipShipScan201Response> createShipShipScan(
    String shipSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/scan/ships'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return CreateShipShipScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createShipShipScan');
    }
  }

  Future<GetScrapShip200Response> getScrapShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/scrap'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return GetScrapShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getScrapShip');
    }
  }

  Future<ScrapShip200Response> scrapShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/scrap'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return ScrapShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load scrapShip');
    }
  }

  Future<NavigateShip200Response> navigateShip(
    String shipSymbol,
    NavigateShipRequest navigateShipRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/navigate'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'navigateShipRequest': navigateShipRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return NavigateShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load navigateShip');
    }
  }

  Future<WarpShip200Response> warpShip(
    String shipSymbol,
    WarpShipRequest warpShipRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/warp'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'warpShipRequest': warpShipRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return WarpShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load warpShip');
    }
  }

  Future<OrbitShip200Response> orbitShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/orbit'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return OrbitShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load orbitShip');
    }
  }

  Future<PurchaseCargo201Response> purchaseCargo(
    String shipSymbol,
    PurchaseCargoRequest purchaseCargoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/purchase'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'purchaseCargoRequest': purchaseCargoRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return PurchaseCargo201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load purchaseCargo');
    }
  }

  Future<ShipRefine201Response> shipRefine(
    String shipSymbol,
    ShipRefineRequest shipRefineRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/refine'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'shipRefineRequest': shipRefineRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return ShipRefine201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load shipRefine');
    }
  }

  Future<RefuelShip200Response> refuelShip(
    String shipSymbol, {
    RefuelShipRequest? refuelShipRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/refuel'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'refuelShipRequest': refuelShipRequest?.toJson()},
    );

    if (response.statusCode == 200) {
      return RefuelShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load refuelShip');
    }
  }

  Future<GetRepairShip200Response> getRepairShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/repair'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return GetRepairShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getRepairShip');
    }
  }

  Future<RepairShip200Response> repairShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/repair'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return RepairShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load repairShip');
    }
  }

  Future<SellCargo201Response> sellCargo(
    String shipSymbol,
    SellCargoRequest sellCargoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/sell'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'sellCargoRequest': sellCargoRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return SellCargo201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load sellCargo');
    }
  }

  Future<SiphonResources201Response> siphonResources(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/siphon'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return SiphonResources201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load siphonResources');
    }
  }

  Future<CreateSurvey201Response> createSurvey(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/survey'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return CreateSurvey201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load createSurvey');
    }
  }

  Future<TransferCargo200Response> transferCargo(
    String shipSymbol,
    TransferCargoRequest transferCargoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/transfer'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'transferCargoRequest': transferCargoRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return TransferCargo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load transferCargo');
    }
  }

  Future<GetMyShipCargo200Response> getMyShipCargo(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/cargo'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return GetMyShipCargo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyShipCargo');
    }
  }

  Future<GetShipModules200Response> getShipModules(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/modules'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return GetShipModules200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipModules');
    }
  }

  Future<InstallShipModule201Response> installShipModule(
    String shipSymbol,
    InstallShipModuleRequest installShipModuleRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/modules/install'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {
        'installShipModuleRequest': installShipModuleRequest.toJson(),
      },
    );

    if (response.statusCode == 200) {
      return InstallShipModule201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load installShipModule');
    }
  }

  Future<RemoveShipModule201Response> removeShipModule(
    String shipSymbol,
    RemoveShipModuleRequest removeShipModuleRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/modules/remove'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'removeShipModuleRequest': removeShipModuleRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return RemoveShipModule201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load removeShipModule');
    }
  }

  Future<GetMounts200Response> getMounts(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/mounts'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
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
    String shipSymbol,
    InstallMountRequest installMountRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/mounts/install'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'installMountRequest': installMountRequest.toJson()},
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
    String shipSymbol,
    RemoveMountRequest removeMountRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/mounts/remove'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
      parameters: {'removeMountRequest': removeMountRequest.toJson()},
    );

    if (response.statusCode == 200) {
      return RemoveMount201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load removeMount');
    }
  }

  Future<GetShipNav200Response> getShipNav(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/nav'.replaceAll('{shipSymbol}', shipSymbol),
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
    String shipSymbol, {
    PatchShipNavRequest? patchShipNavRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/my/ships/{shipSymbol}/nav'.replaceAll('{shipSymbol}', shipSymbol),
      parameters: {'patchShipNavRequest': patchShipNavRequest?.toJson()},
    );

    if (response.statusCode == 200) {
      return PatchShipNav200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load patchShipNav');
    }
  }
}
