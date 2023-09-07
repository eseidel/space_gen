import 'package:spacetraders/model/agent.dart';

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
