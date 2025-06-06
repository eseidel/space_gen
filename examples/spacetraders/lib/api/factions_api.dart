import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
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
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getFactions',
    );
  }

  Future<GetFaction200Response> getFaction(String factionSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/factions/{factionSymbol}'.replaceAll(
        '{factionSymbol}',
        factionSymbol,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetFaction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getFaction',
    );
  }

  Future<GetMyFactions200Response> getMyFactions({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/factions',
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMyFactions',
    );
  }
}
