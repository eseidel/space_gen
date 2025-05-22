import 'package:spacetraders/model/contract.dart';

class NegotiateContract201ResponseData {
  NegotiateContract201ResponseData({required this.contract});

  factory NegotiateContract201ResponseData.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  final Contract contract;

  Map<String, dynamic> toJson() {
    return {'contract': contract.toJson()};
  }
}
