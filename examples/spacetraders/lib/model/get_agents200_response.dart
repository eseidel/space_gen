import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/meta.dart';

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
