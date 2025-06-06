import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
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
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyShips200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMyShips',
    );
  }

  Future<PurchaseShip201Response> purchaseShip(
    PurchaseShipRequest purchaseShipRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships',
      bodyJson: purchaseShipRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PurchaseShip201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $purchaseShip',
    );
  }

  Future<GetMyShip200Response> getMyShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}'.replaceAll('{shipSymbol}', shipSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMyShip',
    );
  }

  Future<CreateChart201Response> createChart(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/chart'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateChart201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $createChart',
    );
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

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return NegotiateContract201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $negotiateContract',
    );
  }

  Future<GetShipCooldown200Response> getShipCooldown(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/cooldown'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetShipCooldown200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getShipCooldown',
    );
  }

  Future<DockShip200Response> dockShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/dock'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DockShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $dockShip',
    );
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

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ExtractResources201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $extractResources',
    );
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
      bodyJson: survey?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ExtractResourcesWithSurvey201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $extractResourcesWithSurvey',
    );
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
      bodyJson: jettisonRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Jettison200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $jettison',
    );
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
      bodyJson: jumpShipRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return JumpShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $jumpShip',
    );
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

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateShipSystemScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $createShipSystemScan',
    );
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

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateShipWaypointScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $createShipWaypointScan',
    );
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

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateShipShipScan201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $createShipShipScan',
    );
  }

  Future<GetScrapShip200Response> getScrapShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/scrap'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetScrapShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getScrapShip',
    );
  }

  Future<ScrapShip200Response> scrapShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/scrap'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ScrapShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $scrapShip',
    );
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
      bodyJson: navigateShipRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return NavigateShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $navigateShip',
    );
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
      bodyJson: warpShipRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WarpShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $warpShip',
    );
  }

  Future<OrbitShip200Response> orbitShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/orbit'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrbitShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $orbitShip',
    );
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
      bodyJson: purchaseCargoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PurchaseCargo201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $purchaseCargo',
    );
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
      bodyJson: shipRefineRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ShipRefine201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $shipRefine',
    );
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
      bodyJson: refuelShipRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RefuelShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $refuelShip',
    );
  }

  Future<GetRepairShip200Response> getRepairShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/repair'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetRepairShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getRepairShip',
    );
  }

  Future<RepairShip200Response> repairShip(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/repair'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepairShip200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $repairShip',
    );
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
      bodyJson: sellCargoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SellCargo201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $sellCargo',
    );
  }

  Future<SiphonResources201Response> siphonResources(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/siphon'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SiphonResources201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $siphonResources',
    );
  }

  Future<CreateSurvey201Response> createSurvey(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/ships/{shipSymbol}/survey'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateSurvey201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $createSurvey',
    );
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
      bodyJson: transferCargoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TransferCargo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $transferCargo',
    );
  }

  Future<GetMyShipCargo200Response> getMyShipCargo(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/cargo'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyShipCargo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMyShipCargo',
    );
  }

  Future<GetShipModules200Response> getShipModules(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/modules'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetShipModules200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getShipModules',
    );
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
      bodyJson: installShipModuleRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InstallShipModule201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $installShipModule',
    );
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
      bodyJson: removeShipModuleRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RemoveShipModule201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $removeShipModule',
    );
  }

  Future<GetMounts200Response> getMounts(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/mounts'.replaceAll(
        '{shipSymbol}',
        shipSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMounts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMounts',
    );
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
      bodyJson: installMountRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InstallMount201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $installMount',
    );
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
      bodyJson: removeMountRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RemoveMount201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $removeMount',
    );
  }

  Future<GetShipNav200Response> getShipNav(String shipSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/ships/{shipSymbol}/nav'.replaceAll('{shipSymbol}', shipSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetShipNav200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getShipNav',
    );
  }

  Future<PatchShipNav200Response> patchShipNav(
    String shipSymbol, {
    PatchShipNavRequest? patchShipNavRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/my/ships/{shipSymbol}/nav'.replaceAll('{shipSymbol}', shipSymbol),
      bodyJson: patchShipNavRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PatchShipNav200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $patchShipNav',
    );
  }
}
