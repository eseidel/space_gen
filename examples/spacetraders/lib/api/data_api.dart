import 'dart:async';
import 'dart:convert';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/model/get_supply_chain200_response.dart';

class DataApi {
  DataApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetSupplyChain200Response> getSupplyChain() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/market/supply-chain',
    );

    if (response.statusCode == 200) {
      return GetSupplyChain200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getSupplyChain');
    }
  }

  Future<void> websocketDepartureEvents() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/socket.io',
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load websocketDepartureEvents');
    }
  }
}
