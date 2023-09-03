import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:spacetraders/src/model/faction.dart';
import 'package:spacetraders/src/model/meta.dart';

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

class GetFactions200Response {
    GetFactions200Response(
        { 
        required this.data,
        required this.meta,
         }
    );

    final List<Faction> data;
    final Meta meta;

    factory GetFactions200Response.fromJson(Map<String, dynamic> json) {
        return GetFactions200Response(
            data: json['data'],
            meta: json['meta'],
        );
    }
}class GetFaction200Response {
    GetFaction200Response(
        { 
        required this.data,
         }
    );

    final Faction data;

    factory GetFaction200Response.fromJson(Map<String, dynamic> json) {
        return GetFaction200Response(
            data: json['data'],
        );
    }
}