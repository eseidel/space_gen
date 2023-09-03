import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:spacetraders/src/model/contract.dart';
import 'package:spacetraders/src/model/meta.dart';
import 'package:spacetraders/src/model/contract.dart';
import 'package:spacetraders/src/model/agent.dart';
import 'package:spacetraders/src/model/contract.dart';
import 'package:spacetraders/src/model/contract.dart';
import 'package:spacetraders/src/model/ship_cargo.dart';
import 'package:spacetraders/src/model/agent.dart';
import 'package:spacetraders/src/model/contract.dart';

class ContractsApi {
    Future<GetContracts200Response> GetContracts(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/contracts'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetContracts200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetContracts');
        }
    }
    Future<GetContract200Response> GetContract(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetContract200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetContract');
        }
    }
    Future<AcceptContract200Response> AcceptContract(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/accept'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return AcceptContract200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load AcceptContract');
        }
    }
    Future<DeliverContract200Response> DeliverContract(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/deliver'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return DeliverContract200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load DeliverContract');
        }
    }
    Future<FulfillContract200Response> FulfillContract(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/fulfill'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return FulfillContract200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load FulfillContract');
        }
    }
}

class GetContracts200Response {
    GetContracts200Response(
        { 
        required this.data,
        required this.meta,
         }
    );

    final List<Contract> data;
    final Meta meta;

    factory GetContracts200Response.fromJson(Map<String, dynamic> json) {
        return GetContracts200Response(
            data: json['data'],
            meta: json['meta'],
        );
    }
}class GetContract200Response {
    GetContract200Response(
        { 
        required this.data,
         }
    );

    final Contract data;

    factory GetContract200Response.fromJson(Map<String, dynamic> json) {
        return GetContract200Response(
            data: json['data'],
        );
    }
}class AcceptContract200Response {
    AcceptContract200Response(
        { 
        required this.data,
         }
    );

    final SpaceTradersdata data;

    factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
        return AcceptContract200Response(
            data: json['data'],
        );
    }
}class SpaceTradersdata {
    SpaceTradersdata(
        { 
        required this.agent,
        required this.contract,
         }
    );

    final Agent agent;
    final Contract contract;

    factory SpaceTradersdata.fromJson(Map<String, dynamic> json) {
        return SpaceTradersdata(
            agent: json['agent'],
            contract: json['contract'],
        );
    }
}class DeliverContract200Response {
    DeliverContract200Response(
        { 
        required this.data,
         }
    );

    final SpaceTradersdata data;

    factory DeliverContract200Response.fromJson(Map<String, dynamic> json) {
        return DeliverContract200Response(
            data: json['data'],
        );
    }
}class SpaceTradersdata {
    SpaceTradersdata(
        { 
        required this.contract,
        required this.cargo,
         }
    );

    final Contract contract;
    final ShipCargo cargo;

    factory SpaceTradersdata.fromJson(Map<String, dynamic> json) {
        return SpaceTradersdata(
            contract: json['contract'],
            cargo: json['cargo'],
        );
    }
}class FulfillContract200Response {
    FulfillContract200Response(
        { 
        required this.data,
         }
    );

    final SpaceTradersdata data;

    factory FulfillContract200Response.fromJson(Map<String, dynamic> json) {
        return FulfillContract200Response(
            data: json['data'],
        );
    }
}class SpaceTradersdata {
    SpaceTradersdata(
        { 
        required this.agent,
        required this.contract,
         }
    );

    final Agent agent;
    final Contract contract;

    factory SpaceTradersdata.fromJson(Map<String, dynamic> json) {
        return SpaceTradersdata(
            agent: json['agent'],
            contract: json['contract'],
        );
    }
}