import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AgentsApi {
    Future<GetMyAgent200Response> GetMyAgent(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/my/agent'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetMyAgent200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetMyAgent');
        }
    }
    Future<GetAgents200Response> GetAgents(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/agents'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetAgents200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetAgents');
        }
    }
    Future<GetAgent200Response> GetAgent(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/agents/%7BagentSymbol%7D'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetAgent200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetAgent');
        }
    }
}

