import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template contract_deliver_good}
/// The details of a delivery contract. Includes the type of good, units needed,
/// and the destination.
/// {@endtemplate}
@immutable
class ContractDeliverGood {
  /// {@macro contract_deliver_good}
  const ContractDeliverGood({
    required this.tradeSymbol,
    required this.destinationSymbol,
    required this.unitsRequired,
    required this.unitsFulfilled,
  });

  /// Converts a `Map<String, dynamic>` to a [ContractDeliverGood].
  factory ContractDeliverGood.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContractDeliverGood',
      json,
      () => ContractDeliverGood(
        tradeSymbol: json['tradeSymbol'] as String,
        destinationSymbol: json['destinationSymbol'] as String,
        unitsRequired: json['unitsRequired'] as int,
        unitsFulfilled: json['unitsFulfilled'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContractDeliverGood? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContractDeliverGood.fromJson(json);
  }

  /// The symbol of the trade good to deliver.
  final String tradeSymbol;

  /// The destination where goods need to be delivered.
  final String destinationSymbol;

  /// The number of units that need to be delivered on this contract.
  final int unitsRequired;

  /// The number of units fulfilled on this contract.
  final int unitsFulfilled;

  /// Converts a [ContractDeliverGood] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol,
      'destinationSymbol': destinationSymbol,
      'unitsRequired': unitsRequired,
      'unitsFulfilled': unitsFulfilled,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    tradeSymbol,
    destinationSymbol,
    unitsRequired,
    unitsFulfilled,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContractDeliverGood &&
        tradeSymbol == other.tradeSymbol &&
        destinationSymbol == other.destinationSymbol &&
        unitsRequired == other.unitsRequired &&
        unitsFulfilled == other.unitsFulfilled;
  }
}
