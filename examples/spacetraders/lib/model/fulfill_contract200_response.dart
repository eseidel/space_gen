import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';

class FulfillContract200Response {
  FulfillContract200Response({required this.data});

  factory FulfillContract200Response.fromJson(Map<String, dynamic> json) {
    return FulfillContract200Response(
      data: FulfillContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final FulfillContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class FulfillContract200ResponseData {
  FulfillContract200ResponseData({required this.contract, required this.agent});

  factory FulfillContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return FulfillContract200ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );
  }

  final Contract contract;
  final Agent agent;

  Map<String, dynamic> toJson() {
    return {'contract': contract.toJson(), 'agent': agent.toJson()};
  }
}
