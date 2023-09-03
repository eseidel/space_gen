import 'package:spacetraders/src/model/contract_payment.dart';
import 'package:spacetraders/src/model/contract_deliver_good.dart';

class ContractTerms {
  ContractTerms({
    required this.deadline,
    required this.payment,
    required this.deliver,
  });

  factory ContractTerms.fromJson(Map<String, dynamic> json) {
    return ContractTerms(
      deadline: json['deadline'] as String,
      payment:
          ContractPayment.fromJson(json['payment'] as Map<String, dynamic>),
      deliver: (json['deliver'] as List<dynamic>)
          .map<ContractDeliverGood>(
              (e) => ContractDeliverGood.fromJson(e as Map<String, dynamic>),)
          .toList(),
    );
  }

  final String deadline;
  final ContractPayment payment;
  final List<ContractDeliverGood> deliver;

  Map<String, dynamic> toJson() {
    return {
      'deadline': deadline,
      'payment': payment.toJson(),
      'deliver': deliver.map((e) => e.toJson()).toList(),
    };
  }
}
