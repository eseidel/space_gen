import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template contract_payment}
/// Payments for the contract.
/// {@endtemplate}
@immutable
class ContractPayment {
  /// {@macro contract_payment}
  const ContractPayment({required this.onAccepted, required this.onFulfilled});

  /// Converts a `Map<String, dynamic>` to a [ContractPayment].
  factory ContractPayment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContractPayment',
      json,
      () => ContractPayment(
        onAccepted: json['onAccepted'] as int,
        onFulfilled: json['onFulfilled'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContractPayment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContractPayment.fromJson(json);
  }

  /// The amount of credits received up front for accepting the contract.
  final int onAccepted;

  /// The amount of credits received when the contract is fulfilled.
  final int onFulfilled;

  /// Converts a [ContractPayment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'onAccepted': onAccepted, 'onFulfilled': onFulfilled};
  }

  @override
  int get hashCode => Object.hashAll([onAccepted, onFulfilled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContractPayment &&
        onAccepted == other.onAccepted &&
        onFulfilled == other.onFulfilled;
  }
}
