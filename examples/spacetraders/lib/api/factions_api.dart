import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/get_faction200_response.dart';
import 'package:spacetraders/model/get_factions200_response.dart';
import 'package:spacetraders/model/get_my_factions200_response.dart';

class FactionsApi {
  Future<GetFactions200Response> getFactions(int page, int limit) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/factions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'page': page, 'limit': limit}),
    );

    if (response.statusCode == 200) {
      return GetFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getFactions');
    }
  }

  Future<GetFaction200Response> getFaction(String factionSymbol) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/factions/%7BfactionSymbol%7D'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'factionSymbol': factionSymbol}),
    );

    if (response.statusCode == 200) {
      return GetFaction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getFaction');
    }
  }

  Future<GetMyFactions200Response> getMyFactions(int page, int limit) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/factions'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'page': page, 'limit': limit}),
    );

    if (response.statusCode == 200) {
      return GetMyFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyFactions');
    }
  }
}
