import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/get_supply_chain200_response.dart';

class DataApi {
  Future<GetSupplyChain200Response> getSupplyChain() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/market/supply-chain'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
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
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/socket.io'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load websocketDepartureEvents');
    }
  }
}
