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
import 'package:spacetraders/model/one_of.dart';
import 'package:spacetraders/model/supply_construction201_response.dart';
import 'package:spacetraders/model/supply_construction_request.dart';
import 'package:spacetraders/model/waypoint_type.dart';

class SystemsApi {
  Future<GetSystems200Response> getSystems(
    int page,
    int limit,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/systems'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      return GetSystems200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSystems');
    }
  }

  Future<GetSystem200Response> getSystem() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
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
    OneOf traits,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
        'type': type.toJson(),
        'traits': traits.toJson(),
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

  Future<GetWaypoint200Response> getWaypoint() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetWaypoint200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getWaypoint');
    }
  }

  Future<GetMarket200Response> getMarket() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/market',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMarket200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMarket');
    }
  }

  Future<GetShipyard200Response> getShipyard() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/shipyard',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetShipyard200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getShipyard');
    }
  }

  Future<GetJumpGate200Response> getJumpGate() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/jump-gate',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetJumpGate200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getJumpGate');
    }
  }

  Future<GetConstruction200Response> getConstruction() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/construction',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
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
    SupplyConstructionRequest supplyConstructionRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/construction/supply',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
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
}
