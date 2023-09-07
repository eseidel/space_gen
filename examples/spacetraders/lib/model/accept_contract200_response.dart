import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';

class AcceptContract200Response {
  AcceptContract200Response({
    required this.data,
  });

  factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
    return AcceptContract200Response(
      data: AcceptContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final AcceptContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AcceptContract200ResponseData {
  AcceptContract200ResponseData({
    required this.agent,
    required this.contract,
  });

  factory AcceptContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return AcceptContract200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  final Agent agent;
  final Contract contract;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'contract': contract.toJson(),
    };
  }
}
