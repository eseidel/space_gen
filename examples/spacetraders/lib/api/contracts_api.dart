import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model/accept_contract200_response.dart';
import 'package:spacetraders/model/deliver_contract200_response.dart';
import 'package:spacetraders/model/deliver_contract_request.dart';
import 'package:spacetraders/model/fulfill_contract200_response.dart';
import 'package:spacetraders/model/get_contract200_response.dart';
import 'package:spacetraders/model/get_contracts200_response.dart';

class ContractsApi {
  ContractsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetContracts200Response> getContracts({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/contracts',
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetContracts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getContracts',
    );
  }

  Future<GetContract200Response> getContract(String contractId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/contracts/{contractId}'.replaceAll('{contractId}', contractId),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getContract',
    );
  }

  Future<AcceptContract200Response> acceptContract(String contractId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/accept'.replaceAll(
        '{contractId}',
        contractId,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AcceptContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $acceptContract',
    );
  }

  Future<FulfillContract200Response> fulfillContract(String contractId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/fulfill'.replaceAll(
        '{contractId}',
        contractId,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FulfillContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $fulfillContract',
    );
  }

  Future<DeliverContract200Response> deliverContract(
    String contractId,
    DeliverContractRequest deliverContractRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/deliver'.replaceAll(
        '{contractId}',
        contractId,
      ),
      bodyJson: deliverContractRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeliverContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $deliverContract',
    );
  }
}
