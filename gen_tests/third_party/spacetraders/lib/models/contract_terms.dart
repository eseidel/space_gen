import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/contract_deliver_good.dart';
import 'package:spacetraders/models/contract_payment.dart';

/// {@template contract_terms}
/// The terms to fulfill the contract.
/// {@endtemplate}
@immutable
class ContractTerms {
  /// {@macro contract_terms}
  const ContractTerms({
    required this.deadline,
    required this.payment,
    this.deliver,
  });

  /// Converts a `Map<String, dynamic>` to a [ContractTerms].
  factory ContractTerms.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContractTerms',
      json,
      () => ContractTerms(
        deadline: DateTime.parse(json['deadline'] as String),
        payment: ContractPayment.fromJson(
          json['payment'] as Map<String, dynamic>,
        ),
        deliver: (json['deliver'] as List?)
            ?.map<ContractDeliverGood>(
              (e) => ContractDeliverGood.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
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

  /// The deadline for the contract.
  final DateTime deadline;

  /// Payments for the contract.
  final ContractPayment payment;

  /// The cargo that needs to be delivered to fulfill the contract.
  final List<ContractDeliverGood>? deliver;

  /// Converts a [ContractTerms] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'deadline': deadline.toIso8601String(),
      'payment': payment.toJson(),
      'deliver': deliver?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([deadline, payment, listHash(deliver)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContractTerms &&
        deadline == other.deadline &&
        payment == other.payment &&
        listsEqual(deliver, other.deliver);
  }
}
