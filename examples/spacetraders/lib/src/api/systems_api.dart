import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
