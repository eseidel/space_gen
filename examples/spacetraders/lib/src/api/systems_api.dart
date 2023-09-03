import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:spacetraders/src/model/system.dart';
import 'package:spacetraders/src/model/meta.dart';
import 'package:spacetraders/src/model/waypoint.dart';
import 'package:spacetraders/src/model/market.dart';
import 'package:spacetraders/src/model/shipyard.dart';
import 'package:spacetraders/src/model/jump_gate.dart';

class SystemsApi {
    Future<GetSystems200Response> GetSystems(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetSystems200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetSystems');
        }
    }
    Future<GetSystem200Response> GetSystem(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetSystem200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetSystem');
        }
    }
    Future<GetSystemWaypoints200Response> GetSystemWaypoints(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetSystemWaypoints200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetSystemWaypoints');
        }
    }
    Future<GetWaypoint200Response> GetWaypoint(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetWaypoint200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetWaypoint');
        }
    }
    Future<GetMarket200Response> GetMarket(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/market'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMarket200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetMarket');
        }
    }
    Future<GetShipyard200Response> GetShipyard(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/shipyard'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetShipyard200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetShipyard');
        }
    }
    Future<GetJumpGate200Response> GetJumpGate(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/systems/%7BsystemSymbol%7D/waypoints/%7BwaypointSymbol%7D/jump-gate'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetJumpGate200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetJumpGate');
        }
    }
}

class GetSystems200Response {
    GetSystems200Response(
        { 
        required this.data,
        required this.meta,
         }
    );

    final List<System> data;
    final Meta meta;

    factory GetSystems200Response.fromJson(Map<String, dynamic> json) {
        return GetSystems200Response(
            data: json['data'],
            meta: json['meta'],
        );
    }
}class GetSystem200Response {
    GetSystem200Response(
        { 
        required this.data,
         }
    );

    final System data;

    factory GetSystem200Response.fromJson(Map<String, dynamic> json) {
        return GetSystem200Response(
            data: json['data'],
        );
    }
}class GetSystemWaypoints200Response {
    GetSystemWaypoints200Response(
        { 
        required this.data,
        required this.meta,
         }
    );

    final List<Waypoint> data;
    final Meta meta;

    factory GetSystemWaypoints200Response.fromJson(Map<String, dynamic> json) {
        return GetSystemWaypoints200Response(
            data: json['data'],
            meta: json['meta'],
        );
    }
}class GetWaypoint200Response {
    GetWaypoint200Response(
        { 
        required this.data,
         }
    );

    final Waypoint data;

    factory GetWaypoint200Response.fromJson(Map<String, dynamic> json) {
        return GetWaypoint200Response(
            data: json['data'],
        );
    }
}class GetMarket200Response {
    GetMarket200Response(
        { 
        required this.data,
         }
    );

    final Market data;

    factory GetMarket200Response.fromJson(Map<String, dynamic> json) {
        return GetMarket200Response(
            data: json['data'],
        );
    }
}class GetShipyard200Response {
    GetShipyard200Response(
        { 
        required this.data,
         }
    );

    final Shipyard data;

    factory GetShipyard200Response.fromJson(Map<String, dynamic> json) {
        return GetShipyard200Response(
            data: json['data'],
        );
    }
}class GetJumpGate200Response {
    GetJumpGate200Response(
        { 
        required this.data,
         }
    );

    final JumpGate data;

    factory GetJumpGate200Response.fromJson(Map<String, dynamic> json) {
        return GetJumpGate200Response(
            data: json['data'],
        );
    }
}