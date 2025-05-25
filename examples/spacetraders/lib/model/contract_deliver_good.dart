import 'package:meta/meta.dart';

@immutable
class ContractDeliverGood {
  const ContractDeliverGood({
    required this.tradeSymbol,
    required this.destinationSymbol,
    required this.unitsRequired,
    required this.unitsFulfilled,
  });

  factory ContractDeliverGood.fromJson(Map<String, dynamic> json) {
    return ContractDeliverGood(
      tradeSymbol: json['tradeSymbol'] as String,
      destinationSymbol: json['destinationSymbol'] as String,
      unitsRequired: json['unitsRequired'] as int,
      unitsFulfilled: json['unitsFulfilled'] as int,
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

  final String tradeSymbol;
  final String destinationSymbol;
  final int unitsRequired;
  final int unitsFulfilled;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol,
      'destinationSymbol': destinationSymbol,
      'unitsRequired': unitsRequired,
      'unitsFulfilled': unitsFulfilled,
    };
  }

  @override
  int get hashCode => Object.hash(
    tradeSymbol,
    destinationSymbol,
    unitsRequired,
    unitsFulfilled,
  );

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
