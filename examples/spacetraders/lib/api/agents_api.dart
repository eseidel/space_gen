import 'dart:async';
import 'dart:convert';

import 'package:spacetraders/api_client.dart';
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

    if (response.statusCode == 200) {
      return GetAgents200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getAgents');
    }
  }

  Future<GetAgent200Response> getAgent(String agentSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/agents/{agentSymbol}'.replaceAll('{agentSymbol}', agentSymbol),
    );

    if (response.statusCode == 200) {
      return GetAgent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getAgent');
    }
  }

  Future<GetMyAgent200Response> getMyAgent() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/agent',
    );

    if (response.statusCode == 200) {
      return GetMyAgent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyAgent');
    }
  }

  Future<GetMyAgentEvents200Response> getMyAgentEvents() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/agent/events',
    );

    if (response.statusCode == 200) {
      return GetMyAgentEvents200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getMyAgentEvents');
    }
  }
}
