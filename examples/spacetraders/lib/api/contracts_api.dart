import 'dart:async';
import 'dart:convert';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/model/accept_contract200_response.dart';
import 'package:spacetraders/model/deliver_contract200_response.dart';
import 'package:spacetraders/model/deliver_contract_request.dart';
import 'package:spacetraders/model/fulfill_contract200_response.dart';
import 'package:spacetraders/model/get_contract200_response.dart';
import 'package:spacetraders/model/get_contracts200_response.dart';

class ContractsApi {
  ContractsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetContracts200Response> getContracts(int page, int limit) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/contracts',
      parameters: {'page': page, 'limit': limit},
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
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/contracts/{contractId}',
      parameters: {'contractId': contractId},
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
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/accept',
      parameters: {'contractId': contractId},
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
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/fulfill',
      parameters: {'contractId': contractId},
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
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/deliver',
      parameters: {
        'contractId': contractId,
        'deliverContractRequest': deliverContractRequest.toJson(),
      },
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
