import 'package:spacetraders/model/public_agent.dart';

class GetAgent200Response {
  GetAgent200Response({required this.data});

  factory GetAgent200Response.fromJson(Map<String, dynamic> json) {
    return GetAgent200Response(
      data: PublicAgent.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final PublicAgent data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
