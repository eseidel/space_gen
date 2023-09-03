import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:spacetraders/src/model/agent.dart';
import 'package:spacetraders/src/model/meta.dart';

class AgentsApi {
  Future<GetMyAgent200Response> getMyAgent() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/agent'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetMyAgent200Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,);
    } else {
      throw Exception('Failed to load getMyAgent');
    }
  }

  Future<GetAgents200Response> getAgents() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/agents'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetAgents200Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,);
    } else {
      throw Exception('Failed to load getAgents');
    }
  }

  Future<GetAgent200Response> getAgent() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/agents/%7BagentSymbol%7D'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetAgent200Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,);
    } else {
      throw Exception('Failed to load getAgent');
    }
  }
}

class GetMyAgent200Response {
  GetMyAgent200Response({
    required this.data,
  });

  factory GetMyAgent200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAgent200Response(
      data: Agent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Agent data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class GetAgents200Response {
  GetAgents200Response({
    required this.data,
    required this.meta,
  });

  factory GetAgents200Response.fromJson(Map<String, dynamic> json) {
    return GetAgents200Response(
      data: (json['data'] as List<dynamic>)
          .map<Agent>((e) => Agent.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Agent> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class GetAgent200Response {
  GetAgent200Response({
    required this.data,
  });

  factory GetAgent200Response.fromJson(Map<String, dynamic> json) {
    return GetAgent200Response(
      data: Agent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Agent data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
