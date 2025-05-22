import 'package:spacetraders/model/agent.dart';

class GetMyAgent200Response {
  GetMyAgent200Response({required this.data});

  factory GetMyAgent200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAgent200Response(
      data: Agent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Agent data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
