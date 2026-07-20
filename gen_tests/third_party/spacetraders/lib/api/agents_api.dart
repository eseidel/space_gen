import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/get_agent200_response.dart';
import 'package:spacetraders/messages/get_agents200_response.dart';
import 'package:spacetraders/messages/get_my_agent200_response.dart';
import 'package:spacetraders/messages/get_my_agent_events200_response.dart';

/// The agents endpoints contain actions that relate to agents. Both your own
/// and other agents.
class AgentsApi {
  AgentsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List all public agent details.
  /// List all public agent details.
  Future<GetAgents200Response> getAgents({
    int? page = 1,
    int? limit = 10,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 20);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/agents',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetAgents200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get public details for a specific agent.
  /// Get public details for a specific agent.
  Future<GetAgent200Response> getAgent(String agentSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/agents/{agentSymbol}'.replaceAll(
        '{agentSymbol}',
        Uri.encodeComponent(agentSymbol),
      ),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetAgent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Agent
  /// Fetch your agent's details.
  Future<GetMyAgent200Response> getMyAgent() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/agent',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyAgent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Agent Events
  /// Get recent events for your agent.
  Future<GetMyAgentEvents200Response> getMyAgentEvents() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/agent/events',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyAgentEvents200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
