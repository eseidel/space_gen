import 'package:spacetraders/model/agent_event.dart';

class GetMyAgentEvents200Response {
  GetMyAgentEvents200Response({required this.data});

  factory GetMyAgentEvents200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAgentEvents200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<AgentEvent>(
                (e) => AgentEvent.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  final List<AgentEvent> data;

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }
}
