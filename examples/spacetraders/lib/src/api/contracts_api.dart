import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
