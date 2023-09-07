class ShipRefine201ResponseDataProducedArray {
  ShipRefine201ResponseDataProducedArray({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataProducedArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataProducedArray(
      tradeSymbol: json['tradeSymbol'] as String,
      units: json['units'] as int,
    );
  }

  final String tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }
}
