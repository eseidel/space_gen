class ContractDeliverGood {
  ContractDeliverGood({
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
}
