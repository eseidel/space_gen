import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model/get_agent200_response.dart';
import 'package:spacetraders/model/get_agents200_response.dart';
import 'package:spacetraders/model/get_my_agent200_response.dart';
import 'package:spacetraders/model/get_my_agent_events200_response.dart';

class AgentsApi {
  AgentsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetAgents200Response> getAgents({
    int? page = 1,
    int? limit = 10,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/agents',
      queryParameters: {'page': page.toString(), 'limit': limit.toString()},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetAgents200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getAgents',
    );
  }

  Future<GetAgent200Response> getAgent(String agentSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/agents/{agentSymbol}'.replaceAll('{agentSymbol}', agentSymbol),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetAgent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getAgent',
    );
  }

  Future<GetMyAgent200Response> getMyAgent() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/agent',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyAgent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMyAgent',
    );
  }

  Future<GetMyAgentEvents200Response> getMyAgentEvents() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/agent/events',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyAgentEvents200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getMyAgentEvents',
    );
  }
}
