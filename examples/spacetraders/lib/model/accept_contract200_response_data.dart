import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';

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
