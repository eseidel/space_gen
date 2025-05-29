import 'package:meta/meta.dart';
import 'package:spacetraders/model/contract_deliver_good.dart';
import 'package:spacetraders/model/contract_payment.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class ContractTerms {
  const ContractTerms({
    required this.deadline,
    required this.payment,
    this.deliver = const [],
  });

  factory ContractTerms.fromJson(Map<String, dynamic> json) {
    return ContractTerms(
      deadline: DateTime.parse(json['deadline'] as String),
      payment: ContractPayment.fromJson(
        json['payment'] as Map<String, dynamic>,
      ),
      deliver:
          (json['deliver'] as List?)
              ?.map<ContractDeliverGood>(
                (e) => ContractDeliverGood.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContractTerms? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContractTerms.fromJson(json);
  }

  final DateTime deadline;
  final ContractPayment payment;
  final List<ContractDeliverGood>? deliver;

  Map<String, dynamic> toJson() {
    return {
      'deadline': deadline.toIso8601String(),
      'payment': payment.toJson(),
      'deliver': deliver?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(deadline, payment, deliver);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContractTerms &&
        deadline == other.deadline &&
        payment == other.payment &&
        listsEqual(deliver, other.deliver);
  }
}
