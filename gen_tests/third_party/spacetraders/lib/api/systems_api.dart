// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/get_construction200_response.dart';
import 'package:spacetraders/messages/get_jump_gate200_response.dart';
import 'package:spacetraders/messages/get_market200_response.dart';
import 'package:spacetraders/messages/get_shipyard200_response.dart';
import 'package:spacetraders/messages/get_system200_response.dart';
import 'package:spacetraders/messages/get_system_waypoints200_response.dart';
import 'package:spacetraders/messages/get_systems200_response.dart';
import 'package:spacetraders/messages/get_waypoint200_response.dart';
import 'package:spacetraders/messages/supply_construction201_response.dart';
import 'package:spacetraders/messages/supply_construction_request.dart';
import 'package:spacetraders/models/waypoint_trait_symbol.dart';
import 'package:spacetraders/models/waypoint_type.dart';

/// The systems endpoints contain actions that relate to systems and waypoints.
/// Systems are the individual stars in the universe, and waypoints are the
/// locations within a system.
class SystemsApi {
  SystemsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List Systems
  /// Return a paginated list of all systems.
  Future<GetSystems200Response> getSystems({
    int? page = 1,
    int? limit = 10,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 20);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSystems200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get System
  /// Get the details of a system. Requires the system to have been visited or
  /// charted.
  Future<GetSystem200Response> getSystem(String systemSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}'.replaceAll(
        '{systemSymbol}',
        Uri.encodeComponent(systemSymbol),
      ),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSystem200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List Waypoints in System
  /// Return a paginated list of all of the waypoints for a given system.
  ///
  /// If a waypoint is uncharted, it will return the `Uncharted` trait instead
  /// of its actual traits.
  Future<GetSystemWaypoints200Response> getSystemWaypoints(
    String systemSymbol, {
    int? page = 1,
    int? limit = 10,
    WaypointType? type,
    List<WaypointTraitSymbol>? traits,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 20);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints'.replaceAll(
        '{systemSymbol}',
        Uri.encodeComponent(systemSymbol),
      ),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
        if (type != null) 'type': [type.toJson()],
        if (traits != null) 'traits': traits.map((e) => e.toJson()).toList(),
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSystemWaypoints200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Waypoint
  /// View the details of a waypoint.
  ///
  /// If the waypoint is uncharted, it will return the 'Uncharted' trait
  /// instead of its actual traits.
  Future<GetWaypoint200Response> getWaypoint(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}'
          .replaceAll('{systemSymbol}', Uri.encodeComponent(systemSymbol))
          .replaceAll('{waypointSymbol}', Uri.encodeComponent(waypointSymbol)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetWaypoint200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Construction Site
  /// Get construction details for a waypoint. Requires a waypoint with a
  /// property of `isUnderConstruction` to be true.
  Future<GetConstruction200Response> getConstruction(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/construction'
          .replaceAll('{systemSymbol}', Uri.encodeComponent(systemSymbol))
          .replaceAll('{waypointSymbol}', Uri.encodeComponent(waypointSymbol)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetConstruction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Supply Construction Site
  /// Supply a construction site with the specified good. Requires a waypoint
  /// with a property of `isUnderConstruction` to be true.
  ///
  /// The good must be in your ship's cargo. The good will be removed from
  /// your ship's cargo and added to the construction site's materials.
  Future<SupplyConstruction201Response> supplyConstruction(
    String systemSymbol,
    String waypointSymbol,
    SupplyConstructionRequest supplyConstructionRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/systems/{systemSymbol}/waypoints/{waypointSymbol}/construction/supply'
              .replaceAll('{systemSymbol}', Uri.encodeComponent(systemSymbol))
              .replaceAll(
                '{waypointSymbol}',
                Uri.encodeComponent(waypointSymbol),
              ),
      body: supplyConstructionRequest.toJson(),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SupplyConstruction201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Market
  /// Retrieve imports, exports and exchange data from a marketplace. Requires
  /// a waypoint that has the `Marketplace` trait to use.
  ///
  /// Send a ship to the waypoint to access trade good prices and recent
  /// transactions. Refer to the [Market Overview
  /// page](https://docs.spacetraders.io/game-concepts/markets) to gain better
  /// a understanding of the market in the game.
  Future<GetMarket200Response> getMarket(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/market'
          .replaceAll('{systemSymbol}', Uri.encodeComponent(systemSymbol))
          .replaceAll('{waypointSymbol}', Uri.encodeComponent(waypointSymbol)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMarket200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Jump Gate
  /// Get jump gate details for a waypoint. Requires a waypoint of type
  /// `JUMP_GATE` to use.
  ///
  /// Waypoints connected to this jump gate can be found by querying the
  /// waypoints in the system.
  Future<GetJumpGate200Response> getJumpGate(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/jump-gate'
          .replaceAll('{systemSymbol}', Uri.encodeComponent(systemSymbol))
          .replaceAll('{waypointSymbol}', Uri.encodeComponent(waypointSymbol)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetJumpGate200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Shipyard
  /// Get the shipyard for a waypoint. Requires a waypoint that has the
  /// `Shipyard` trait to use. Send a ship to the waypoint to access data on
  /// ships that are currently available for purchase and recent transactions.
  Future<GetShipyard200Response> getShipyard(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/systems/{systemSymbol}/waypoints/{waypointSymbol}/shipyard'
          .replaceAll('{systemSymbol}', Uri.encodeComponent(systemSymbol))
          .replaceAll('{waypointSymbol}', Uri.encodeComponent(waypointSymbol)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetShipyard200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
