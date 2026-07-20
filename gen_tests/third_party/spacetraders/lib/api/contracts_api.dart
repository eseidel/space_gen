import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/accept_contract200_response.dart';
import 'package:spacetraders/messages/deliver_contract200_response.dart';
import 'package:spacetraders/messages/deliver_contract_request.dart';
import 'package:spacetraders/messages/fulfill_contract200_response.dart';
import 'package:spacetraders/messages/get_contract200_response.dart';
import 'package:spacetraders/messages/get_contracts200_response.dart';

/// The contracts endpoints contain actions that relate to contracts. Contracts
/// are agreements between agents and factions to perform certain services in
/// exchange for a reward.
class ContractsApi {
  ContractsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List Contracts
  /// Return a paginated list of all your contracts.
  Future<GetContracts200Response> getContracts({
    int? page = 1,
    int? limit = 10,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 20);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/contracts',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetContracts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Contract
  /// Get the details of a specific contract.
  Future<GetContract200Response> getContract(String contractId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/contracts/{contractId}'.replaceAll(
        '{contractId}',
        Uri.encodeComponent(contractId),
      ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Accept Contract
  /// Accept a contract by ID.
  ///
  /// You can only accept contracts that were offered to you, were not
  /// accepted yet, and whose deadlines has not passed yet.
  Future<AcceptContract200Response> acceptContract(String contractId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/accept'.replaceAll(
        '{contractId}',
        Uri.encodeComponent(contractId),
      ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AcceptContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Fulfill Contract
  /// Fulfill a contract. Can only be used on contracts that have all of their
  /// delivery terms fulfilled.
  Future<FulfillContract200Response> fulfillContract(String contractId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/fulfill'.replaceAll(
        '{contractId}',
        Uri.encodeComponent(contractId),
      ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FulfillContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Deliver Cargo to Contract
  /// Deliver cargo to a contract.
  ///
  /// In order to use this API, a ship must be at the delivery location
  /// (denoted in the delivery terms as `destinationSymbol` of a contract) and
  /// must have a number of units of a good required by this contract in its
  /// cargo.
  ///
  /// Cargo that was delivered will be removed from the ship's cargo.
  Future<DeliverContract200Response> deliverContract(
    String contractId,
    DeliverContractRequest deliverContractRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/my/contracts/{contractId}/deliver'.replaceAll(
        '{contractId}',
        Uri.encodeComponent(contractId),
      ),
      body: deliverContractRequest.toJson(),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeliverContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
