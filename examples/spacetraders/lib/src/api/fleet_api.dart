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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyShips200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return PurchaseShip201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyShipCargo200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return OrbitShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return ShipRefine201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateChart201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetShipCooldown200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return DockShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateSurvey201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return ExtractResources201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return Jettison200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return JumpShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return NavigateShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetShipNav200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return PatchShipNav200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return WarpShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return SellCargo201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateShipSystemScan201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateShipWaypointScan201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return CreateShipShipScan201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return RefuelShip200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return PurchaseCargo201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return TransferCargo200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return NegotiateContract201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMounts200Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return InstallMount201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            body: jsonEncode({
            }),
        );

        if (response.statusCode == 200) {
            return RemoveMount201Response.fromJson(
                jsonDecode(response.body) as Map<String, dynamic>
            );
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
            data: (json['data'] as List<dynamic>).map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>)).toList(),
            meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.map((e) => e.toJson()).toList(),
            'meta': this.meta.toJson(),
        };
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
            data: PurchaseShip201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            ship: Ship.fromJson(json['ship'] as Map<String, dynamic>),
            transaction: ShipyardTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'ship': this.ship.toJson(),
            'transaction': this.transaction.toJson(),
        };
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
            data: Ship.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            data: ShipCargo.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            data: OrbitShip200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'nav': this.nav.toJson(),
        };
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
            data: ShipRefine201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
    final List<ShipRefine201ResponseDataProducedArray> produced;
    final List<ShipRefine201ResponseDataConsumedArray> consumed;

    factory ShipRefine201ResponseData.fromJson(Map<String, dynamic> json) {
        return ShipRefine201ResponseData(
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            produced: (json['produced'] as List<dynamic>).map<ShipRefine201ResponseDataProducedArray>((e) => ShipRefine201ResponseDataProducedArray.fromJson(e as Map<String, dynamic>)).toList(),
            consumed: (json['consumed'] as List<dynamic>).map<ShipRefine201ResponseDataConsumedArray>((e) => ShipRefine201ResponseDataConsumedArray.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cargo': this.cargo.toJson(),
            'cooldown': this.cooldown.toJson(),
            'produced': this.produced.map((e) => e.toJson()).toList(),
            'consumed': this.consumed.map((e) => e.toJson()).toList(),
        };
    }
}class ShipRefine201ResponseDataProducedArray {
    ShipRefine201ResponseDataProducedArray(
        { 
        required this.tradeSymbol,
        required this.units,
         }
    );

    final String tradeSymbol;
    final int units;

    factory ShipRefine201ResponseDataProducedArray.fromJson(Map<String, dynamic> json) {
        return ShipRefine201ResponseDataProducedArray(
            tradeSymbol: json['tradeSymbol'] as String,
            units: json['units'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'tradeSymbol': this.tradeSymbol,
            'units': this.units,
        };
    }
}class ShipRefine201ResponseDataConsumedArray {
    ShipRefine201ResponseDataConsumedArray(
        { 
        required this.tradeSymbol,
        required this.units,
         }
    );

    final String tradeSymbol;
    final int units;

    factory ShipRefine201ResponseDataConsumedArray.fromJson(Map<String, dynamic> json) {
        return ShipRefine201ResponseDataConsumedArray(
            tradeSymbol: json['tradeSymbol'] as String,
            units: json['units'] as int,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'tradeSymbol': this.tradeSymbol,
            'units': this.units,
        };
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
            data: CreateChart201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            chart: Chart.fromJson(json['chart'] as Map<String, dynamic>),
            waypoint: Waypoint.fromJson(json['waypoint'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'chart': this.chart.toJson(),
            'waypoint': this.waypoint.toJson(),
        };
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
            data: Cooldown.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            data: DockShip200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'nav': this.nav.toJson(),
        };
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
            data: CreateSurvey201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            surveys: (json['surveys'] as List<dynamic>).map<Survey>((e) => Survey.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cooldown': this.cooldown.toJson(),
            'surveys': this.surveys.map((e) => e.toJson()).toList(),
        };
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
            data: ExtractResources201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            extraction: Extraction.fromJson(json['extraction'] as Map<String, dynamic>),
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cooldown': this.cooldown.toJson(),
            'extraction': this.extraction.toJson(),
            'cargo': this.cargo.toJson(),
        };
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
            data: Jettison200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cargo': this.cargo.toJson(),
        };
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
            data: JumpShip200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cooldown': this.cooldown.toJson(),
            'nav': this.nav.toJson(),
        };
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
            data: NavigateShip200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
            nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'fuel': this.fuel.toJson(),
            'nav': this.nav.toJson(),
        };
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
            data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            data: ShipNav.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            data: WarpShip200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
            nav: ShipNav.fromJson(json['nav'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'fuel': this.fuel.toJson(),
            'nav': this.nav.toJson(),
        };
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
            data: SellCargo201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
            transaction: MarketTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'cargo': this.cargo.toJson(),
            'transaction': this.transaction.toJson(),
        };
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
            data: CreateShipSystemScan201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            systems: (json['systems'] as List<dynamic>).map<ScannedSystem>((e) => ScannedSystem.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cooldown': this.cooldown.toJson(),
            'systems': this.systems.map((e) => e.toJson()).toList(),
        };
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
            data: CreateShipWaypointScan201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            waypoints: (json['waypoints'] as List<dynamic>).map<ScannedWaypoint>((e) => ScannedWaypoint.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cooldown': this.cooldown.toJson(),
            'waypoints': this.waypoints.map((e) => e.toJson()).toList(),
        };
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
            data: CreateShipShipScan201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
            ships: (json['ships'] as List<dynamic>).map<ScannedShip>((e) => ScannedShip.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cooldown': this.cooldown.toJson(),
            'ships': this.ships.map((e) => e.toJson()).toList(),
        };
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
            data: RefuelShip200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            fuel: ShipFuel.fromJson(json['fuel'] as Map<String, dynamic>),
            transaction: MarketTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'fuel': this.fuel.toJson(),
            'transaction': this.transaction.toJson(),
        };
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
            data: PurchaseCargo201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
            transaction: MarketTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'cargo': this.cargo.toJson(),
            'transaction': this.transaction.toJson(),
        };
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
            data: TransferCargo200ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'cargo': this.cargo.toJson(),
        };
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
            data: NegotiateContract201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'contract': this.contract.toJson(),
        };
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
            data: (json['data'] as List<dynamic>).map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>)).toList(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.map((e) => e.toJson()).toList(),
        };
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
            data: InstallMount201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            mounts: (json['mounts'] as List<dynamic>).map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>)).toList(),
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
            transaction: ShipModificationTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'mounts': this.mounts.map((e) => e.toJson()).toList(),
            'cargo': this.cargo.toJson(),
            'transaction': this.transaction.toJson(),
        };
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
            data: RemoveMount201ResponseData.fromJson(json['data'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'data': this.data.toJson(),
        };
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
            agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
            mounts: (json['mounts'] as List<dynamic>).map<ShipMount>((e) => ShipMount.fromJson(e as Map<String, dynamic>)).toList(),
            cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
            transaction: ShipModificationTransaction.fromJson(json['transaction'] as Map<String, dynamic>),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'agent': this.agent.toJson(),
            'mounts': this.mounts.map((e) => e.toJson()).toList(),
            'cargo': this.cargo.toJson(),
            'transaction': this.transaction.toJson(),
        };
    }
}