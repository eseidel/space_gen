import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model/get_supply_chain200_response.dart';

class DataApi {
  DataApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetSupplyChain200Response> getSupplyChain() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/market/supply-chain',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSupplyChain200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getSupplyChain',
    );
  }

  Future<void> websocketDepartureEvents() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/socket.io',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return;
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $websocketDepartureEvents',
    );
  }
}
