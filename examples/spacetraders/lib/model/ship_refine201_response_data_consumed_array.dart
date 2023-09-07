class ShipRefine201ResponseDataConsumedArray {
  ShipRefine201ResponseDataConsumedArray({
    required this.tradeSymbol,
    required this.units,
  });

  factory ShipRefine201ResponseDataConsumedArray.fromJson(
    Map<String, dynamic> json,
  ) {
    return ShipRefine201ResponseDataConsumedArray(
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
