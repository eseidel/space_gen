import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/get_my_account200_response.dart';
import 'package:spacetraders/model/register201_response.dart';
import 'package:spacetraders/model/register_request.dart';

class AccountsApi {
  Future<GetMyAccount200Response> getMyAccount() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/account'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMyAccount200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyAccount');
    }
  }

  Future<Register201Response> register(RegisterRequest registerRequest) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'registerRequest': registerRequest.toJson()}),
    );

    if (response.statusCode == 200) {
      return Register201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load register');
    }
  }
}
