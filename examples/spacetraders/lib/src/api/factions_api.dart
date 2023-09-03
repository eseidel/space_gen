import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class FactionsApi {
    Future<GetFactions200Response> GetFactions(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/factions'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetFactions200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetFactions');
        }
    }
    Future<GetFaction200Response> GetFaction(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/factions/%7BfactionSymbol%7D'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetFaction200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetFaction');
        }
    }
}
