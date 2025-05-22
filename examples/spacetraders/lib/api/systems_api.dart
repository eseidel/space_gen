import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
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
  Future<GetSystems200Response> getSystems(int page, int limit) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/systems'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'page': page, 'limit': limit}),
    );

    if (response.statusCode == 200) {
      return GetSystems200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystems');
    }
  }

  Future<GetSystem200Response> getSystem(String systemSymbol) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'systemSymbol': systemSymbol}),
    );

    if (response.statusCode == 200) {
      return GetSystem200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystem');
    }
  }

  Future<GetSystemWaypoints200Response> getSystemWaypoints(
    int page,
    int limit,
    WaypointType type,
    List<WaypointTraitSymbol> traits,
    String systemSymbol,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'page': page,
        'limit': limit,
        'type': type.toJson(),
        'traits': traits,
        'systemSymbol': systemSymbol,
      }),
    );

    if (response.statusCode == 200) {
      return GetSystemWaypoints200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystemWaypoints');
    }
  }

  Future<GetWaypoint200Response> getWaypoint(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemSymbol': systemSymbol,
        'waypointSymbol': waypointSymbol,
      }),
    );

    if (response.statusCode == 200) {
      return GetWaypoint200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getWaypoint');
    }
  }

  Future<GetConstruction200Response> getConstruction(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/construction',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemSymbol': systemSymbol,
        'waypointSymbol': waypointSymbol,
      }),
    );

    if (response.statusCode == 200) {
      return GetConstruction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getConstruction');
    }
  }

  Future<SupplyConstruction201Response> supplyConstruction(
    String systemSymbol,
    String waypointSymbol,
    SupplyConstructionRequest supplyConstructionRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/construction/supply',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemSymbol': systemSymbol,
        'waypointSymbol': waypointSymbol,
        'supplyConstructionRequest': supplyConstructionRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return SupplyConstruction201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load supplyConstruction');
    }
  }

  Future<GetMarket200Response> getMarket(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/market',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemSymbol': systemSymbol,
        'waypointSymbol': waypointSymbol,
      }),
    );

    if (response.statusCode == 200) {
      return GetMarket200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMarket');
    }
  }

  Future<GetJumpGate200Response> getJumpGate(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/jump-gate',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemSymbol': systemSymbol,
        'waypointSymbol': waypointSymbol,
      }),
    );

    if (response.statusCode == 200) {
      return GetJumpGate200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getJumpGate');
    }
  }

  Future<GetShipyard200Response> getShipyard(
    String systemSymbol,
    String waypointSymbol,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/shipyard',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemSymbol': systemSymbol,
        'waypointSymbol': waypointSymbol,
      }),
    );

    if (response.statusCode == 200) {
      return GetShipyard200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipyard');
    }
  }
}
