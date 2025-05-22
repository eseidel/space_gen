import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/get_agent200_response.dart';
import 'package:spacetraders/model/get_agents200_response.dart';
import 'package:spacetraders/model/get_my_agent200_response.dart';
import 'package:spacetraders/model/get_my_agent_events200_response.dart';

class AgentsApi {
  Future<GetAgents200Response> getAgents(int page, int limit) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/agents'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'page': page, 'limit': limit}),
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
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/agents/%7BagentSymbol%7D'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'agentSymbol': agentSymbol}),
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
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/agent'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
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
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/agent/events'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
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
