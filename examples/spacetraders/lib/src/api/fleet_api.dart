import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class FleetApi {
    Future<GetMyShips200Response> GetMyShips(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyShips200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetMyShips');
        }
    }
    Future<PurchaseShip201Response> PurchaseShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return PurchaseShip201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load PurchaseShip');
        }
    }
    Future<GetMyShip200Response> GetMyShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetMyShip');
        }
    }
    Future<GetMyShipCargo200Response> GetMyShipCargo(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/cargo'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyShipCargo200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetMyShipCargo');
        }
    }
    Future<OrbitShip200Response> OrbitShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/orbit'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return OrbitShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load OrbitShip');
        }
    }
    Future<ShipRefine201Response> ShipRefine(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/refine'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return ShipRefine201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load ShipRefine');
        }
    }
    Future<CreateChart201Response> CreateChart(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/chart'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateChart201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load CreateChart');
        }
    }
    Future<GetShipCooldown200Response> GetShipCooldown(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/cooldown'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetShipCooldown200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetShipCooldown');
        }
    }
    Future<DockShip200Response> DockShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/dock'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return DockShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load DockShip');
        }
    }
    Future<CreateSurvey201Response> CreateSurvey(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/survey'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateSurvey201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load CreateSurvey');
        }
    }
    Future<ExtractResources201Response> ExtractResources(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/extract'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return ExtractResources201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load ExtractResources');
        }
    }
    Future<Jettison200Response> Jettison(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/jettison'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return Jettison200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load Jettison');
        }
    }
    Future<JumpShip200Response> JumpShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/jump'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return JumpShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load JumpShip');
        }
    }
    Future<NavigateShip200Response> NavigateShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/navigate'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return NavigateShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load NavigateShip');
        }
    }
    Future<GetShipNav200Response> GetShipNav(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/nav'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetShipNav200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetShipNav');
        }
    }
    Future<PatchShipNav200Response> PatchShipNav(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/nav'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return PatchShipNav200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load PatchShipNav');
        }
    }
    Future<WarpShip200Response> WarpShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/warp'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return WarpShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load WarpShip');
        }
    }
    Future<SellCargo201Response> SellCargo(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/sell'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return SellCargo201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load SellCargo');
        }
    }
    Future<CreateShipSystemScan201Response> CreateShipSystemScan(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/scan/systems'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateShipSystemScan201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load CreateShipSystemScan');
        }
    }
    Future<CreateShipWaypointScan201Response> CreateShipWaypointScan(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/scan/waypoints'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateShipWaypointScan201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load CreateShipWaypointScan');
        }
    }
    Future<CreateShipShipScan201Response> CreateShipShipScan(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/scan/ships'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateShipShipScan201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load CreateShipShipScan');
        }
    }
    Future<RefuelShip200Response> RefuelShip(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/refuel'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return RefuelShip200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load RefuelShip');
        }
    }
    Future<PurchaseCargo201Response> PurchaseCargo(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/purchase'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return PurchaseCargo201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load PurchaseCargo');
        }
    }
    Future<TransferCargo200Response> TransferCargo(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/transfer'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return TransferCargo200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load TransferCargo');
        }
    }
    Future<NegotiateContract201Response> NegotiateContract(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/negotiate/contract'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return NegotiateContract201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load NegotiateContract');
        }
    }
    Future<GetMounts200Response> GetMounts(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/mounts'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMounts200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetMounts');
        }
    }
    Future<InstallMount201Response> InstallMount(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/mounts/install'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return InstallMount201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load InstallMount');
        }
    }
    Future<RemoveMount201Response> RemoveMount(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/ships/%7BshipSymbol%7D/mounts/remove'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return RemoveMount201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load RemoveMount');
        }
    }
}

