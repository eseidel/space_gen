import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';

class AcceptContract200Response {
  AcceptContract200Response({required this.data});

  factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
    return AcceptContract200Response(
      data: AcceptContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final AcceptContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class AcceptContract200ResponseData {
  AcceptContract200ResponseData({required this.contract, required this.agent});

  factory AcceptContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return AcceptContract200ResponseData(
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
