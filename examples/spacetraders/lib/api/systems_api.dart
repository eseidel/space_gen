import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model/get_construction200_response.dart';
import 'package:spacetraders/model/get_jump_gate200_response.dart';
import 'package:spacetraders/model/get_market200_response.dart';
import 'package:spacetraders/model/get_shipyard200_response.dart';
import 'package:spacetraders/model/get_system200_response.dart';
import 'package:spacetraders/model/get_system_waypoints200_response.dart';
import 'package:spacetraders/model/get_systems200_response.dart';
import 'package:spacetraders/model/get_waypoint200_response.dart';
import 'package:spacetraders/model/supply_construction201_response.dart';
import 'package:spacetraders/model/supply_construction_request.dart';
import 'package:spacetraders/model/waypoint_trait_symbol.dart';
import 'package:spacetraders/model/waypoint_type.dart';

class SystemsApi {
  SystemsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetSystems200Response> getSystems({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems',
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSystems200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getSystems',
    );
  }

  Future<GetSystem200Response> getSystem(String systemSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}'.replaceAll(
        '{systemSymbol}',
        systemSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSystem200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getSystem',
    );
  }

  Future<GetSystemWaypoints200Response> getSystemWaypoints(
    String systemSymbol, {
    int? page = 1,
    int? limit = 10,
    WaypointType? type,
    List<WaypointTraitSymbol>? traits,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints'.replaceAll(
        '{systemSymbol}',
        systemSymbol,
      ),
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        'type': ?type?.toJson(),
        'traits': traits.toString(),
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSystemWaypoints200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getSystemWaypoints',
    );
  }

  Future<GetWaypoint200Response> getWaypoint(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}'
          .replaceAll('{systemSymbol}', systemSymbol)
          .replaceAll('{waypointSymbol}', waypointSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetWaypoint200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getWaypoint',
    );
  }

  Future<GetConstruction200Response> getConstruction(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/construction'
          .replaceAll('{systemSymbol}', systemSymbol)
          .replaceAll('{waypointSymbol}', waypointSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetConstruction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getConstruction',
    );
  }

  Future<SupplyConstruction201Response> supplyConstruction(
    String systemSymbol,
    String waypointSymbol,
    SupplyConstructionRequest supplyConstructionRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/systems/{systemSymbol}/waypoints/{waypointSymbol}/construction/supply'
              .replaceAll('{systemSymbol}', systemSymbol)
              .replaceAll('{waypointSymbol}', waypointSymbol),
      bodyJson: supplyConstructionRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SupplyConstruction201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $supplyConstruction',
    );
  }

  Future<GetMarket200Response> getMarket(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/market'
          .replaceAll('{systemSymbol}', systemSymbol)
          .replaceAll('{waypointSymbol}', waypointSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMarket200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMarket',
    );
  }

  Future<GetJumpGate200Response> getJumpGate(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/jump-gate'
          .replaceAll('{systemSymbol}', systemSymbol)
          .replaceAll('{waypointSymbol}', waypointSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetJumpGate200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getJumpGate',
    );
  }

  Future<GetShipyard200Response> getShipyard(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/shipyard'
          .replaceAll('{systemSymbol}', systemSymbol)
          .replaceAll('{waypointSymbol}', waypointSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetShipyard200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getShipyard',
    );
  }
}
