import 'dart:async';
import 'dart:convert';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/model/get_faction200_response.dart';
import 'package:spacetraders/model/get_factions200_response.dart';
import 'package:spacetraders/model/get_my_factions200_response.dart';

class FactionsApi {
  FactionsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetFactions200Response> getFactions({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/factions',
      parameters: {'page': page, 'limit': limit},
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
    final response = await client.invokeApi(
      method: Method.get,
      path: '/factions/{factionSymbol}'.replaceAll(
        '{factionSymbol}',
        factionSymbol,
      ),
    );

    if (response.statusCode == 200) {
      return GetFaction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getFaction');
    }
  }

  Future<GetMyFactions200Response> getMyFactions({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/factions',
      parameters: {'page': page, 'limit': limit},
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
