import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:spacetraders/src/model/ship.dart';
import 'package:spacetraders/src/model/meta.dart';
import 'package:spacetraders/src/model/agent.dart';
import 'package:spacetraders/src/model/shipyard_transaction.dart';
import 'package:spacetraders/src/model/ship_cargo.dart';
import 'package:spacetraders/src/model/ship_nav.dart';
import 'package:spacetraders/src/model/cooldown.dart';
import 'package:spacetraders/src/model/chart.dart';
import 'package:spacetraders/src/model/waypoint.dart';
import 'package:spacetraders/src/model/survey.dart';
import 'package:spacetraders/src/model/extraction.dart';
import 'package:spacetraders/src/model/ship_fuel.dart';
import 'package:spacetraders/src/model/market_transaction.dart';
import 'package:spacetraders/src/model/scanned_system.dart';
import 'package:spacetraders/src/model/scanned_waypoint.dart';
import 'package:spacetraders/src/model/scanned_ship.dart';
import 'package:spacetraders/src/model/contract.dart';
import 'package:spacetraders/src/model/ship_mount.dart';
import 'package:spacetraders/src/model/ship_modification_transaction.dart';

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

class GetMyShips200Response {
    GetMyShips200Response(
        { 
        required this.data,
        required this.meta,
         }
    );

    final List<Ship> data;
    final Meta meta;

    factory GetMyShips200Response.fromJson(Map<String, dynamic> json) {
        return GetMyShips200Response(
            data: json['data'],
            meta: json['meta'],
        );
    }
}class PurchaseShip201Response {
    PurchaseShip201Response(
        { 
        required this.data,
         }
    );

    final PurchaseShip201ResponseData data;

    factory PurchaseShip201Response.fromJson(Map<String, dynamic> json) {
        return PurchaseShip201Response(
            data: json['data'],
        );
    }
}class PurchaseShip201ResponseData {
    PurchaseShip201ResponseData(
        { 
        required this.agent,
        required this.ship,
        required this.transaction,
         }
    );

    final Agent agent;
    final Ship ship;
    final ShipyardTransaction transaction;

    factory PurchaseShip201ResponseData.fromJson(Map<String, dynamic> json) {
        return PurchaseShip201ResponseData(
            agent: json['agent'],
            ship: json['ship'],
            transaction: json['transaction'],
        );
    }
}class GetMyShip200Response {
    GetMyShip200Response(
        { 
        required this.data,
         }
    );

    final Ship data;

    factory GetMyShip200Response.fromJson(Map<String, dynamic> json) {
        return GetMyShip200Response(
            data: json['data'],
        );
    }
}class GetMyShipCargo200Response {
    GetMyShipCargo200Response(
        { 
        required this.data,
         }
    );

    final ShipCargo data;

    factory GetMyShipCargo200Response.fromJson(Map<String, dynamic> json) {
        return GetMyShipCargo200Response(
            data: json['data'],
        );
    }
}class OrbitShip200Response {
    OrbitShip200Response(
        { 
        required this.data,
         }
    );

    final OrbitShip200ResponseData data;

    factory OrbitShip200Response.fromJson(Map<String, dynamic> json) {
        return OrbitShip200Response(
            data: json['data'],
        );
    }
}class OrbitShip200ResponseData {
    OrbitShip200ResponseData(
        { 
        required this.nav,
         }
    );

    final ShipNav nav;

    factory OrbitShip200ResponseData.fromJson(Map<String, dynamic> json) {
        return OrbitShip200ResponseData(
            nav: json['nav'],
        );
    }
}class ShipRefine201Response {
    ShipRefine201Response(
        { 
        required this.data,
         }
    );

    final ShipRefine201ResponseData data;

    factory ShipRefine201Response.fromJson(Map<String, dynamic> json) {
        return ShipRefine201Response(
            data: json['data'],
        );
    }
}class ShipRefine201ResponseData {
    ShipRefine201ResponseData(
        { 
        required this.cargo,
        required this.cooldown,
        required this.produced,
        required this.consumed,
         }
    );

    final ShipCargo cargo;
    final Cooldown cooldown;
    final List<ShipRefine201ResponseDataProducedArrayArray> produced;
    final List<ShipRefine201ResponseDataConsumedArrayArray> consumed;

    factory ShipRefine201ResponseData.fromJson(Map<String, dynamic> json) {
        return ShipRefine201ResponseData(
            cargo: json['cargo'],
            cooldown: json['cooldown'],
            produced: json['produced'],
            consumed: json['consumed'],
        );
    }
}class ShipRefine201ResponseDataProducedArrayArray {
    ShipRefine201ResponseDataProducedArrayArray(
        { 
        required this.tradeSymbol,
        required this.units,
         }
    );

    final String tradeSymbol;
    final int units;

    factory ShipRefine201ResponseDataProducedArrayArray.fromJson(Map<String, dynamic> json) {
        return ShipRefine201ResponseDataProducedArrayArray(
            tradeSymbol: json['tradeSymbol'],
            units: json['units'],
        );
    }
}class ShipRefine201ResponseDataConsumedArrayArray {
    ShipRefine201ResponseDataConsumedArrayArray(
        { 
        required this.tradeSymbol,
        required this.units,
         }
    );

    final String tradeSymbol;
    final int units;

    factory ShipRefine201ResponseDataConsumedArrayArray.fromJson(Map<String, dynamic> json) {
        return ShipRefine201ResponseDataConsumedArrayArray(
            tradeSymbol: json['tradeSymbol'],
            units: json['units'],
        );
    }
}class CreateChart201Response {
    CreateChart201Response(
        { 
        required this.data,
         }
    );

    final CreateChart201ResponseData data;

    factory CreateChart201Response.fromJson(Map<String, dynamic> json) {
        return CreateChart201Response(
            data: json['data'],
        );
    }
}class CreateChart201ResponseData {
    CreateChart201ResponseData(
        { 
        required this.chart,
        required this.waypoint,
         }
    );

    final Chart chart;
    final Waypoint waypoint;

    factory CreateChart201ResponseData.fromJson(Map<String, dynamic> json) {
        return CreateChart201ResponseData(
            chart: json['chart'],
            waypoint: json['waypoint'],
        );
    }
}class GetShipCooldown200Response {
    GetShipCooldown200Response(
        { 
        required this.data,
         }
    );

    final Cooldown data;

    factory GetShipCooldown200Response.fromJson(Map<String, dynamic> json) {
        return GetShipCooldown200Response(
            data: json['data'],
        );
    }
}class DockShip200Response {
    DockShip200Response(
        { 
        required this.data,
         }
    );

    final DockShip200ResponseData data;

    factory DockShip200Response.fromJson(Map<String, dynamic> json) {
        return DockShip200Response(
            data: json['data'],
        );
    }
}class DockShip200ResponseData {
    DockShip200ResponseData(
        { 
        required this.nav,
         }
    );

    final ShipNav nav;

    factory DockShip200ResponseData.fromJson(Map<String, dynamic> json) {
        return DockShip200ResponseData(
            nav: json['nav'],
        );
    }
}class CreateSurvey201Response {
    CreateSurvey201Response(
        { 
        required this.data,
         }
    );

    final CreateSurvey201ResponseData data;

    factory CreateSurvey201Response.fromJson(Map<String, dynamic> json) {
        return CreateSurvey201Response(
            data: json['data'],
        );
    }
}class CreateSurvey201ResponseData {
    CreateSurvey201ResponseData(
        { 
        required this.cooldown,
        required this.surveys,
         }
    );

    final Cooldown cooldown;
    final List<Survey> surveys;

    factory CreateSurvey201ResponseData.fromJson(Map<String, dynamic> json) {
        return CreateSurvey201ResponseData(
            cooldown: json['cooldown'],
            surveys: json['surveys'],
        );
    }
}class ExtractResources201Response {
    ExtractResources201Response(
        { 
        required this.data,
         }
    );

    final ExtractResources201ResponseData data;

    factory ExtractResources201Response.fromJson(Map<String, dynamic> json) {
        return ExtractResources201Response(
            data: json['data'],
        );
    }
}class ExtractResources201ResponseData {
    ExtractResources201ResponseData(
        { 
        required this.cooldown,
        required this.extraction,
        required this.cargo,
         }
    );

    final Cooldown cooldown;
    final Extraction extraction;
    final ShipCargo cargo;

    factory ExtractResources201ResponseData.fromJson(Map<String, dynamic> json) {
        return ExtractResources201ResponseData(
            cooldown: json['cooldown'],
            extraction: json['extraction'],
            cargo: json['cargo'],
        );
    }
}class Jettison200Response {
    Jettison200Response(
        { 
        required this.data,
         }
    );

    final Jettison200ResponseData data;

    factory Jettison200Response.fromJson(Map<String, dynamic> json) {
        return Jettison200Response(
            data: json['data'],
        );
    }
}class Jettison200ResponseData {
    Jettison200ResponseData(
        { 
        required this.cargo,
         }
    );

    final ShipCargo cargo;

    factory Jettison200ResponseData.fromJson(Map<String, dynamic> json) {
        return Jettison200ResponseData(
            cargo: json['cargo'],
        );
    }
}class JumpShip200Response {
    JumpShip200Response(
        { 
        required this.data,
         }
    );

    final JumpShip200ResponseData data;

    factory JumpShip200Response.fromJson(Map<String, dynamic> json) {
        return JumpShip200Response(
            data: json['data'],
        );
    }
}class JumpShip200ResponseData {
    JumpShip200ResponseData(
        { 
        required this.cooldown,
        required this.nav,
         }
    );

    final Cooldown cooldown;
    final ShipNav nav;

    factory JumpShip200ResponseData.fromJson(Map<String, dynamic> json) {
        return JumpShip200ResponseData(
            cooldown: json['cooldown'],
            nav: json['nav'],
        );
    }
}class NavigateShip200Response {
    NavigateShip200Response(
        { 
        required this.data,
         }
    );

    final NavigateShip200ResponseData data;

    factory NavigateShip200Response.fromJson(Map<String, dynamic> json) {
        return NavigateShip200Response(
            data: json['data'],
        );
    }
}class NavigateShip200ResponseData {
    NavigateShip200ResponseData(
        { 
        required this.fuel,
        required this.nav,
         }
    );

    final ShipFuel fuel;
    final ShipNav nav;

    factory NavigateShip200ResponseData.fromJson(Map<String, dynamic> json) {
        return NavigateShip200ResponseData(
            fuel: json['fuel'],
            nav: json['nav'],
        );
    }
}class GetShipNav200Response {
    GetShipNav200Response(
        { 
        required this.data,
         }
    );

    final ShipNav data;

    factory GetShipNav200Response.fromJson(Map<String, dynamic> json) {
        return GetShipNav200Response(
            data: json['data'],
        );
    }
}class PatchShipNav200Response {
    PatchShipNav200Response(
        { 
        required this.data,
         }
    );

    final ShipNav data;

    factory PatchShipNav200Response.fromJson(Map<String, dynamic> json) {
        return PatchShipNav200Response(
            data: json['data'],
        );
    }
}class WarpShip200Response {
    WarpShip200Response(
        { 
        required this.data,
         }
    );

    final WarpShip200ResponseData data;

    factory WarpShip200Response.fromJson(Map<String, dynamic> json) {
        return WarpShip200Response(
            data: json['data'],
        );
    }
}class WarpShip200ResponseData {
    WarpShip200ResponseData(
        { 
        required this.fuel,
        required this.nav,
         }
    );

    final ShipFuel fuel;
    final ShipNav nav;

    factory WarpShip200ResponseData.fromJson(Map<String, dynamic> json) {
        return WarpShip200ResponseData(
            fuel: json['fuel'],
            nav: json['nav'],
        );
    }
}class SellCargo201Response {
    SellCargo201Response(
        { 
        required this.data,
         }
    );

    final SellCargo201ResponseData data;

    factory SellCargo201Response.fromJson(Map<String, dynamic> json) {
        return SellCargo201Response(
            data: json['data'],
        );
    }
}class SellCargo201ResponseData {
    SellCargo201ResponseData(
        { 
        required this.agent,
        required this.cargo,
        required this.transaction,
         }
    );

    final Agent agent;
    final ShipCargo cargo;
    final MarketTransaction transaction;

    factory SellCargo201ResponseData.fromJson(Map<String, dynamic> json) {
        return SellCargo201ResponseData(
            agent: json['agent'],
            cargo: json['cargo'],
            transaction: json['transaction'],
        );
    }
}class CreateShipSystemScan201Response {
    CreateShipSystemScan201Response(
        { 
        required this.data,
         }
    );

    final CreateShipSystemScan201ResponseData data;

    factory CreateShipSystemScan201Response.fromJson(Map<String, dynamic> json) {
        return CreateShipSystemScan201Response(
            data: json['data'],
        );
    }
}class CreateShipSystemScan201ResponseData {
    CreateShipSystemScan201ResponseData(
        { 
        required this.cooldown,
        required this.systems,
         }
    );

    final Cooldown cooldown;
    final List<ScannedSystem> systems;

    factory CreateShipSystemScan201ResponseData.fromJson(Map<String, dynamic> json) {
        return CreateShipSystemScan201ResponseData(
            cooldown: json['cooldown'],
            systems: json['systems'],
        );
    }
}class CreateShipWaypointScan201Response {
    CreateShipWaypointScan201Response(
        { 
        required this.data,
         }
    );

    final CreateShipWaypointScan201ResponseData data;

    factory CreateShipWaypointScan201Response.fromJson(Map<String, dynamic> json) {
        return CreateShipWaypointScan201Response(
            data: json['data'],
        );
    }
}class CreateShipWaypointScan201ResponseData {
    CreateShipWaypointScan201ResponseData(
        { 
        required this.cooldown,
        required this.waypoints,
         }
    );

    final Cooldown cooldown;
    final List<ScannedWaypoint> waypoints;

    factory CreateShipWaypointScan201ResponseData.fromJson(Map<String, dynamic> json) {
        return CreateShipWaypointScan201ResponseData(
            cooldown: json['cooldown'],
            waypoints: json['waypoints'],
        );
    }
}class CreateShipShipScan201Response {
    CreateShipShipScan201Response(
        { 
        required this.data,
         }
    );

    final CreateShipShipScan201ResponseData data;

    factory CreateShipShipScan201Response.fromJson(Map<String, dynamic> json) {
        return CreateShipShipScan201Response(
            data: json['data'],
        );
    }
}class CreateShipShipScan201ResponseData {
    CreateShipShipScan201ResponseData(
        { 
        required this.cooldown,
        required this.ships,
         }
    );

    final Cooldown cooldown;
    final List<ScannedShip> ships;

    factory CreateShipShipScan201ResponseData.fromJson(Map<String, dynamic> json) {
        return CreateShipShipScan201ResponseData(
            cooldown: json['cooldown'],
            ships: json['ships'],
        );
    }
}class RefuelShip200Response {
    RefuelShip200Response(
        { 
        required this.data,
         }
    );

    final RefuelShip200ResponseData data;

    factory RefuelShip200Response.fromJson(Map<String, dynamic> json) {
        return RefuelShip200Response(
            data: json['data'],
        );
    }
}class RefuelShip200ResponseData {
    RefuelShip200ResponseData(
        { 
        required this.agent,
        required this.fuel,
        required this.transaction,
         }
    );

    final Agent agent;
    final ShipFuel fuel;
    final MarketTransaction transaction;

    factory RefuelShip200ResponseData.fromJson(Map<String, dynamic> json) {
        return RefuelShip200ResponseData(
            agent: json['agent'],
            fuel: json['fuel'],
            transaction: json['transaction'],
        );
    }
}class PurchaseCargo201Response {
    PurchaseCargo201Response(
        { 
        required this.data,
         }
    );

    final PurchaseCargo201ResponseData data;

    factory PurchaseCargo201Response.fromJson(Map<String, dynamic> json) {
        return PurchaseCargo201Response(
            data: json['data'],
        );
    }
}class PurchaseCargo201ResponseData {
    PurchaseCargo201ResponseData(
        { 
        required this.agent,
        required this.cargo,
        required this.transaction,
         }
    );

    final Agent agent;
    final ShipCargo cargo;
    final MarketTransaction transaction;

    factory PurchaseCargo201ResponseData.fromJson(Map<String, dynamic> json) {
        return PurchaseCargo201ResponseData(
            agent: json['agent'],
            cargo: json['cargo'],
            transaction: json['transaction'],
        );
    }
}class TransferCargo200Response {
    TransferCargo200Response(
        { 
        required this.data,
         }
    );

    final TransferCargo200ResponseData data;

    factory TransferCargo200Response.fromJson(Map<String, dynamic> json) {
        return TransferCargo200Response(
            data: json['data'],
        );
    }
}class TransferCargo200ResponseData {
    TransferCargo200ResponseData(
        { 
        required this.cargo,
         }
    );

    final ShipCargo cargo;

    factory TransferCargo200ResponseData.fromJson(Map<String, dynamic> json) {
        return TransferCargo200ResponseData(
            cargo: json['cargo'],
        );
    }
}class NegotiateContract201Response {
    NegotiateContract201Response(
        { 
        required this.data,
         }
    );

    final NegotiateContract201ResponseData data;

    factory NegotiateContract201Response.fromJson(Map<String, dynamic> json) {
        return NegotiateContract201Response(
            data: json['data'],
        );
    }
}class NegotiateContract201ResponseData {
    NegotiateContract201ResponseData(
        { 
        required this.contract,
         }
    );

    final Contract contract;

    factory NegotiateContract201ResponseData.fromJson(Map<String, dynamic> json) {
        return NegotiateContract201ResponseData(
            contract: json['contract'],
        );
    }
}class GetMounts200Response {
    GetMounts200Response(
        { 
        required this.data,
         }
    );

    final List<ShipMount> data;

    factory GetMounts200Response.fromJson(Map<String, dynamic> json) {
        return GetMounts200Response(
            data: json['data'],
        );
    }
}class InstallMount201Response {
    InstallMount201Response(
        { 
        required this.data,
         }
    );

    final InstallMount201ResponseData data;

    factory InstallMount201Response.fromJson(Map<String, dynamic> json) {
        return InstallMount201Response(
            data: json['data'],
        );
    }
}class InstallMount201ResponseData {
    InstallMount201ResponseData(
        { 
        required this.agent,
        required this.mounts,
        required this.cargo,
        required this.transaction,
         }
    );

    final Agent agent;
    final List<ShipMount> mounts;
    final ShipCargo cargo;
    final ShipModificationTransaction transaction;

    factory InstallMount201ResponseData.fromJson(Map<String, dynamic> json) {
        return InstallMount201ResponseData(
            agent: json['agent'],
            mounts: json['mounts'],
            cargo: json['cargo'],
            transaction: json['transaction'],
        );
    }
}class RemoveMount201Response {
    RemoveMount201Response(
        { 
        required this.data,
         }
    );

    final RemoveMount201ResponseData data;

    factory RemoveMount201Response.fromJson(Map<String, dynamic> json) {
        return RemoveMount201Response(
            data: json['data'],
        );
    }
}class RemoveMount201ResponseData {
    RemoveMount201ResponseData(
        { 
        required this.agent,
        required this.mounts,
        required this.cargo,
        required this.transaction,
         }
    );

    final Agent agent;
    final List<ShipMount> mounts;
    final ShipCargo cargo;
    final ShipModificationTransaction transaction;

    factory RemoveMount201ResponseData.fromJson(Map<String, dynamic> json) {
        return RemoveMount201ResponseData(
            agent: json['agent'],
            mounts: json['mounts'],
            cargo: json['cargo'],
            transaction: json['transaction'],
        );
    }
}