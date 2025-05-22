import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/accept_contract200_response.dart';
import 'package:spacetraders/model/deliver_contract200_response.dart';
import 'package:spacetraders/model/deliver_contract_request.dart';
import 'package:spacetraders/model/fulfill_contract200_response.dart';
import 'package:spacetraders/model/get_contract200_response.dart';
import 'package:spacetraders/model/get_contracts200_response.dart';

class ContractsApi {
  Future<GetContracts200Response> getContracts(int page, int limit) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/contracts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'page': page, 'limit': limit}),
    );

    if (response.statusCode == 200) {
      return GetContracts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getContracts');
    }
  }

  Future<GetContract200Response> getContract(String contractId) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'contractId': contractId}),
    );

    if (response.statusCode == 200) {
      return GetContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getContract');
    }
  }

  Future<AcceptContract200Response> acceptContract(String contractId) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/accept',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'contractId': contractId}),
    );

    if (response.statusCode == 200) {
      return AcceptContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load acceptContract');
    }
  }

  Future<FulfillContract200Response> fulfillContract(String contractId) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/fulfill',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'contractId': contractId}),
    );

    if (response.statusCode == 200) {
      return FulfillContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load fulfillContract');
    }
  }

  Future<DeliverContract200Response> deliverContract(
    String contractId,
    DeliverContractRequest deliverContractRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/deliver',
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contractId': contractId,
        'deliverContractRequest': deliverContractRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return DeliverContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load deliverContract');
    }
  }
}
